sources=a.c b.c d.c
objects =$(sources:.c=.o)
 
all:
	echo "objects=$(objects)"	
	echo "sources=$(sources)"
