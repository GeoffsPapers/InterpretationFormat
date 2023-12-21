%------------------------------------------------------------------------------
fof(equality_lost_domain,interpretation-domain,
    ! [X] : ( X = "a" | X = "f" | X = "john" | X = "gotA") ).

fof(equality_lost_mappings,interpretation-mapping,
    ( ( a = "a"
      & f = "f"
      & john = "john"
      & grade_of("a") = "a"
      & grade_of("f") = "a"
      & grade_of("john") = "f"
      & grade_of("gotA") = "a" ) 
    & ( ~ human("a")
      & ~ human("f")
      & human("john")
      & human("gotA")
      & ~ created_equal("a","a")
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
      & created_equal("gotA","gotA") ) ) ).
%------------------------------------------------------------------------------
