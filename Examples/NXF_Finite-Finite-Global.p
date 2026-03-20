%------------------------------------------------------------------------------
tff(semantics,logic,
    $alethic_modal ==
      [ $domains == $constant,
        $designation == $rigid,
        $terms == $local,
        $modalities == $modal_system_K ] ).

tff(child_type,type,    child: $tType ).
tff(adult_type,type,    adult: $tType ).
tff(agatha_decl,type,   agatha: adult ).
tff(charly_decl,type,   charly: child ).
tff(quiet_decl,type,    quiet: child > $o ).
tff(sleepy_decl,type,   sleepy: adult > $o ).
tff(peaceful_decl,type, peaceful: child > $o ).
tff(serves_decl,type,   serves: adult > child ).
tff(rains_decl,type,    rains: $o ).

tff(a1,axiom,
    ! [C: child] :
      ~ ( ~quiet(C) & ? [A: adult] : sleepy(A) ) ).

tff(a2,axiom,
    ( ( rains & ? [C: child] : quiet(C) )
   => ! [C: child] : ~peaceful(C) ) ).

tff(a3,axiom,
    ( peaceful(charly)
    | ( ~quiet(charly) & quiet(serves(agatha)) ) ) ).

tff(a4,axiom,
    ~quiet(charly) => ! [C: child] : ~quiet(C) ).

tff(a5,axiom,
    {$necessary} @ ( peaceful(charly) => rains ) ).

tff(c,conjecture,
    {$possible} @ (~ rains) ).
%------------------------------------------------------------------------------
