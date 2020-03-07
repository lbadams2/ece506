/************************************************************
                        Course          :       CSC456
                        Source          :       msi.cc
                        Instructor      :       Ed Gehringer
                        Email Id        :       efg@ncsu.edu
------------------------------------------------------------
        © Please do not replicate this code without consulting
                the owner & instructor! Thanks!
Code Integration : Tarun Govind Kesavamurthi
*************************************************************/
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
using namespace std;
#include "main.h"
#include "dragon.h"


/*
------------------------------------------------------
Don't modify the fucntions included in this section
------------------------------------------------------
*/
cache_line * Dragon::allocate_line_dir(ulong addr) {
        return NULL;
}
void Dragon::signalRd(ulong addr, int processor_number){
}
void Dragon::signalRdX(ulong addr, int processor_number){
}
void Dragon::signalUpgr(ulong addr, int processor_number){
}
void Dragon::Inv(ulong addr) {
}
void Dragon::Int(ulong addr) {
}
void Dragon::PrRdDir(ulong addr, int processor_number) {
}
void Dragon::PrWrDir(ulong addr, int processor_number) {
}
//-------------------------------------------------------------
//Section ends here. edit the functions in the section below 
//-------------------------------------------------------------

// write back(update for dragon) write allocate
// firefly is update protocol that also updates main memory
// misses enter from outside on state diagram because there is no invalid state, so can't have miss if addr maps to a block
void Dragon::PrRd(ulong addr, int processor_number) 
{
       //Processor Read
        cache_state state;
        reads++;
        current_cycle++;
        cache_line *line = find_line(addr);
        if (line == NULL) { // cold miss or line was evicted
                read_misses++;
                cache_line *newline = allocate_line(addr); // LRU updated in this method
                bus_reads++;
                sendBusRd(addr, processor_number); // this sends the bus rd to all procs but processor_number
                int count = sharers(addr);
                if (count) {
                        //cache2cache++; // above bus rd retrieves value from another cache (not sure about this, may get from memory)
                        memory_transactions++;
                        newline->set_state(Sc);
                }
                else {
                        memory_transactions++; // above bus rd retrieves from memory
                        newline->set_state(E);
                }
        }
        else { // if hit do nothing because there is no invalid state
                // V, D, & S all have up to date cache so no bus/mem read happens
                state = line->get_state();
                if (state == M) {
                        update_LRU(line);
                }
                else if (state == Sc) {
                        update_LRU(line);
                }
                else if (state == Sm) {
                        update_LRU(line);
                }
                else if (state == E) {
                        update_LRU(line);
                }
        }
}

void Dragon::PrWr(ulong addr, int processor_number) 
{
        cache_state state;
        current_cycle++;
        writes++;
        cache_line *line = find_line(addr);
        if (line == NULL) {
                write_misses++;
                cache_line *newline = allocate_line(addr);// LRU updated in this method
                int count = sharers_exclude(addr, processor_number);
                if (count) {
                        sendBusRd(addr, processor_number); // get current value from another cache
                        //cache2cache++; // from above bus rd
                        memory_transactions++;
                        newline->set_state(Sm); // update value and post bus update to update other proc's caches
                        //bus_writes++;
                        bus_upgrades++; // not sure if this should be used for updates
                        sendBusUpgr(addr, processor_number); // really bus update
                        cache2cache++; // busupd (busupgr) is cache2cache
                }
                else {
                        sendBusRd(addr, processor_number); // issues bus read to get from memory
                        memory_transactions++; // from above bus rd
                        bus_reads++; // not sure if this should be here
                        newline->set_state(M);
                }
        }
        else {
                state = line->get_state();
                int shared_line = sharers(addr) > 1;
                if (state == Sm) {
                        update_LRU(line);
                        sendBusUpgr(addr, processor_number); // why do this if transitioning to m (no other copies)?
                        bus_upgrades++;
                        if(!shared_line) {
                                line->set_state(M);       
                        }
                        cache2cache++; // increment cache2cache for write also gets incremented on a read
                        // no memory transaction(just bus upgrade and cache hit) or intervention
                }
                else if (state == Sc) {
                        update_LRU(line);
                        sendBusUpgr(addr, processor_number);// why do this if transitioning to m (no other copies)?
                        bus_upgrades++;
                        cache2cache++;
                        if(shared_line) {
                                line->set_state(Sm);
                        }
                        else {
                                line->set_state(M);
                        }
                }
                else if (state == M) {
                        update_LRU(line);
                }
                else if(state == E) {
                        update_LRU(line);
                        line->set_state(M);
                }
                else {
                        //Else: You're not in the three valid states
                        cout << "PrWr: Invalid State " << state << endl;
                }
        }
}


void Dragon::BusRd(ulong addr)
{
        cache_state state;
        cache_line *line = find_line(addr);
        if (line != NULL) { // bus ops not valid if line not found so you don't flush stale data
                state = line->get_state();
                if (state == Sm) { // only owner of block has it in Sm
                        flushes++;
                        //cache2cache++; // picked up by other cache?
                        memory_transactions++;
                        write_backs++;
                        // not sure if this writes back to memory
                }
                else if (state == Sc) {
                        // don't flush, owner will flush, should be one block in Sm if there are blocks in Sc
                }
                else if (state == M) {
                        flushes++;
                        memory_transactions++;
                        //cache2cache++; // not sure here
                        line->set_state(Sm);
                        // not sure if this writes back to memory
                }
                else if(state == E) {
                        line->set_state(Sc);
                        // not sure about intervention
                }
                else {
                        //Else: You're not in the three valid states
                        cout << "BusRd: Invalid State " << state << endl;
                }
        }
}


void Dragon::BusRdX(ulong addr) 
{
 
}

// should be no mem tx or write backs in this method
void Dragon::BusUpgr(ulong addr) 
{
        cache_state state;
        cache_line *line = find_line(addr);
        if (line != NULL) { // bus ops not valid if line not found so you don't flush stale data
                state = line->get_state();
                if (state == Sm) { // only owner of block has it in Sm
                        cache2cache++; // executes "update" op to put the val from other cache in its cache
                        line->set_state(Sc);
                        // maybe intervention
                }
                else if(state == Sc) {
                        cache2cache++; // executes "update" op to put the val from other cache in its cache
                }
                // no bus upd for non shared states
        }
}

void Dragon::BusWr(ulong addr) 
{
      
}

// i think this corresponds to flushes in the bus transition diagram
bool Dragon::writeback_needed(cache_state state) 
{
    if (state == M || state == Sm)
    {
        return true;
    } else {
        return false;
    }
}

