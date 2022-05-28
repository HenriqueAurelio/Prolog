% Henrique Aurelio de Carvalho Silva - 201665296C
% Andressa Ferrugini de Oliveira - 201665251AC

% "create_words:assert_word(leonardo)"?

:- use_module(library(persistency)).

:- persistent word(string:list).

:- db_attach('word.journal', []).

:- initialization(main).

add_word(List) :-
(
	word(List), !
	;
	assert_word(List)
).

string2code(Input,Output):-
(
 string_codes(Input,Output)
).

main :- 
	add_word("adam"),
	add_word("mykon"),
	add_word("robin"),
	add_word("lily"),
	add_word("michael").

