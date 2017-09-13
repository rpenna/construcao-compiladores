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

RESERVADA : ('i' 'f') | ('b' 'o' 'o' 'l' 'e' 'a' 'n') | ('b' 'r' 'e' 'a' 'k') | ('c' 'a' 'l' 'l' 'o' 'u' 't') | ('c' 'l' 'a' 's' 's') | ('c' 'o' 'n' 't' 'i' 'n' 'u' 'e') | ('e' 'l' 's' 'e') | ('f' 'o' 'r') | ('i' 'n' 't') | ('r' 'e' 't' 'u' 'r' 'n') | ('v' 'o' 'i' 'd');

BOOLEAN : ('f' 'a' 'l' 's' 'e') | ('t' 'r' 'u' 'e');


ID  :
  ('a'..'z' | 'A'..'Z' | '_') ('a'..'z' | 'A'..'Z' | '_' | '0'..'9')*;

NUMBER : ('0' 'x'  ('a'..'f' | 'A'..'F'| '0'..'9')+) | ('0'..'9')+;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

OPERATOR : '+' | '-' | '*' | '<' | '<' '=' | '>' '=' | '!' '=' | '=' '=' | '>' | '|' '|' | '&' '&' | '%' | ',' | ';' | '(' | ')' | '[' | ']' | '!' | '=';

CHAR : '\'' (ESC|~('\''|'\\'|'\n'|'"'|'\t')) '\'';

STRING : '"' (ESC|~('"'|'\\'|'\''))* '"';

WS_ : (' ' | '\n' | '\t') -> skip;

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\'');

