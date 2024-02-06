%------------------------------------------------------------------------------
%----All (hu)men are created equal. John is a human. John got an F grade.
%----There is someone (a human) who got an A grade. An A grade is not 
%----equal to an F grade. Grades are not human. Therefore, it is not the 
%----case being created equal is the same as really being equal.

fof(all_created_equal,axiom,
    ! [H1,H2] :
      ( ( human(H1)
        & human(H2) )
     => created_equal(H1,H2) ) ).

fof(john,axiom,
    human(john) ).

fof(john_failed,axiom,
    grade_of(john) = f ).

fof(someone_got_an_a,axiom,
    ? [H] :
      ( human(H)
      & grade_of(H) = a ) ).

fof(distinct_grades,axiom,
    a != f ).

fof(grades_not_human,axiom,
    ! [G] : ~ human(grade_of(G)) ).

fof(equality_lost,conjecture,
    ! [H1,H2] :
      ( ( human(H1)
        & human(H2)
        & created_equal(H1,H2) )
    <=> H1 = H2 ) ).
%------------------------------------------------------------------------------
