%------------------------------------------------------------------------------
%----Definitions to make it non-modal
tff(dollar_world_type,type, '$world': $tType ).
tff(dollar_accessible_world_decl,type,
    '$accessible_world': ( '$world' * '$world' ) > $o ).
tff(dollar_local_world_decl,type, '$local_world': '$world' ).
tff(dollar_in_world_decl,type, '$in_world': ( '$world' * $o ) > $o ).
tff(dollar_necessary_decl,type, '$necessary': ( '$world' * $o ) > $o ).
tff(dollar_possible_decl,type, '$possible': ( '$world' * $o ) > $o ).

tff(necessary_defn,axiom,
    ! [CW: '$world',F: $o] :
      ( '$necessary'(CW,(F))
    <=> ! [AW: '$world'] :
          ( '$accessible_world'(CW,AW)
         => ! [AI: $o] :
              ( '$in_world'(AW,(AI))
             => ( (AI) => (F) ) ) ) ) ).

tff(possible_defn,axiom,
    ! [CW: '$world',F: $o] :
      ( '$possible'(CW,(F))
    <=> ? [AW: '$world'] :
          ( '$accessible_world'(CW,AW)
          & ? [AI: $o] :
              ( '$in_world'(AW,(AI))
              & ( (AI) => (F) ) ) ) ) ).

tff(duality,axiom,
    ! [W: '$world',F: $o] :
      ( ( ~ '$necessary'(W,(F))
      <=> '$possible'(W,~ (F)) )
      & ( ~ '$possible'(W,(F))
      <=> '$necessary'(W,~ (F)) ) ) ).

tff(person_decl,type, person: $tType ).
tff(product_decl,type, product: $tType ).
tff(alex_decl,type, alex: person ).
tff(chris_decl,type, chris: person ).
tff(leo_decl,type, leo: product ).
tff(work_hard_decl,type, work_hard: ( person * product ) > $o ).
tff(gets_rich_decl,type, gets_rich: person > $o ).

tff(w1_decl,type, w1: '$world' ).
tff(w2_decl,type, w2: '$world' ).
tff(d_person_type,type, d_person: $tType ).
tff(d2person_decl,type, d2person: d_person > person ).
tff(d_alex_decl,type, d_alex: d_person ).
tff(d_chris_decl,type, d_chris: d_person ).
tff(d_product_type,type, d_product: $tType ).
tff(d2product_decl,type, d2product: d_product > product ).
tff(d_leo_decl,type, d_leo: d_product ).

tff(working_worlds,axiom,
    ( ! [W: '$world'] : ( ( W = w1 ) | ( W = w2 ) )
    & ( w1 != w2 )
    & ( '$local_world' = w1 )
    & '$accessible_world'(w1,w1)
    & '$accessible_world'(w2,w2)
    & '$accessible_world'(w1,w2)
    & '$in_world'(w1,
        ( ! [P: person] : ? [DP: d_person] : ( P = d2person(DP) )
        & ! [DP: d_person] : ( ( DP = d_alex ) | ( DP = d_chris ) )
        & ( d_alex != d_chris )
        & ? [DP: d_person] : ( DP = d_alex )
        & ? [DP: d_person] : ( DP = d_chris )
        & ! [DP1: d_person,DP2: d_person] :
            ( ( d2person(DP1) = d2person(DP2) ) => ( DP1 = DP2 ) )
        & ! [P: product] : ? [DP: d_product] : ( P = d2product(DP) )
        & ! [DP: d_product] : ( DP = d_leo )
        & ? [DP: d_product] : DP = d_leo
        & ! [DP1: d_product,DP2: d_product] :
            ( ( d2product(DP1) = d2product(DP2) ) => ( DP1 = DP2 ) )
        & ( alex = d2person(d_alex) )
        & ( chris = d2person(d_chris) )
        & ( leo = d2product(d_leo) )
        & work_hard(d2person(d_alex),d2product(d_leo))
        & work_hard(d2person(d_chris),d2product(d_leo))
        & ~ gets_rich(d2person(d_alex))
        & gets_rich(d2person(d_chris)) ) )
    & '$in_world'(w2,
        ( ! [P: person] : ? [DP: d_person] : ( P = d2person(DP) )
        & ! [DP: d_person] : ( ( DP = d_alex ) | ( DP = d_chris ) )
        & ( d_alex != d_chris )
        & ? [DP: d_person] : ( DP = d_alex )
        & ? [DP: d_person] : ( DP = d_chris )
        & ! [DP1: d_person,DP2: d_person] :
            ( ( d2person(DP1) = d2person(DP2) ) => ( DP1 = DP2 ) )
        & ! [P: product] : ? [DP: d_product] : ( P = d2product(DP) )
        & ! [DP: d_product] : ( DP = d_leo )
        & ? [DP: d_product] : DP = d_leo
        & ! [DP1: d_product,DP2: d_product] :
            ( ( d2product(DP1) = d2product(DP2) ) => ( DP1 = DP2 ) )
        & ( alex = d2person(d_alex) )
        & ( chris = d2person(d_chris) )
        & ( leo = d2product(d_leo) )
        & work_hard(d2person(d_alex),d2product(d_leo))
        & work_hard(d2person(d_chris),d2product(d_leo))
        & gets_rich(d2person(d_alex))
        & ~ gets_rich(d2person(d_chris)) )) ) ).

tff(prove_formulae,conjecture,
    ? [I: $o] :
      ( '$in_world'('$local_world',(I))
      & ( (I)
       => ( ! [P: person] :
            ? [R: product] :
              ( work_hard(P,R)
             => '$possible'('$local_world',gets_rich(P)) )
          & ~ ? [P: person] : '$necessary'('$local_world',gets_rich(P))
          & work_hard(alex,leo)
          & work_hard(chris,leo)
          & '$possible'('$local_world',
              ( gets_rich(alex)
              & ~ gets_rich(chris) )) ) ) ) ).

%------------------------------------------------------------------------------
