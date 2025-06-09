
% project_ai2025__example.pl
% Authors: Example
% Description: Solution to Task 1 - Logic puzzle with 5 people in a clinic line.
% Each person is represented as person(Name, Profession, Clothing, Snack, Game)
% The list Line represents the queue of 5 people in order.

% Define basic predicates

middle(X, [_, _, X, _, _]).
first(X, [X, _, _, _, _]).

next_to(X, Y, List) :-
    append(_, [X,Y|_], List);
    append(_, [Y,X|_], List).

right_after(X, Y, List) :- append(_, [Y,X|_], List).

solve(Line) :-
    Line = [_, _, _, _, _],
    Line = [person(_, _, _, _, _),
            person(_, _, _, _, _),
            person(_, _, _, _, _),
            person(_, _, _, _, _),
            person(_, _, _, _, _)],

    % 1. Suits in the middle
    middle(person(_, _, suits, _, _), Line),

    % 2. Jack is a mathematician
    member(person(jack, mathematician, _, _, _), Line),

    % 3. Jack sits next to LoL player
    next_to(person(jack, _, _, _, _), person(_, _, _, _, lol), Line),

    % 4. First in line eats focaccia
    first(person(_, _, _, focaccia, _), Line),

    % 5. Veronica sits next to Valorant player
    next_to(person(veronica, _, _, _, _), person(_, _, _, _, valorant), Line),

    % 6. Hat wearer eats fries
    member(person(_, _, hat, fries, _), Line),

    % 7. Christopher plays Cyberpunk
    member(person(christopher, _, _, _, cyberpunk), Line),

    % 8. Andrew eats saltsticks
    member(person(andrew, _, _, saltsticks, _), Line),

    % 9. Driver next to focaccia eater
    next_to(person(_, driver, _, _, _), person(_, _, _, focaccia, _), Line),

    % 10. Chef wears sports clothes
    member(person(_, chef, sports, _, _), Line),

    % 11. CoD player eats crisps
    member(person(_, _, _, crisps, call_of_duty), Line),

    % 12. Chef sits right behind excavator operator (i.e., later in line)
    right_after(person(_, chef, _, _, _), person(_, excavator, _, _, _), Line),

    % 13. Zeno wears cowboy boots
    member(person(zeno, _, cowboy_boots, _, _), Line),

    % 14. Hat next to scarf
    next_to(person(_, _, hat, _, _), person(_, _, scarf, _, _), Line),

    % 15. Programmer eats croissant
    member(person(_, programmer, _, croissant, _), Line).

% Run and answer questions
% ?- solve(Line), member(person(X, _, _, _, the_witcher), Line).
% ?- solve(Line). % to get full structure of the line
