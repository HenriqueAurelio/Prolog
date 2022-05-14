:- module(load_words,[
                word/1
        ]).

:- use_module(library(persistency)).

:- persistent
        word(string:atom).

:- db_attach('word.journal', []).