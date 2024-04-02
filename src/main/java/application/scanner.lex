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
SOMA = "+"
SUBTRAI = "-"
MULTI = "*"
DIVID = "/"
LEFT_PAREN = "("
RIGHT_PAREN = ")"
INTEIRO = 0|[1-9][0-9]*

%%

{BRANCO}		{imprimir("Espaco em branco ", yytext());}
{SOMA}			{imprimir("Operador de soma ", yytext());}
{SUBTRAI}		{imprimir("Operador de subtracao", yytext());}
{MULTI}			{imprimir("Operador de multiplicacao", yytext());}
{DIVID}			{imprimir("Operador de divisao", yytext());}
{INTEIRO}		{imprimir("Numero inteiro ", yytext());}
{LEFT_PAREN}	{imprimir("Parenteses a esquerda ", yytext());}
{RIGHT_PAREN}	{imprimir("Parenteses a direita ", yytext());}

. { throw new RuntimeException("Caractere invalido" + yytext()); }