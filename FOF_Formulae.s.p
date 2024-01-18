%------------------------------------------------------------------------------
fof(created_equal,axiom,
    ! [X0,X1] : ( created_equal(X0,X1) <=> $true ) ).

fof(human,axiom,
    ! [X0] : ( human(X0) <=> ( X0 != "f" & X0 != "a" ) ) ).

fof(john,axiom,
    ! [X0] : ( X0 = john <=> X0 = "john" ) ).

fof(grade_of,axiom,
    ! [X0,X1] :
      ( X0 = grade_of(X1)
    <=> ( ( X0 = "f" & X1 != "gotA" )
        | ( X0 = "a" & X1 = "gotA" ) ) ) ).

fof(f,axiom,
    ! [X0] : ( X0 = f <=> X0 = "f" ) ).

fof(a,axiom,
    ! [X0] : ( X0 = a <=> X0 = "a" ) ).

fof(prove_formulae,conjecture,
    ( ! [H1,H2] :
        ( ( human(H1)
          & human(H2) )
       => created_equal(H1,H2) )
    & human(john)
    & grade_of(john) = f
    & ? [H] :
        ( human(H)
        & grade_of(H) = a )
    & a != f
    & ! [G] : ~ human(grade_of(G))
    & ~ ! [H1,H2] :
          ( ( human(H1)
            & human(H2)
            & created_equal(H1,H2) )
        <=> H1 = H2 ) ) ).
%------------------------------------------------------------------------------
