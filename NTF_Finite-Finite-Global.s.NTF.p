tff(the_logic,logic,$$fomlModel).

tff(person_decl,type,
    person: $tType ).

tff(product_decl,type,
    product: $tType ).

tff(alex_decl,type,
    alex: person ).

tff(chris_decl,type,
    chris: person ).

tff(leo_decl,type,
    leo: product ).

tff(work_hard_decl,type,
    work_hard: ( person * product ) > $o ).

tff(gets_rich_decl,type,
    gets_rich: person > $o ).

tff(d_person_type,type,
    d_person: $tType ).

tff(d2person_decl,type,
    d2person: d_person > person ).

tff(d_alex_decl,type,
    d_alex: d_person ).

tff(d_chris_decl,type,
    d_chris: d_person ).

tff(d_product_type,type,
    d_product: $tType ).

tff(d2product_decl,type,
    d2product: d_product > product ).

tff(d_leo_decl,type,
    d_leo: d_product ).

tff(w1_decl,type,
    w1: $world ).

tff(w2_decl,type,
    w2: $world ).

tff(leo_workers,interpretation,
    ( ! [W: $world] :
        ( ( W = w1 )
        | ( W = w2 ) )
    & $distinct(w1,w2)
    & ( $local_world = w1 )
    & $accessible_world(w1,w1)
    & $accessible_world(w2,w2)
    & $accessible_world(w1,w2)
    & $in_world(w1,
        ( ! [P: person] :
          ? [DP: d_person] : ( P = d2person(DP) )
        & ! [DP: d_person] :
            ( ( DP = d_alex )
            | ( DP = d_chris ) )
        & $distinct(d_alex,d_chris)
        & ? [DP: d_person] : ( DP = d_alex )
        & ? [DP: d_person] : ( DP = d_chris )
        & ! [DP1: d_person,DP2: d_person] :
            ( ( d2person(DP1) = d2person(DP2) )
           => ( DP1 = DP2 ) )
        & ! [P: product] :
          ? [DP: d_product] : ( P = d2product(DP) )
        & ! [DP: d_product] : ( DP = d_leo )
        & ? [DP: d_product] : ( DP = d_leo )
        & ! [DP1: d_product,DP2: d_product] :
            ( ( d2product(DP1) = d2product(DP2) )
           => ( DP1 = DP2 ) )
        & ( alex = d2person(d_alex) )
        & ( chris = d2person(d_chris) )
        & ( leo = d2product(d_leo) )
        & work_hard(d2person(d_alex),d2product(d_leo))
        & work_hard(d2person(d_chris),d2product(d_leo))
        & ~ gets_rich(d2person(d_alex))
        & gets_rich(d2person(d_chris)) ))
    & $in_world(w2,
        ( ! [P: person] :
          ? [DP: d_person] : ( P = d2person(DP) )
        & ! [DP: d_person] :
            ( ( DP = d_alex )
            | ( DP = d_chris ) )
        & $distinct(d_alex,d_chris)
        & ? [DP: d_person] : ( DP = d_alex )
        & ? [DP: d_person] : ( DP = d_chris )
        & ! [DP1: d_person,DP2: d_person] :
            ( ( d2person(DP1) = d2person(DP2) )
           => ( DP1 = DP2 ) )
        & ! [P: product] :
          ? [DP: d_product] : ( P = d2product(DP) )
        & ! [DP: d_product] : ( DP = d_leo )
        & ? [DP: d_product] : ( DP = d_leo )
        & ! [DP1: d_product,DP2: d_product] :
            ( ( d2product(DP1) = d2product(DP2) )
           => ( DP1 = DP2 ) )
        & ( alex = d2person(d_alex) )
        & ( chris = d2person(d_chris) )
        & ( leo = d2product(d_leo) )
        & work_hard(d2person(d_alex),d2product(d_leo))
        & work_hard(d2person(d_chris),d2product(d_leo))
        & gets_rich(d2person(d_alex))
        & ~ gets_rich(d2person(d_chris)) )) ) ).

tff(work_hard_to_get_rich,conjecture-global,
    ! [P: person] :
      ( ? [R: product] : work_hard(P,R)
     => ( {$possible} @ (gets_rich(P)) ) ) ).

tff(not_all_get_rich,conjecture-global,
    ~ ? [P: person] : ( {$necessary} @ (gets_rich(P)) ) ).

tff(alex_works_on_leo,conjecture-global,
    work_hard(alex,leo) ).

tff(chris_works_on_leo,conjecture-global,
    work_hard(chris,leo) ).

tff(only_alex_gets_rich,conjecture-local,
    ~ ( {$possible}
      @ (( gets_rich(alex)
         & ~ gets_rich(chris) )) ) ).
