.PHONY: all build

PROG = Main
DIR = ./src/main/java/application/
C_OUTPUT_PARSER = Parser
C_OUTPUT_TOKENS = Tokens
F_OUTPUT_SCANNER = Scanner
JAR_FILE = ./target/linguagens-t1-1.0.1-jar-with-dependencies.jar
RM = rm
MV = mv

build:
	java -jar ./lib/jflex.jar ${DIR}scanner.flex
	java -jar ./lib/jcup.jar -parser ${C_OUTPUT_PARSER} -symbols ${C_OUTPUT_TOKENS} ${DIR}parser.cup
	mv ./Parser.java ${DIR}
	mv ./Tokens.java ${DIR}

package:
	mvn package

run:
	java -jar ${JAR_FILE} /mnt/h/projects/current/PUCRS/linguagens/jcup-t2/input/entrada.txt

clean:
	${RM} ${DIR}${C_OUTPUT_PARSER}.java
	${RM} ${DIR}${C_OUTPUT_TOKENS}.java
	${RM} ${DIR}${F_OUTPUT_SCANNER}.java