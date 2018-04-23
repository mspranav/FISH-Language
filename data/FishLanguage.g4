grammar FishLanguage;
program		: 'startFISH' statements+ 'endFISH';

statements 	: (assignmentStatement
		|    ifStatement
		|    loopStatement
		|    writeStatement
		|    declarationStatement);

declarationStatement : DOLLAR IDENTIFIER;
		     
assignmentStatement : IDENTIFIER ASSIGNMENT expression;
ifStatement	: ifBlock (elseBlock)? 'endif';
ifBlock		: 'if' LBRACE booleanExpression RBRACE ':' statements+ ;
elseBlock	: 'else' ':' statements+;
loopStatement	: 'loop' LBRACE booleanExpression RBRACE ':' statements+ 'endloop';
writeStatement  : 'write' expression;

booleanExpression: booleanExpression BINARY booleanExpression
         |    expression EQUALS expression
		 |    expression GTE expression
		 |    expression LTE expression
  		 |    expression NE expression
		 |    expression GT expression
		 |    expression LT expression
		 |    BOOLEAN;
expression 	: expression (MULTIPLY|DIVIDE|MOD) expression
		| expression (ADD|SUBTRACT) expression
		| NUMBER
		| BOOLEAN
		| IDENTIFIER
		| LBRACE expression RBRACE;
BOOLEAN		: 'true'
		| 'false';	
BINARY : BAND | BOR;
NUMBER 		:  [-]?[0-9]+;
IDENTIFIER	:  [a-z]+;
DOLLAR		: '$';
ASSIGNMENT	: '=';
MULTIPLY	: '*';
DIVIDE		: '/';
MOD		: '%';
ADD		: '+';
SUBTRACT	: '-';
LBRACE		: '(';
RBRACE		: ')';
EQUALS		: '==';
GTE		: '>=';
LTE		: '<=';
NE		: '!=';
GT		: '>';
LT		: '<';
BOR      : '||';
BAND     : '&&';

NEWLINE		: [ \n\t\r] -> skip;