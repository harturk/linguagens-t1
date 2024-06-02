package application;

import java.io.File;
import java.io.FileReader;

import java_cup.runtime.Symbol;

public class Main {

    public static void main(String[] args) {
        try {

            /*
             * Comandos (no prompt):
             * java -jar jflex-full-1.8.2.jar scanner.flex
             * java -jar java-cup-11b.jar -parser Parser -symbols Tokens parser.cup
             */

            // Runtime r = Runtime.getRuntime();
            // Process p;
            // posicionando na pasta src e chamar o flex por linha de comando
            // vai gerar a classe Scanner.java
            // p = r.exec(
            // new String[] { "java", "-jar",
            // "H:\\projects\\current\\PUCRS\\linguagens\\jcup-t2\\src\\main\\java\\application\\jcup\\jflex-full-1.8.2.jar",
            // "H:\\projects\\current\\PUCRS\\linguagens\\jcup-t2\\src\\main\\java\\application\\scanner.flex"
            // },
            // null, new
            // File("H:\\projects\\current\\PUCRS\\linguagens\\jcup-t2\\src\\main\\java\\application"));
            // System.out.println(p.waitFor());// se ok, a saída será 0*/

            // p = r.exec(new String[] { "java", "-jar",
            // "H:\\projects\\current\\PUCRS\\linguagens\\jcup-t2\\src\\main\\java\\application\\jcup\\java-cup-11b.jar",
            // "-parser", "Parser",
            // "-symbols", "Tokens",
            // "H:\\projects\\current\\PUCRS\\linguagens\\jcup-t2\\src\\main\\java\\application\\parser.cup"
            // },
            // null,
            // new
            // File("H:\\projects\\current\\PUCRS\\linguagens\\jcup-t2\\src\\main\\java\\application"));
            // System.out.println(p.waitFor());// se ok, a saída será 0*/

            Scanner scanner = new Scanner(
                    new FileReader("H:\\projects\\current\\PUCRS\\linguagens\\jcup-t2\\entrada.txt"));
            System.out.println("Análise Léxica: Lista de Tokens:");
            Symbol s = scanner.next_token();
            while (s.sym != Tokens.EOF) {
                System.out.printf("<%d, %s>\n", s.sym, s.value);
                s = scanner.next_token();
            }

            // criando o parser passando o scanner
            scanner = new Scanner(new FileReader("entrada.txt"));
            Parser parser = new Parser(scanner);
            parser.parse();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
