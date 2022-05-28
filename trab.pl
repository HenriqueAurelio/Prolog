string2_code(StringInput,ListaCod) :- 
	string_chars(StringInput, ListaChars), 
	maplist(code(), ListaChars, ListaCod).

code2_string(ListaCod, StringInput):-
	maplist(code(), ListaChars, ListaCod),
	string_chars(StringInput, ListaChars).

checkingLimitOfCipher(Num, X, Y):-
	(
		X > Num,
			Y is X mod Num;
		Y is X
	).

validateCode(LCod, Key, LCodV):-
	maplist(plus(Key),LCod,LCrip),
	maplist(checkingLimitOfCipher(27), LCrip, LCodV).

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
		validateCode(LCod, Key, LCodV),
		code2_string(LCodV, Out)
).

vigenere(CriptString,StringInput,Output):-
	(
		string2_code(StringInput, LCod),
		code(CriptString,Key),
		writeln(Key)
	).

verifica(X,Z):-
	(		
		X < 1 -> Z is 27 + X;
		Z is X
	). 
	

word(henrique).
word(pipa).

code('a', 27).
code('b', 1).
code('c', 2).
code('d', 3).
code('e', 4).
code('f', 5).
code('g', 6).
code('h', 7).
code('i', 8).
code('j', 9).
code('k', 10).
code('l', 11).
code('m', 12).
code('n', 13).
code('o', 14).
code('p', 15).
code('q', 16).
code('r', 17).
code('s', 18).
code('t', 19).
code('u', 20).
code('v', 21).
code('w', 22).
code('x', 23).
code('y', 24).
code('z', 25).
code(' ', 26).



