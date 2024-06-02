PROG = Main
SOURCES = In.java IPiece.java Piece.java MergedPiece.java Dominos.java Main.java
OBJECTS = $(SOURCES:.java=.class)


build: $(OBJECTS)
	javac $(SOURCES)

clean:
	-@ rm -f *.class

run:
	java Main $(ARG)