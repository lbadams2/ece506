/************************************************************
                        Course          :       CSC456
                        Source          :       msi.cc
                        Instructor      :       Ed Gehringer
                        Email Id        :       efg@ncsu.edu
------------------------------------------------------------
        © Please do not replicate this code without consulting
                the owner & instructor! Thanks!
*************************************************************/

#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
using namespace std;
#include "main.h"
#include "mesi.h"
#include "cache.h"

// cache consists of cache lines, there is no actual data
// write back(invalidate for MESI) and write allocate cache
void MESI::PrRd(ulong addr, int processor_number) 
{
    cache_state state; // M, I, S, etc
    current_cycle++;
    reads++;
    cache_line * line = find_line(addr);
    int sharers = sharers_exclude(addr, processor_number);
    if (line == NULL) { // cold miss or line was evicted
        read_misses++;
        cache_line *newline = allocate_line(addr); // this will get a free or LRU line, and set its tag and state
        memory_transactions++;
        if(sharers > 0)
          newline->set_state(S);
        else
          newline->set_state(E);
        bus_reads++;
        sendBusRd(addr, processor_number); // this sends the bus rd to all procs but processor_number, another cache will flush if it has the block
        // could be cache2cache here
    }
    else { // potentially a hit
        state=line->get_state();                
        if (state == I){ // conflict miss
            read_misses++;
            cache_line *newline = allocate_line(addr); // this will get a free or LRU line, and set its tag and state
            memory_transactions++;
            // if there are other shared copies put it in S, otherwise put in E
            if(sharers > 0) {
                newline->set_state(S);
                I2S++;
            }
            else {
                newline->set_state(E);
                I2E++;
            }
            bus_reads++;
            sendBusRd(addr, processor_number); // another cache will flush if it has the block, else memory will reply with it
            // could be cache2cache here
        }
        else if (state == M || state == S || state == E){
            update_LRU(line);
        }
    }
}

void MESI::PrRdDir(ulong addr, int processor_number) {

}

void MESI::PrWrDir(ulong addr, int processor_number) {
}

void MESI::PrWr(ulong addr, int processor_number) 
{
    cache_state state;
    current_cycle++;
    writes++;
    cache_line * line = find_line(addr);
    if (line == NULL || line->get_state() == I){ // cold or conflict miss, same as MSI
          write_misses++;
          cache_line *newline = allocate_line(addr);
          memory_transactions++;
          I2M++;
          newline->set_state(M);
          bus_readxs++;
          sendBusRdX(addr, processor_number); // other proc will flush its block else it goes to memory
          // there could be cache2cache here
     }
    else
    { // hit
          state=line->get_state();
          if (state == M){ // same as MSI
              update_LRU(line);
          }
          else if (state == S){
              S2M++;
              line->set_state(M);
              update_LRU(line);
              bus_upgrades++;
              memory_transactions++;
              sendBusUpgr(addr, processor_number); // invalidate other caches
          }
          else if(state == E) {
              E2M++;
              line->set_state(M);
              update_LRU(line);
          }
      }
}

// since there is no data, don't have to implement flush
// cache2cache for flushopt?
// there might not be any cache2cache here, might all be flushes to memory
void MESI::BusRd(ulong addr) {
    cache_state state;
    cache_line * line=find_line(addr);
    if (line!=NULL) // bus ops not valid if line not found so you don't flush stale data
    {
        state = line->get_state();
        if (state == M) // same as MSI
        {
            flushes++;
            write_backs++; // need to write dirty val back to memory
            memory_transactions++; // from previous line
            // changing from less restrictive to more restrictive state (M to S) is a downgrade
            // a downgrade request in which the final state is shared is an intervention
            // one intervention request is when the snooper snoops a BusRd to cached block in M state            
            interventions++;
            line->set_state(S);
            M2S++;
        }
        // do a flushopt here for cache2cache transfer, msi doesn't do cache2cache
        else if(state == S) { 
          cache2cache++; // flushopt
          // no memory transaction i don't think
          // no write back, data didn't change
        }
        else if(state == E) {
          cache2cache++; // flushopt
          // not sure if this is intervention or not
          line->set_state(S);
          E2S++;
        }
        // do nothing for I
    }
}

// might be no cache2cache
void MESI::BusRdX(ulong addr) {
    cache_line * line=find_line(addr);
    if (line!=NULL) {
        cache_state state;
        state=line->get_state();
        if (state == S || state == E)
        {
            cache2cache++; // this is done so proc intending to write can get value from another cache rather than main memory
            invalidations++; // anytime state is changed to I
            line->set_state(I);
            // no transition counter to I, use invalidations counter instead
        }
        else if (state == M ) // same as MSI
        {
            flushes++;
            invalidations++;
            write_backs++;
            memory_transactions++;
            line->set_state(I);
        }
        // do nothing for I
    }
}

// this is only sent when a block in S writes and goes to M
// this just invalidates other caches, doesn't transfer data
void MESI::BusUpgr(ulong addr) {
    cache_line * line=find_line(addr);
    if (line!=NULL) {
        cache_state state;
        state=line->get_state();
        if(state == S) { // this lets other procs know that another proc modified, don't need val b/c could be modified several times
            invalidations++; // anytime state is changed to I
            line->set_state(I);
        }
    }
}


// only flush when in M state, other states use flushopt which doesn't write back to memory
// this is only used when a line gets evicted and need to decide to write its data back to memory
bool MESI::writeback_needed(cache_state state) {
    if (state == M)
    {
        return true;
    } else {
        return false;
    }
}

void MESI::signalRd(ulong addr, int processor_number){

}


void MESI::signalRdX(ulong addr, int processor_number){
	
}

void MESI::signalUpgr(ulong addr, int processor_number){

}

void MESI::Int(ulong addr) {
	
}


void MESI::Inv(ulong addr) {
	
}


cache_line * MESI::allocate_line_dir(ulong addr) {
  return NULL;
}
