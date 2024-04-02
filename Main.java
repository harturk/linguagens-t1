import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {

    public static int charClass;

    public static char[] lexeme = new char[100];

    public static char nextChar;

    public static int lexLen;

    public static int token;

    public static int nextToken;

    public static int INT_LIT = 10;

    public static int IDENT = 11;

    public static int ASSIGN_OP = 20;

    public static int ADD_OP = 21;

    public static int SUB_OP = 22;

    public static int MULT_OP = 23;

    public static int DIV_OP = 24;

    public static int LEFT_PAREN = 25;

    public static int RIGHT_PAREN = 26;

    public static int LETTER = 0;

    public static int DIGIT = 1;

    public static int UNKNOWN = 99;

    private static BufferedReader in_fp;

    private static int position = 0;

    /**
     * Runs the scanner on input files.
     *
     * This is a standalone scanner, it will print any unmatched
     * text to System.out unchanged.
     *
     * @param argv the command line, contains the filenames to run
     *             the scanner on.
     */
    public static void main(String[] args) {
        try {
            in_fp = new BufferedReader(new FileReader("entrada.txt"));
            String line;
            while ((line = in_fp.readLine()) != null) {
                position = 0;
                lookup(line.charAt(position));
            }
        } catch (IOException e) {
            System.out.println("Erro ao ler o arquivo.");
        }
    }

    private static boolean reconhecerIdentificador(String entrada) {
        estadoAtual = 0;
        for (int i = 0; i < entrada.length(); i++) {
            char caractere = entrada.charAt(i);
            transicao(caractere);
        }
        return estadoAtual == 1; // Estado FINAL
    }

    private static void transicao(char caractere) {
        if (estadoAtual == 0) {
            if (Character.isDigit(caractere)) {
                estadoAtual = -1; // Estado inválido
            } else {
                estadoAtual = 1;
            }
        }
    }

    public static void addChar() {
        if (lexLen <= 98) {
            lexeme[lexLen++] = nextChar;
            lexeme[lexLen++] = 0;
        } else {
            System.out.println("Error - lexeme is too long");
        }
    }

    public static void getChar() {
        position += 1;
        if ((nextChar = get))
    }

    public static void getNonBlank() {
        while (Character.isSpaceChar(nextChar)) {
            getChar();
        }
    }

    public static int lookup(char ch) {
        switch (ch) {
            case '(':
                addChar();
                nextToken = LEFT_PAREN;
                break;
            case ')':
                addChar();
                nextToken = RIGHT_PAREN;
                break;
            case '+':
                addChar();
                nextToken = ADD_OP;
                break;
            case '-':
                addChar();
                nextToken = SUB_OP;
                break;
            case '*':
                addChar();
                nextToken = MULT_OP;
                break;
            case '/':
                addChar();
                nextToken = DIV_OP;
                break;
            default:
                addChar();
                nextToken = EOF;
                break;
        }
    }
}