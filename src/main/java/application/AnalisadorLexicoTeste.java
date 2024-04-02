package application;

import java.io.IOException;
import java.io.StringReader;

public class AnalisadorLexicoTeste {

    public static void main(String[] args) throws IOException {

        String expr = "1 * 2.5 + 5 + 4.75 - 2.8 * 3.14"
            + "2.75 * 9.3 + (8.6 * 15.01) + 2^3";

        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(expr));
        lexical.yylex();

    }

}
