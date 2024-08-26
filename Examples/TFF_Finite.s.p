%------------------------------------------------------------------------------
tff(human_type,type,      human: $tType ).
tff(cat_type,type,        cat: $tType ).
tff(jon_decl,type,        jon: human ).
tff(garfield_decl,type,   garfield: cat ).
tff(arlene_decl,type,     arlene: cat ).
tff(nermal_decl,type,     nermal: cat ).
tff(loves_decl,type,      loves: cat > cat ).
tff(owns_decl,type,       owns: ( human * cat ) > $o ).

tff(d_jon_decl,type,      d_jon: human ).
tff(d_garfield_decl,type, d_garfield: cat ).
tff(d_arlene_decl,type,   d_arlene: cat ).
tff(d_nermal_decl,type,   d_nermal: cat ).

tff(garfield,axiom,
%----The human domain elements are {d_jon}
    ( ( ! [DH: human] : ( DH = d_jon )
%----The cat domain elements are {d_garfield,d_arlene,d_nermal}
      & ! [DC: cat]: 
          ( DC = d_garfield | DC = d_arlene | DC = d_nermal )
      & $distinct(d_garfield,d_arlene,d_nermal) )
%----Interpret terms via the type-promoted domain
    & ( jon = d_jon
      & garfield = d_garfield
      & arlene = d_arlene
      & nermal = d_nermal
      & loves(d_garfield) = d_garfield
      & loves(d_arlene) = d_garfield
      & loves(d_nermal) = d_garfield )
%----Interpret atoms as true or false
    & ( owns(d_jon,d_garfield)
      & ~ owns(d_jon,d_arlene)
      & ~ owns(d_jon,d_nermal) ) ) ).

tff(verify,conjecture,
    ( ! [H: human] : H = jon
    & ! [C: cat] : ( C = garfield | C = arlene | C = nermal )
    & ( garfield != arlene & garfield != nermal & arlene != nermal )
    & ( owns(jon,garfield) & ~ owns(jon,arlene) )
    & ! [C: cat] : ( loves(C) = garfield )
    & ~ ! [C: cat] :
          ( ( loves(C) = garfield & C != arlene)
         => owns(jon,C) ) ) ).
%------------------------------------------------------------------------------
