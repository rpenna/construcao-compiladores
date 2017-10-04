parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class LCURLY field_decl* method_decl* RCURLY EOF;

field_decl : type ID (LBRACKET NUMBER RBRACKET)? END_OF_LINE ;

method_decl : (type | VOID) ID LPAR (type ID (COMMA type ID)*)? RPAR block;

block : LCURLY var_decl* statement* RCURLY ;

var_decl : type ID (COMMA ID)* END_OF_LINE;

type : (INT | BOOLEAN);

// DEIXEI O STATEMENT PARA FAZER POR ÚLTIMO
// --------------------- TERMINAR O STATEMENT -------------------------
statement : ID assign_op NUMBER;

assign_op : (ASSIGN | ASSIGN_PLUS | ASSIGN_MINUS);

//NÃO TENHO CERTEZA SE ESSA RERA DO CALLOUT ESTÁ CERTA
method_call : (method_name LPAR (expr (COMMA expr)*)? RPAR | CALLOUT LPAR STRING ((COMMA callout_arg)+)? RPAR) ;

method_name : ID;

location : (ID | ID LBRACKET expr RBRACKET)

expr : (location 
	| method_call
	| literal
	| expr bin_op expr
	| MINUS expr
	| NOT expr
	| LPAR expr RPAR);

callout_arg : (expr | STRING);

bin_op : (arith_op
		| rel_op
		| eq_op
		| cond_op);

arith_op : (PLUS | MINUS | MULT | DIV | MOD);

rel_op : //WTF?????
