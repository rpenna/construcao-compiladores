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

TK_class : 'class Program';

LCURLY : '{';

RCURLY : '}';

IF : 'if';
BREAK : ('b' 'r' 'e' 'a' 'k');
CALLOUT : ('c' 'a' 'l' 'l' 'o' 'u' 't');
CLASS : ('c' 'l' 'a' 's' 's');
CONTINUE : ('c' 'o' 'n' 't' 'i' 'n' 'u' 'e');
ELSE : ('e' 'l' 's' 'e');
FOR : ('f' 'o' 'r');
RETURN : ('r' 'e' 't' 'u' 'r' 'n');

VOID : ('v' 'o' 'i' 'd');

TYPE : (INT|BOOLEAN);

BOOL : ('f' 'a' 'l' 's' 'e') | ('t' 'r' 'u' 'e');

ID  :
  ('a'..'z' | 'A'..'Z' | '_') ('a'..'z' | 'A'..'Z' | '_' | '0'..'9')*;

NUMBER : ('0x'  ('a'..'f' | 'A'..'F'| '0'..'9')+) | ('0'..'9')+;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

OPERATOR : '+' | '-' | '*' | '<' | '<' '=' | '>' '=' | '!' '=' | '=' '=' | '>' | '|' '|' | '&' '&' | '%'  | '!';

END_OF_LINE : ';';

LBRACKET : '[';

RBRACKET : ']';

LPAR : '(';

RPAR : ')';

COMMA : ',';

ASSIGN : '=' | '+' '=' | '-' '=';

CHAR : '\'' (ESC|~('\''|'\\'|'\n'|'"'|'\t')) '\'';

STRING : '"' (ESC|~('"'|'\\'|'\''))* '"';

WS_ : (' ' | '\n' | '\t') -> skip;

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\'');

fragment
INT : ('i' 'n' 't');

fragment
BOOLEAN : ('b' 'o' 'o' 'l' 'e' 'a' 'n');
