:- module(create_facts,[]).

:- use_module(library(persistency)).

:- persistent
        user_role(name:atom, role:oneof([user,developer,administrator])).

:- db_attach('user.journal', []).

:- initialization(main).

add_user(Name, Role) :-
        (
                user_role(Name, Role), !
        ;
                assert_user_role(Name, Role)
        ).

main :-
    add_user('John',user),
    add_user('Mary',user),
    add_user('Ellen',developer),
    add_user('Stan',user),
    add_user('Eric',administrator).