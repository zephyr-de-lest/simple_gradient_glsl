CFILES = shader.cpp main.cpp
CFLAGS = -O3 -c -Wall

INCLUDES = -I/usr/include -I/usr/local/include/ -I../common  `pkg-config --cflags glfw3`
 
LIBS = -lm -L/usr/local/lib -lGLEW `pkg-config --static --libs glfw3` -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo -Wno-write-strings
CC = g++ -std=c++11
OBJECTS=$(CFILES:.cpp=.o)
EXECUTABLE=main

all: $(CFILES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(INCLUDES) $(OBJECTS) -o $@ $(LIBS)
.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@
	
clean:
	rm -v -f *~ ../common/*.o *.o *.obj $(EXECUTABLE)
