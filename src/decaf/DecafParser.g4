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

statement : (location assign_op expr END_OF_LINE | method_call END_OF_LINE | IF LPAR expr RPAR block (ELSE block)? | FOR ID assign_op expr COMMA expr block | RETURN (expr)? END_OF_LINE | BREAK END_OF_LINE); 

//for antigo: FOR LPAR ID assign_op expr END_OF_LINE expr END_OF_LINE block

assign_op : (ASSIGN | ASSIGN_PLUS | ASSIGN_MINUS);

//NÃO TENHO CERTEZA SE ESSA REGRA DO CALLOUT ESTÁ CERTA
method_call : (method_name LPAR (expr (COMMA expr)*)? RPAR | CALLOUT LPAR STRING ((COMMA callout_arg)+)? RPAR) ;

method_name : ID;

location : (ID | ID LBRACKET expr RBRACKET);

expr : (location | method_call | literal | remove_left_recursive expr | MINUS expr | NOT expr | LPAR expr RPAR);

remove_left_recursive : (location | method_call | literal | MINUS expr | NOT expr | LPAR expr RPAR) bin_op;

callout_arg : (expr | STRING);

bin_op : (arith_op
		| rel_op
		| eq_op
		| cond_op);

arith_op : (PLUS | MINUS | MULT | DIV | MOD);

rel_op : (GT | GET | LT | LET);

eq_op : (EQUAL | DIFF);

cond_op : (AND | OR);

literal : (CHAR | NUMBER | BOOL);
