package application;

%%

%{
	private void imprimir(String descricao, String lexema){
	
		System.out.println(lexema + "-" + descricao);
	}
%}

%class AnalisadorLexico
%type void

BRANCO = [\n||\t|\r]
ADD_OP = "+"
SUB_OP = "-"
MULT_OP = "*"
DIV_OP = "/"
ASSIGN_OP = "="
LEFT_PAREN = "("
RIGHT_PAREN = ")"
DIGITO = [0-9]
LETTER = [a-zA-Z]
INT_LIT = {DIGITO}+
DECIMAL = {INT_LIT}"."{DIGITO}+
NUMERO_EXPOENTE = {INT_LIT}"^"{DIGITO}+
%%

{BRANCO}		    {imprimir("Next lexeme is: Espaco, Next token is: em branco ", yytext());}
{ADD_OP}			{imprimir("Next lexeme is: +, Next token is: 21", yytext());}
{SUB_OP}		    {imprimir("Next lexeme is: -, Next token is: 22", yytext());}
{MULT_OP}			{imprimir("Next lexeme is: *, Next token is: 23", yytext());}
{DIV_OP}			{imprimir("Next lexeme is: /, Next token is: 24", yytext());}
{ASSIGN_OP}			{imprimir("Next lexeme is: =, Next token is: 20", yytext());}
{DECIMAL}		    {imprimir("Next lexeme is: DECIMAL, Next token is:  X", yytext());} 
{LETTER}		    {imprimir("Next lexeme is: LETTER, Next token is:  0", yytext());} 
{NUMERO_EXPOENTE}   {imprimir("Next lexeme is: ^, Next token is: X", yytext());} 
{INT_LIT}		    {imprimir("Next lexeme is: INT_LIT, Next token is:  10", yytext());}
{LEFT_PAREN}	    {imprimir("Next lexeme is: (, Next token is: 25 ", yytext());}
{RIGHT_PAREN}	    {imprimir("Next lexeme is: ), Next token is: 26 ", yytext());}
<<EOF>> {
    System.out.println("Fim do arquivo alcançado.");
    yyclose(); 
    return; 
}

. { throw new RuntimeException("Caractere invalido" + yytext()); }