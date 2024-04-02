package application;

%%

%{
	private void imprimir(String descricao, String lexema){
	
		System.out.println(lexema + "-" + descricao);
	}
%}

%class AnalisadorLexico2
%type void

BRANCO = [\n||\t|\r]
SOMA = "+"
SUBTRAI = "-"
MULTI = "*"
DIVID = "/"
LEFT_PAREN = "("
RIGHT_PAREN = ")"
DIGITO = [0-9]
INTEIRO = {DIGITO}+
DECIMAL = {INTEIRO}"."{DIGITO}+
NUMERO_EXPOENTE = {INTEIRO}"^"{DIGITO}+
%%


"if"			{imprimir("IF_PAL,20", yytext());}
"then"			{imprimir("THEN_PAL,21", yytext());}
"else"			{imprimir("ELSE_PAL,22", yytext());}
"while"         {imprimir("WHILE_PAL,23", yytext());}
"do"            {imprimir("DO_PAL,24", yytext());}
"int"           {imprimir("INT_PAL,25", yytext());}
"float"         {imprimir("FLOAT_PAL,26", yytext());}
"switch"        {imprimir("SWITCH_PAL,27", yytext());}
{BRANCO}		{imprimir("Espaco em branco ", yytext());}
{SOMA}			{imprimir("Operador de soma ", yytext());}
{SUBTRAI}		{imprimir("Operador de subtracao", yytext());}
{MULTI}			{imprimir("Operador de multiplicacao", yytext());}
{DIVID}			{imprimir("Operador de divisao", yytext());}
{DECIMAL}		{imprimir("Numero decimal ", yytext());} 
{NUMERO_EXPOENTE} {imprimir("Numero com Expoente ", yytext());} 
{INTEIRO}		{imprimir("Numero inteiro ", yytext());}
{LEFT_PAREN}	{imprimir("Parenteses a esquerda ", yytext());}
{RIGHT_PAREN}	{imprimir("Parenteses a direita ", yytext());}
<<EOF>> {
    System.out.println("Fim do arquivo alcançado.");
    yyclose(); 
    return; 
}

. { throw new RuntimeException("Caractere invalido" + yytext()); }