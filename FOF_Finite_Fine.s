%------------------------------------------------------------------------------
fof(equality_lost_domain,interpretation-domain($i,$i),
    ! [X] : ( X = "a" | X = "f" | X = "john" | X = "gotA") ).

fof(equality_lost_a,interpretation-mapping(a,$i),
    a = "a" ).

fof(equality_lost_f,interpretation-mapping(f,$i),
    f = "f" ).

fof(equality_lost_john,interpretation-mapping(john,$i),
    john = "john" ).

fof(equality_lost_grade_of,interpretation-mapping(grade_of,$i),
    ( grade_of("a") = "a"
    & grade_of("f") = "a"
    & grade_of("john") = "f"
    & grade_of("gotA") = "a" ) ).

fof(equality_lost_human,interpretation-mapping(human,$o),
    ( ~ human("a")
    & ~ human("f")
    & human("john")
    & human("gotA") ).

fof(equality_lost_created_equal,interpretation-mapping(created_equal,$o),
    ( ~ created_equal("a","a")
    & ~ created_equal("a","f")
    & ~ created_equal("a","john")
    & ~ created_equal("a","gotA")
    & ~ created_equal("f","a")
    & ~ created_equal("f","f")
    & ~ created_equal("f","john")
    & ~ created_equal("f","gotA")
    & ~ created_equal("john","a")
    & ~ created_equal("john","f")
    & created_equal("john","john")
    & created_equal("john","gotA")
    & ~ created_equal("gotA","a")
    & ~ created_equal("gotA","f")
    & created_equal("gotA","john")
    & created_equal("gotA","gotA") ) ).

%------------------------------------------------------------------------------
