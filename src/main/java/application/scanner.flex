package application;
import java_cup.runtime.Symbol;

%%

%class Scanner
%cup
%full
%line
%char
%eofval{
	return new Symbol(Tokens.EOF,new String("Fim do arquivo"));
%eofval}

digito = [0-9]
letra = [a-zA-Z]
id = {letra}({letra}|{digito}|"_")*
espaco = \t|\f|" "|\r|\n

%%

";"			{return new Symbol(Tokens.SEMI, yytext());}
"="			{return new Symbol(Tokens.ATRIB, yytext());}
"-"			{return new Symbol(Tokens.MENOS, yytext());}
"+"			{return new Symbol(Tokens.MAIS, yytext());}
"*"			{return new Symbol(Tokens.VEZES, yytext());}
"("			{return new Symbol(Tokens.LPAREN, yytext());}
")"			{return new Symbol(Tokens.RPAREN, yytext());}
{id}		{return new Symbol(Tokens.ID, yytext());}
{digito}+	{return new Symbol(Tokens.NUMERO, new Integer(yytext()));}
{espaco}	{}
.           { System.out.println("Caracter ilegal: " + yytext()); }
