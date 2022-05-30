string2_code(StringInput,ListaCod) :- 
	string_chars(StringInput, ListaChars), 
	maplist(code(), ListaChars, ListaCod).

code2_string(ListaCod, StringInput):-
	maplist(code(), ListaChars, ListaCod),
	string_chars(StringInput, ListaChars).

checkingLimitOfCipher(Num, X, Y):-
	(
		X > Num->
			Y is X mod Num;
		Y is X
	).

validateCode(LCod, Key, LCodV):-
	maplist(plus(Key),LCod,LCrip),
	maplist(checkingLimitOfCipher(57), LCrip, LCodV).

cesar(Char, StringInput, Out):-
(	
    var(StringInput)->
		string2_code(Out, LCod),
		code(Char,Key),
		NewKey is -Key,
		validateCode(LCod, NewKey, LCodV),
		maplist(verifica(),LCodV,NewList),
		code2_string(NewList, StringInput);

		string2_code(StringInput, LCod),
		code(Char,Key),
		validateCode(LCod,Key,LCodV),
		code2_string(LCodV, Out)
).

verifica(X,Z):-
	(		
		X < 1 -> Z is 57 + X;
		Z is X
	). 

round(X,Y,D) :- Z is X * 10^D, round(Z, ZA), Y is ZA / 10^D.

calcula(TamString, TamKey, Num, Rest):-
	(
		Num is truncate(TamString/TamKey),
		Rest is TamString mod TamKey
	).


concate([], L, L).
concate([H|T], L, [H|Z]):- 
	concate(T,L,Z).


loop(0, _, []). 
loop(S, K, L) :- S>=0,concate(K, LT, L), M is S - 1, loop(M, K, LT).

car([H],[H|T]).
cdr(T,[H|T]).

function(LCodeCript, 0, []).
function(LCodeCript, Rest, L):- 
	car(H, LCodeCript), 
	concate(H, LT, L), 
	cdr(T,LCodeCript), 
	R is Rest-1, 
	function(T, R, LT).


x_negate(X, X_) :-
    X_ is -1 * X.

vigenere(CriptString,StringInput,Output):-
	(
		nonvar(StringInput)->
			string2_code(CriptString,LCodeCript),
			length(LCodeCript,TamKey),
			string2_code(StringInput, LCod),
			length(LCod,TamString),
			calcula(TamString,TamKey,Num,Rest),
			loop(Num, LCodeCript, FinalList),
			function(LCodeCript, Rest, L),
			concate(FinalList, L, LF),
			maplist(plus(), LCod, LF, L2),
			maplist(checkingLimitOfCipher(57), L2, LCodV),
			code2_string(LCodV, Output);

			string2_code(CriptString,LCodeCript),
			length(LCodeCript,TamKey),
			string2_code(Output, LCod),
			length(LCod,TamString),
			calcula(TamString,TamKey,Num,Rest),
			loop(Num, LCodeCript, FinalList),
			function(LCodeCript, Rest, L),
			concate(FinalList, L, LF),
			maplist(x_negate, LF, V),
			maplist(plus(), LCod, V, L2),
			maplist(verifica(),L2,NewList),
			code2_string(NewList, StringInput)
	).
		
word(henrique).
word(pipa).
code(',',0).
code('A',1).
code('B',2).
code('C',3).
code('D',4).
code('E',5).
code('F',6).
code('G',7).
code('H',8).
code('I',9).
code('J',10).
code('K',11).
code('L',12).
code('M',13).
code('N',14).
code('O',15).
code('P',16).
code('Q',17).
code('R',18).
code('S',19).
code('T',20).
code('U',21).
code('V',22).
code('W',23).
code('X',24).
code('Y',25).
code('Z',26).
code('a', 27).
code('b', 28).
code('c', 29).
code('d', 30).
code('e', 31).
code('f', 32).
code('g', 33).
code('h', 34).
code('i', 35).
code('j', 36).
code('k', 37).
code('l', 38).
code('m', 39).
code('n', 40).
code('o', 41).
code('p', 42).
code('q', 43).
code('r', 44).
code('s', 45).
code('t', 46).
code('u', 47).
code('v', 48).
code('w', 49).
code('x', 50).
code('y', 51).
code('z', 52).
code(' ', 53).
code('!',54).
code('?',55).
code('.',56).
code(':',57).