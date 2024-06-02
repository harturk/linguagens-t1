package application;

import java.io.FileReader;

import java_cup.runtime.Symbol;

public class Main {

    public static void main(String[] args) {
        try {
            String path = args[0];
            System.out.println(path);
            Scanner scanner = new Scanner(new FileReader(path));
            System.out.println("Análise Léxica: Lista de Tokens:");
            Symbol s = scanner.next_token();
            while (s.sym != Tokens.EOF) {
                System.out.printf("<%d, %s>\n", s.sym, s.value);
                s = scanner.next_token();
            }

            // criando o parser passando o scanner
            scanner = new Scanner(new FileReader(path));
            Parser parser = new Parser(scanner);
            parser.parse();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
