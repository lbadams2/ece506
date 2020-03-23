import matplotlib.pyplot as plt

# plot mesi and dragon 1-way as cache size changes 
x = [128, 256, 512]
mesi = [.0259, .0219, .0209]
dragon = [.013, .0072, .0056]
plt.plot(x, mesi) # mesi
plt.plot(x, dragon) # dragon
plt.xlabel('Cache Size')
plt.ylabel('Miss Rate')
plt.title('MESI and Dragon miss rate 1 way assoc 64B block size')
plt.legend(['MESI', 'Dragon'], loc='upper left')
plt.savefig('1way_cache_size.png')
plt.clf()

# plot mesi and dragon 1-way as block size changes
x = [32, 64, 128, 256]
mesi = [.0243, .0219, .0209, .02]
dragon = [.0083, .0072, .0068, .0063]
plt.plot(x, mesi) # mesi
plt.plot(x, dragon) # dragon
plt.xlabel('Block Size')
plt.ylabel('Miss Rate')
plt.title('MESI and Dragon miss rate 1 way assoc 256KB cache size')
plt.legend(['MESI', 'Dragon'], loc='upper left')
plt.savefig('1way_block_size.png')
plt.clf()

# plot mesi and dragon 4-way as cache size changes 
x = [128, 256, 512]
mesi = [.0185, .0178, .0177]
dragon = [.0054, .0015, .0005]
plt.plot(x, mesi) # mesi
plt.plot(x, dragon) # dragon
plt.xlabel('Cache Size')
plt.ylabel('Miss Rate')
plt.title('MESI and Dragon miss rate 4 way assoc 64B block size')
plt.legend(['MESI', 'Dragon'], loc='upper left')
plt.savefig('4way_cache_size.png')
plt.clf()

# plot mesi and dragon 4-way as block size changes
x = [32, 64, 128, 256]
mesi = [.0195, .0178, .0169, .0161]
dragon = [.0018, .0015, .0014, .0013]
plt.plot(x, mesi) # mesi
plt.plot(x, dragon) # dragon
plt.xlabel('Block Size')
plt.ylabel('Miss Rate')
plt.title('MESI and Dragon miss rate 4 way assoc 256KB cache size')
plt.legend(['MESI', 'Dragon'], loc='upper left')
plt.savefig('4way_block_size.png')
plt.clf()

# plot dragon bus rds and upds and block size changes
x = [32, 64, 128, 256]
bus_rds = [331743, 285490, 271175, 264752]
plt.plot(x, bus_rds) # mesi
plt.xlabel('Block Size')
plt.ylabel('Bus Reads')
plt.title('Dragon bus rds 4 way assoc 256KB cache size')
plt.savefig('dragon_bus_rds.png')
plt.clf()

# plot dragon bus upds and block size changes
x = [32, 64, 128, 256]
bus_upds = [63902027, 63967158, 63822626, 63589251]
plt.plot(x, bus_upds) # dragon
plt.xlabel('Block Size')
plt.ylabel('Bus Updates')
plt.title('Dragon bus upds 4 way assoc 256KB cache size')
plt.savefig('dragon_bus_upds.png')