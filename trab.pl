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
	maplist(checkingLimitOfCipher(27), LCrip, LCodV).

cesar(Char, StringInput, Out):-
(	
    var(StringInput)->
		string2_code(Out, LCod),
		code(Char,Key),
		NewKey is -Key,
		validateCode(LCod, NewKey, LCodV),
		maplist(checkingLimitOfCipher(),LCodV,NewList),
		code2_string(NewList, StringInput);

		string2_code(StringInput, LCod),
		code(Char,Key),
		validateCode(LCod,Key,LCodV),
		code2_string(LCodV, Out)
).

checkingLimitOfCipher(X,Z):-
	(		
		X < 1 -> Z is 27 + X;
		Z is X
	). 
		
word(henrique).
word(pipa).
code('A',0).
code('a', 1).
code('b', 2).
code('c', 3).
code('d', 4).
code('e', 5).
code('f', 6).
code('g', 7).
code('h', 8).
code('i', 9).
code('j', 10).
code('k', 11).
code('l', 12).
code('m', 13).
code('n', 14).
code('o', 15).
code('p', 16).
code('q', 17).
code('r', 18).
code('s', 19).
code('t', 20).
code('u', 21).
code('v', 22).
code('w', 23).
code('x', 24).
code('y', 25).
code('z', 26).
code(' ', 27).