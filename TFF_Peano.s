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

tff(people,interpretation,
%----Domain for type person is the Peano numbers
    ( ( ! [P: person] : ? [I: peano] : ( P = peano2person(I) )
      & ! [I: peano] : ( I = zero | ? [P: peano] : I = s(P) )
%----The type promoter is a bijection (injective and surjective)
      & ! [I1: peano,I2: peano] :
          ( peano2person(I1) = peano2person(I2) => I1 = I2 )
%----Relationships between Peano numbers
      & ! [I1: peano,I2: peano,I3: peano] :
          ( peano_less(I1,s(I1))
          & ( ( peano_less(I1,I2)
              & peano_less(I2,I3) )
           => peano_less(I1,I3) )
          & ( peano_less(I1,I2)
           => I1 != I2 ) ) )
%----Mapping people to integers. Note that Bob's ancestors will be interpreted
%----as negative integers.
    & ( bob = peano2person(zero)
      & ! [I: peano] :
          child_of(peano2person(I)) = peano2person(s(I)) )
%----Interpretation of descendancy
    & ( ! [A: peano,D: peano] :
          ( is_descendant(peano2person(A),peano2person(D))
        <=> peano_less(A,D) ) ) ) ).
%------------------------------------------------------------------------------
