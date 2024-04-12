%------------------------------------------------------------------------------
tff(semantics,logic,
    $alethic_modal == 
      [ $domains == $constant,
        $designation == $rigid,
        $terms == $local,
        $modalities == $modal_system_M ] ).

tff(fruit_type,type,   fruit: $tType).
tff(apple_decl,type,   apple: fruit).
tff(banana_decl,type,  banana: fruit).
tff(healthy_decl,type, healthy: fruit > $o).
tff(rotten_decl,type,  rotten: fruit > $o).

tff(apple_not_banana,axiom,
    apple != banana ).

tff(necessary_healthy_fruit_everywhere,axiom,
    ! [F: fruit] : ( {$necessary} @ (healthy(F)) ) ).

tff(fruit_possibly_not_rotten,axiom,
    ! [F: fruit] : ( {$possible} @ (~ rotten(F)) ) ).

tff(rotten_banana_here,axiom-local,
    rotten(banana) ).

tff(not_true,conjecture,
    ( {$necessary} @ 
      (( healthy(apple)
       & ~ rotten(banana) )) ) ).
%------------------------------------------------------------------------------
