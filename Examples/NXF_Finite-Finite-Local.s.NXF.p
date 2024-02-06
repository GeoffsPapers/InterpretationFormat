%------------------------------------------------------------------------------
tff(the_logic,logic,$$fomlModel).

tff(sequence_type,type,
    sequence: $tType ).

tff(null_decl,type,
    null: sequence ).

tff(toss_decl,type,
    toss: sequence > sequence ).

tff(all_heads_decl,type,
    all_heads: sequence > $o ).

tff(int2sequence_decl,type,
    int2sequence: $int > sequence ).

tff(w1_decl,type,
    w1: $world ).

tff(w2_decl,type,
    w2: $world ).

tff(tossed_worlds,interpretation,
    ( ! [W: $world] :
        ( ( W = w1 )
        | ( W = w2 ) )
    & ( $local_world = w1 )
    & $accessible_world(w1,w1)
    & $accessible_world(w2,w2)
    & $accessible_world(w1,w2)
    & $in_world(w1,
        ( ! [S: sequence] :
          ? [I: $int] : ( S = int2sequence(I) )
        & ! [X: $int,Y: $int] :
            ( ( int2sequence(X) = int2sequence(Y) )
           => ( X = Y ) )
        & ( null = int2sequence(1) )
        & ( toss(int2sequence(1)) = int2sequence(2) )
        & ! [I: $int] : ( toss(int2sequence(I)) = int2sequence($product(I,2)) )
        & all_heads(int2sequence(1))
        & ! [I: $int] :
            ( all_heads(int2sequence(I))
          <=> ( $greatereq(I,2)
              & ( $remainder_e(I,2) = 0 )
              & all_heads(int2sequence($quotient_e(I,2))) ) ) ))
    & $in_world(w2,
        ( ! [S: sequence] :
          ? [I: $int] : ( S = int2sequence(I) )
        & ! [X: $int,Y: $int] :
            ( ( int2sequence(X) = int2sequence(Y) )
           => ( X = Y ) )
        & ( null = int2sequence(1) )
        & ( toss(int2sequence(1)) = int2sequence(3) )
        & ! [I: $int] :
            ( ( I != 1 )
           => ( toss(int2sequence(I)) = int2sequence($product(I,2)) ) )
        & all_heads(int2sequence(1))
        & ! [I: $int] :
            ( all_heads(int2sequence(I))
          <=> ( $greatereq(I,2)
              & ( $remainder_e(I,2) = 0 )
              & all_heads(int2sequence($quotient_e(I,2))) ) ) )) ) ).

tff(apple_not_banana,conjecture-global,
    apple != banana ).

tff(necessary_healthy_fruit_everywhere,conjecture-global,
    ! [F: fruit] : ( {$necessary} @ (healthy(F)) ) ).

tff(fruit_possibly_not_rotten,conjecture-global,
    ! [F: fruit] : ( {$possible} @ (~ rotten(F)) ) ).

tff(rotten_banana_here,conjecture-local,
    rotten(banana) ).

tff(not_true,conjecture-local,
    ~ ( {$necessary}
      @ (( healthy(apple)
         & ~ rotten(banana) )) ) ).
%------------------------------------------------------------------------------
