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
DIGITO = [0-9]
INTEIRO = {DIGITO}+
DECIMAL = {INTEIRO}"."{DIGITO}+
NUMERO_EXPOENTE = {INTEIRO}"^"{DIGITO}+
%%

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