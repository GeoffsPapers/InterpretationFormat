%------------------------------------------------------------------------------
thf(beverage_type,type,   beverage: $tType ).
thf(syrup_type,type,      syrup: $tType ).
thf(coffee_decl,type,     coffee: beverage ).
thf(vanilla_decl,type,    vanilla: syrup ).
thf(mix_decl,type,        mix: ( syrup > beverage ) > beverage ).
thf(heat_decl,type,       heat: beverage > beverage ).
thf(heated_mix_decl,type, heated_mix: ( syrup > beverage ) > beverage ).
thf(hot_decl,type,        hot: beverage > $o ).

thf(heated_mix,axiom,
    ( heated_mix
    = ( ^ [F: syrup > beverage] : ( heat @ ( mix @ F ) ) ) ) ).

thf(hot_mixture,axiom,
    ! [F: syrup > beverage] : ( hot @ ( heated_mix @ F ) ) ).

thf(heated_coffee_mix,axiom,
    ! [F: syrup > beverage] : ( ( heated_mix @ F ) = coffee ) ).

thf(hot_coffee,conjecture,
    ? [Mixture: syrup > beverage] :
      ~ ? [S: syrup] :
          ( ( ( Mixture @ S ) = coffee )
          & ( hot @ ( Mixture @ S ) ) ) ).
%------------------------------------------------------------------------------
