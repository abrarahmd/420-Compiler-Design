%option noyywrap

%{

#include<bits/stdc++.h>
#include <string>
using namespace std;

ofstream yyoutlog; //output filestream for log file

string loglist = ""; //list of tokens along with line numbers

// define necessary c++ variables and functions here (if any)
int scope=1; 
int lines = 1;
std::string loop = "False";
%}

/* Regular Definitions */

delim [ ]

/* write regular expressions for whitespace and newline */

ws {delim}+ 
newline [\r\n]+
tabs [\t]+
letter [a-zA-Z]
digit [0-9]
int {digit}+
float {digit}+\.{digit}+ 
floatS {digit}+\.{digit}+([eE]+[-+]?{digit}+)
binary 0[bB][01]+
octal 0[0-7]+
hex 0x[0-9A-Fa-f]+
id {letter}({letter}|{digit})*_*({letter}|{digit})*


%%

{ws} {}

{newline} {
		lines++; 
		scope = 1;
		if (loop == "True") {
        scope++;
        loop = "False";
    }
	}

{tabs} {
		scope++;
	}

{binary} {
    loglist="Scope No "+to_string(scope)+": Token <CONST_BIN> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
}

{octal} {
    loglist="Scope No "+to_string(scope)+": Token <CONST_OCT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
}

{hex} {
    loglist="Scope No "+to_string(scope)+": Token <CONST_HEX> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
}

{float} {
			loglist="Scope No "+to_string(scope)+": Token <CONST_FLOAT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
}

{floatS} {
			loglist="Scope No "+to_string(scope)+": Token <CONST_FLOAT_S> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
}

{int} {
			loglist="Scope No "+to_string(scope)+": Token <CONST_INT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
}

"if" {
			loglist="Scope No "+to_string(scope)+": Token <IF> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
			loop = "True";
		}

"elif" {
			loglist="Scope No "+to_string(scope)+": Token <ELIF> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
			loop = "True";
		}

"else" {
			loglist="Scope No "+to_string(scope)+": Token <ELSE> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
			loop = "True";
		}

"for" {
			loglist="Scope No "+to_string(scope)+": Token <FOR> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
			loop = "True";
		}

"range" {
            loglist="Scope No "+to_string(scope)+": Token <RANGE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }

"break" {
			loglist="Scope No "+to_string(scope)+": Token <BREAK> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"not" {
			loglist="Scope No "+to_string(scope)+": Token <NOT> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"catch" {
			loglist="Scope No "+to_string(scope)+": Token <CATCH> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
			loop = "True";
		}

"try" {
			loglist = "Scope No " + to_string(scope) + ": Token <TRY> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
			loop = "True";
}

"except" {
			loglist = "Scope No " + to_string(scope) + ": Token <EXCEPT> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
			loop = "True";
}

"True" {
			loglist = "Scope No " + to_string(scope) + ": Token <TRUE> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"False" {
			loglist = "Scope No " + to_string(scope) + ": Token <FALSE> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"def" {
			loglist = "Scope No " + to_string(scope) + ": Token <DEF> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"return" {
			loglist = "Scope No " + to_string(scope) + ": Token <RETURN> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"finally" {
			loglist = "Scope No " + to_string(scope) + ": Token <FINALLY> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"and" {
			loglist = "Scope No " + to_string(scope) + ": Token <AND> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"or" {
			loglist = "Scope No " + to_string(scope) + ": Token <OR> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"print" {
			loglist = "Scope No " + to_string(scope) + ": Token <PRINT> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"in" {
			loglist = "Scope No " + to_string(scope) + ": Token <IN> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"continue" {
			loglist = "Scope No " + to_string(scope) + ": Token <CONTINUE> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"pass" {
			loglist = "Scope No " + to_string(scope) + ": Token <PASS> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"None" {
			loglist = "Scope No " + to_string(scope) + ": Token <NONE> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
}

"while" {
			loglist = "Scope No " + to_string(scope) + ": Token <WHILE> Lexeme " + yytext + " found\n\n";
			yyoutlog<<loglist;
			loop = "True";
}

{id} {
            loglist="Scope No "+to_string(scope)+": Token <ID> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }

"+"|"-" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <ADDOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"++"|"--" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <INCOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"<"|">"|"=="|"<="|">="|"!=" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <RELOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"=" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <ASSIGNOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}
	
"&&"|"||" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <LOGICOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"!" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <NOT> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"(" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <LPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

")" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <RPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"{" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <LCURL> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"}" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <RCURL> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"[" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <LTHIRD> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"]" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <RTHIRD> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

"," { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <COMMA> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

":" { /* to match two same operators use | */
			loglist="Scope No "+to_string(scope)+": Token <COLON> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

%%

int main(int argc, char *argv[])
{

	if(argc != 2) //check if file name is given
	{
        cout<<"Please input file name"<<endl;
		return 0;
	}

	yyin = fopen(argv[1], "r"); //the file to be read must be assigned to yyin

	yyoutlog.open("output.txt", ios::trunc); // remember to rename the log file as mentioned in the spec
	
	if(yyin == NULL) // file does not exist
	{
		fprintf(stderr, "Error: File does not exist");
		exit(1);
		// print error message and exit
	}
	
	yylex(); // start reading the input file in a loop
	
	//print total number of scope found in the input file
    yyoutlog<< loglist;

	yyoutlog.close(); // close the log file
	
	fclose(yyin); // close the input file
}