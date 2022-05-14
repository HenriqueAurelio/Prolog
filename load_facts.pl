:- module(load_facts,[
                user_role/2
        ]).

:- use_module(library(persistency)).

:- persistent
        user_role(name:atom, role:oneof([user,developer,administrator])).

:- db_attach('user.journal', []).