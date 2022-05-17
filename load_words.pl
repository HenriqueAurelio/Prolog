:- use_module(library(persistency)).

:- persistent
        word(string:atom).

:- db_attach('word.journal', []).