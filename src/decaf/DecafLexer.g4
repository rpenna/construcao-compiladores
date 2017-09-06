lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

RESERVADA : ('i' 'f') | ('b' 'o' 'o' 'l' 'e' 'a' 'n') | ('b' 'r' 'e' 'a' 'k') | ('c' 'a' 'l' 'l' 'o' 'u' 't') | ('c' 'l' 'a' 's' 's') | ('c' 'o' 'n' 't' 'i' 'n' 'u' 'e') | ('e' 'l' 's' 'e') | ('f' 'a' 'l' 's' 'e') | ('f' 'o' 'r') | ('i' 'n' 't') | ('r' 'e' 't' 'u' 'r' 'n') | ('t' 'r' 'u' 'e') | ('v' 'o' 'i' 'd');

ID  :
  ('a'..'z' | 'A'..'Z' | '_') ('a'..'z' | 'A'..'Z' | '_' | '0'..'9')*;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

OPERATOR : '+' | '-' | '*' | '<' | '<' '=' | '>' '=' | '!' '=' | '=' '=' | '>' | '|' '|' | '&' '&';
CHAR : '\'' (ESC|~('\''|'\\'|'\n'|'"'))? '\'';
STRING : '"' (ESC|~('"'|'\\'|'\''))* '"';
NUMBER : ('0' 'x'  ('a'..'f' | 'A'..'F'| '0'..'9')+) | (('-'|'+')? ('0'..'9')+);

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\'');

