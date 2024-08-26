%------------------------------------------------------------------------------
%----Definitions to make it non-modal
tff(dollar_world_type,type,       '$world': $tType ).
tff(dollar_accessible_world_decl,type,
    '$accessible_world': ( '$world' * '$world' ) > $o ).
tff(dollar_local_world_decl,type, '$local_world': '$world' ).
tff(dollar_in_world_decl,type,    '$in_world': ( '$world' * $o ) > $o ).
tff(dollar_necessary_decl,type,   '$necessary': ( '$world' * $o ) > $o ).
tff(dollar_possible_decl,type,    '$possible': ( '$world' * $o ) > $o ).

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

tff(fruit_type,type,    fruit: $tType ).
tff(apple_decl,type,    apple: fruit ).
tff(banana_decl,type,   banana: fruit ).
tff(healthy_decl,type,  healthy: fruit > $o ).
tff(rotten_decl,type,   rotten: fruit > $o ).

tff(d_fruit_type,type,  d_fruit: $tType ).
tff(d2fruit_decl,type,  d2fruit: d_fruit > fruit ).
tff(d_apple_decl,type,  d_apple: d_fruit ).
tff(d_banana_decl,type, d_banana: d_fruit ).

tff(w1_decl,type, w1: '$world').
tff(w2_decl,type, w2: '$world').

tff(fruity_worlds,axiom,
    ( ( ! [W: '$world'] : ( W = w1 | W = w2 )
      & '$local_world' = w1
      & '$accessible_world'(w1,w1) & '$accessible_world'(w2,w2)
      & '$accessible_world'(w1,w2) )
    & ( '$in_world'(w1,
          ( ( ! [F: fruit] : ? [DF: d_fruit] : F = d2fruit(DF)
            & ! [DF: d_fruit] : ( DF = d_apple | DF = d_banana )
            & $distinct(d_apple,d_banana)
            & ? [DP: d_fruit] : ( DP = d_apple )
            & ? [DP: d_fruit] : ( DP = d_banana )
            & ! [DF1: d_fruit,DF2: d_fruit] :
                ( d2fruit(DF1) = d2fruit(DF2) => DF1 = DF2 ) )
          & ( apple = d2fruit(d_apple)
            & banana = d2fruit(d_banana) )
          & ( healthy(d2fruit(d_apple))
            & healthy(d2fruit(d_banana))
            & ~ rotten(d2fruit(d_apple))
            & rotten(d2fruit(d_banana)) ) ) ) )
    & ( '$in_world'(w2,
          ( ( ! [F: fruit] : ? [DF: d_fruit] : F = d2fruit(DF)
            & ! [DF: d_fruit] : ( DF = d_apple | DF = d_banana )
            & $distinct(d_apple,d_banana)
            & ? [DP: d_fruit] : ( DP = d_apple )
            & ? [DP: d_fruit] : ( DP = d_banana )
            & ! [DF1: d_fruit,DF2: d_fruit] :
                ( d2fruit(DF1) = d2fruit(DF2) => DF1 = DF2 ) )
          & ( apple = d2fruit(d_apple)
            & banana = d2fruit(d_banana) )
          & ( healthy(d2fruit(d_apple))
            & healthy(d2fruit(d_banana))
            & ~ rotten(d2fruit(d_apple))
            & ~ rotten(d2fruit(d_banana)) ) ) ) ) ) ).

tff(prove_formulae,conjecture,
    ( ! [W: '$world'] :
      ? [I: $o] :
        ( '$in_world'(W,(I))
        & ( (I)
         => ( ( apple != banana )
            & ! [F: fruit] : '$necessary'(W,healthy(F))
            & ! [F: fruit] : '$possible'(W,~ rotten(F)) ) ) )
    & ? [I: $o] :
        ( '$in_world'('$local_world',(I))
        & ( (I)
         => ( rotten(banana)
            & ~ '$necessary'('$local_world',
                  ( healthy(apple) & ~ rotten(banana) )) ) ) ) ) ).
%------------------------------------------------------------------------------
