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

field_decl : TYPE ID (LBRACKET NUMBER RBRACKET)? END_OF_LINE ;

method_decl : TYPE ID LPAR (TYPE ID (COMMA TYPE ID)*)? RPAR block;

block : LCURLY var_decl* statement* RCURLY ;

var_decl : TYPE ID (COMMA ID)* END_OF_LINE;

// DAQUI PRA BAIXO SÃO APENAS TESTES PARA QUE O COMPILADOR ACEITE. acima está certo
statement : ID assign_op NUMBER;

assign_op : ASSIGN;
