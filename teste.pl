:- use_module(library(persistency)).

:- persistent fact(fact1:any, fact2:any).

:- initialization(init).

init:-
  absolute_file_name('fact.db', File, [access(write)]),
  db_attach(File, []).