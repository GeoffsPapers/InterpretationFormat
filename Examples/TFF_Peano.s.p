%------------------------------------------------------------------------------
tff(person_type,type,         person: $tType ).
tff(bob_decl,type,            bob: person ).
tff(child_of_decl,type,       child_of: person > person ).
tff(is_descendant_decl,type,  is_descendant: ( person * person ) > $o ).

tff(peano_type,type,          peano: $tType).
tff(zero_decl,type,           zero: peano ).
tff(s_decl,type,              s: peano > peano ).
tff(peano2person_decl,type,peano2person: peano > person ).
tff(peano_less_decl,type,     peano_less: ( peano * peano ) > $o ).

tff(people,axiom,
    ( ( ! [P: person] : ? [I: peano] : ( P = peano2person(I) )
      & ! [I: peano] : ( I = zero | ? [P: peano] : I = s(P) )
      & ! [I1: peano,I2: peano] :
          ( peano2person(I1) = peano2person(I2) => I1 = I2 ) 
      & ! [I1: peano,I2: peano,I3: peano] :
          ( peano_less(I1,s(I1))
          & ( ( peano_less(I1,I2)
              & peano_less(I2,I3) )
           => peano_less(I1,I3) )
          & ( peano_less(I1,I2)
           => I1 != I2 ) ) )
    & ( bob = peano2person(zero)
      & ! [I: peano] :
          child_of(peano2person(I)) = peano2person(s(I)) )
    & ( ! [A: peano,D: peano] :
          ( is_descendant(peano2person(A),peano2person(D)) 
        <=> peano_less(A,D) ) ) ) ).

tff(prove_formulae,conjecture,
    ( ! [A: person,D: person] : ( is_descendant(A,D) => A != D )
    & ! [A: person,C: person,G: person] :
        ( ( is_descendant(A,C) 
          & is_descendant(C,G) )
       => is_descendant(A,G) )
    & ! [P: person] : is_descendant(P,child_of(P))
    & ! [P: person] : ? [C: person] : C = child_of(P) ) ).
%------------------------------------------------------------------------------
