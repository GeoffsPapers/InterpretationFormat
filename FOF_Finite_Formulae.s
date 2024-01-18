%------------------------------------------------------------------------------
fof(created_equal,interpretation-herbrand,
    ! [X0,X1] : ( created_equal(X0,X1) <=> $true ) ).

fof(human,interpretation-herbrand,
    ! [X0] : ( human(X0) <=> ( X0 != "f" & X0 != "a" ) ) ).

fof(john,interpretation-herbrand,
    ! [X0] : ( X0 = john <=> X0 = "john" ) ).

fof(grade_of,interpretation-herbrand,
    ! [X0,X1] :
      ( X0 = grade_of(X1)
    <=> ( ( X0 = "f" & X1 != "gotA" )
        | ( X0 = "a" & X1 = "gotA" ) ) ) ).

fof(f,interpretation-herbrand,
    ! [X0] : ( X0 = f <=> X0 = "f" ) ).

fof(a,interpretation-herbrand,
    ! [X0] : ( X0 = a <=> X0 = "a" ) ).
%------------------------------------------------------------------------------
