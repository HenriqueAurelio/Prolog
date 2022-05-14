% "create_words:assert_word(leonardo)"?

:- use_module(library(persistency)).

:- persistent word(string:atom).

:- db_attach('word.journal', []).

:- initialization(main).

add_word(String) :-
        (
                word(String), !
        ;
                assert_word(String)
        ).


main :- 
    add_word(andressa),
    add_word(henrique),
    add_word(andre),
    add_word(leo),
    add_word(almeida).

