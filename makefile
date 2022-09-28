CC := gcc

ifeq ($(DEBUG),1)
	CFLAGS := -Wall -O0 -g
else
	# CFLAGS := -Wall -O1
	CFLAGS := -O0
endif

LDFLAGS := -l sqlite3 -pthread  

# -fsanitize=address -Wall

run: sniffer.o hashtable.o 
	$(CC) -o run sniffer.o  hashtable.o $(LDFLAGS)
	
sniffer.o: sniffer.c
	$(CC) $(CFLAGS) -c sniffer.c $(LDFLAGS)
hashtable.o: hashtable.c hashtable.h
	$(CC) $(CFLAGS) -c hashtable.c $(LDFLAGS) 
# db_function.o:db_function.c db_function.h
# 	$(CC) $(CFLAGS) -c db_function.c $(LDFLAGS)
# list.o: list.c list.h
# 	$(CC) $(CFLAGS) -c list.c $(LDFLAGS)
clean:
	rm  -f *.o run log.txt
	
