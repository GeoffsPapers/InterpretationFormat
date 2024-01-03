%------------------------------------------------------------------------------
tff(semantics,logic,
    $alethic_modal ==
      [ $domains == $constant,
        $designation == $rigid,
        $terms == $local,
        $modalities == $modal_system_M ] ).

tff(person_decl,type,person: $tType).
tff(product_decl,type,product: $tType).
tff(alex_decl,type,alex: person).
tff(chris_decl,type,chris: person).
tff(leo_decl,type,leo: product).
tff(work_hard_decl,type,work_hard: (person * product) > $o).
tff(gets_rich_decl,type,gets_rich: person > $o).

%----If there is a product that a person works hard on, then 
%----it's possible that the person will get rich.
tff(work_hard_to_get_rich,axiom,
    ! [P: person] :
      ( ? [R: product] : work_hard(P,R)
     => {$possible} @ ( gets_rich(P) ) ) ).

%----Nobody necessarily gets rich.
tff(not_all_get_rich,axiom,
    ~ ? [P: person] : ({$necessary} @ (gets_rich(P)) ) ).

%----Alex and Chris work hard on Leo-III.
tff(alex_works_on_leo,axiom,
    work_hard(alex,leo) ).

tff(chris_works_on_leo,axiom,
    work_hard(chris,leo) ).

%----It's possible that Alex gets rich but Chris does not.
tff(only_alex_gets_rich,conjecture,
    ( {$possible} @ (gets_rich(alex) & ~ gets_rich(chris)) ) ).
%------------------------------------------------------------------------------
