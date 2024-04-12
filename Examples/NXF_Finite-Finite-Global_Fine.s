%------------------------------------------------------------------------------
tff(semantics,logic,
    $alethic_modal ==
      [ $domains == $constant,
        $designation == $rigid,
        $terms == $local,
        $modalities == $modal_system_M ] ).

tff(person_decl,type,    person: $tType).
tff(product_decl,type,   product: $tType).
tff(alex_decl,type,      alex: person).
tff(chris_decl,type,     chris: person).
tff(leo_decl,type,       leo: product).
tff(work_hard_decl,type, work_hard: (person * product) > $o).
tff(gets_rich_decl,type, gets_rich: person > $o).

tff(d_person_type,type,  d_person: $tType).
tff(d2person_decl,type,  d2person: d_person > person ).
tff(d_alex_decl,type,    d_alex: d_person).
tff(d_chris_decl,type,   d_chris: d_person).
tff(d_product_type,type, d_product: $tType).
tff(d2product_decl,type, d2product: d_product > product ).
tff(d_leo_decl,type,     d_leo: d_product).

tff(w1_decl,type,w1:     $world).
tff(w2_decl,type,w2:     $world).

tff(leo_workers_worlds,interpretation-world,
    ( ! [W: $world] : ( W = w1 | W = w2 )
    & $distinct(w1,w2)
    & $local_world = w2
    & $accessible_world(w1,w1) & $accessible_world(w2,w2)
    & $accessible_world(w1,w2) & $accessible_world(w2,w1) ) ). 

tff(leo_workers_w1_person,
    interpretation-in_world(w1,interpretation-domain(person,d_person)),
    $in_world(w1,
      ( ! [P: person] : ? [DP: d_person] : P = d2person(DP)
      & ! [DP: d_person] : ( DP = d_alex | DP = d_chris )
      & $distinct(d_alex,d_chris)
      & ? [DP: d_person] : ( DP = d_alex )
      & ? [DP: d_person] : ( DP = d_chris )
      & ! [DP1: d_person,DP2: d_person] : 
          ( d2person(DP1) = d2person(DP2) => DP1 = DP2 ) ) ) ).

tff(leo_workers_w1_product,
    interpretation-in_world(w1,interpretation-domain(product,d_product)),
    $in_world(w1,
      ( ! [P: product] : ? [DP: d_product] : P = d2product(DP)
      & ! [DP: d_product] : DP = d_leo
      & ? [DP: d_product] : DP = d_leo
      & ! [DP1: d_product,DP2: d_product] :
          ( d2product(DP1) = d2product(DP2) => DP1 = DP2 ) ) ) ).

tff(leo_workers_w2_person,
    interpretation-in_world(w2,interpretation-domain(person,d_person)),
    $in_world(w2,
      ( ! [P: person] : ? [DP: d_person] : P = d2person(DP)
      & ! [DP: d_person] : ( DP = d_alex | DP = d_chris )
      & $distinct(d_alex,d_chris)
      & ? [DP: d_person] : ( DP = d_alex )
      & ? [DP: d_person] : ( DP = d_chris )
      & ! [DP1: d_person,DP2: d_person] : 
          ( d2person(DP1) = d2person(DP2) => DP1 = DP2 ) ) ) ).

tff(leo_workers_w2_product,
    interpretation-in_world(w2,interpretation-domain(product,d_product)),
    $in_world(w2,
      ( ! [P: product] : ? [DP: d_product] : P = d2product(DP)
      & ! [DP: d_product] : DP = d_leo
      & ? [DP: d_product] : DP = d_leo
      & ! [DP1: d_product,DP2: d_product] :
          ( d2product(DP1) = d2product(DP2) => DP1 = DP2 ) ) ) ).

tff(leo_workers_w1_alex,
    interpretation-in_world(w1,interpretation-mapping(alex,d_person)),
    $in_world(w1, ( alex = d2person(d_alex) )) ).

tff(leo_workers_w2_alex,
    interpretation-in_world(w2,interpretation-mapping(alex,d_person)),
    $in_world(w2, ( alex = d2person(d_alex) )) ).

tff(leo_workers_w1_chris,
    interpretation-in_world(w1,interpretation-mapping(chris,d_person)),
    $in_world(w1, ( chris = d2person(d_chris) )) ).

tff(leo_workers_w2_chris,
    interpretation-in_world(w2,interpretation-mapping(chris,d_person)),
    $in_world(w2, ( chris = d2person(d_chris) )) ).

tff(leo_workers_w1_leo,
    interpretation-in_world(w1,interpretation-mapping(leo,d_product)),
    $in_world(w1, ( leo = d2product(d_leo) )) ).

tff(leo_workers_w2_leo,
    interpretation-in_world(w2,interpretation-mapping(leo,d_product)),
    $in_world(w2, ( leo = d2product(d_leo) )) ).

tff(leo_workers_w1_work_hard,
    interpretation-in_world(w1,interpretation-mapping(work_hard,$o)),
    $in_world(w1,
      ( work_hard(d2person(d_alex),d2product(d_leo))
      & work_hard(d2person(d_chris),d2product(d_leo)) )) ).

tff(leo_workers_w2_work_hard,
    interpretation-in_world(w2,interpretation-mapping(work_hard,$o)),
    $in_world(w2,
      ( work_hard(d2person(d_alex),d2product(d_leo))
      & work_hard(d2person(d_chris),d2product(d_leo)) )) ).

tff(leo_workers_w1_gets_rich,
    interpretation-in_world(w1,interpretation-mapping(gets_rich,$o)),
    $in_world(w1,
      ( gets_rich(d2person(d_alex)) & gets_rich(d2person(d_chris)) ) ) ). 

tff(leo_workers_w2_gets_rich,
    interpretation-in_world(w2,interpretation-mapping(gets_rich,$o)),
    $in_world(w2,
      ( ~ gets_rich(d2person(d_alex)) & ~ gets_rich(d2person(d_chris)) ) ) ). 
%------------------------------------------------------------------------------

