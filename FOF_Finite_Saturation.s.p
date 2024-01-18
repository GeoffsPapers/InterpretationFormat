%------------------------------------------------------------------------------
cnf(c_0_15,axiom,
    ( created_equal(X1,X2) | ~ human(X1) | ~ human(X2) ) ).

cnf(c_0_16,axiom,
    ~ human(grade_of(X1)) ).

cnf(c_0_17,axiom,
    grade_of(esk3_0) = a ).

cnf(c_0_18,axiom,
    grade_of(john) = f ).

cnf(c_0_20,axiom,
    ( esk1_0 != esk2_0 | ~ human(esk1_0) | ~ human(esk2_0) ) ).

cnf(c_0_21,axiom,
    ( created_equal(esk1_0,esk2_0) | esk1_0 = esk2_0 ) ).

cnf(c_0_22,axiom,
    ( human(esk2_0) | esk1_0 = esk2_0 ) ).

cnf(c_0_23,axiom,
    ( human(esk1_0) | esk1_0 = esk2_0 ) ).

cnf(c_0_24,axiom,
    ~ human(a) ).

cnf(c_0_25,axiom,
    ~ human(f) ).

cnf(c_0_26,axiom,
    a != f ).

cnf(c_0_27,axiom,
    human(esk3_0) ).

cnf(c_0_28,axiom,
    human(john) ).

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
%------------------------------------------------------------------------------
