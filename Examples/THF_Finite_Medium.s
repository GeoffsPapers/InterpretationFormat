%------------------------------------------------------------------------------
thf(beverage_type,type,   beverage: $tType ).
thf(syrup_type,type,      syrup: $tType ).
thf(coffee_decl,type,     coffee: beverage ).
thf(vanilla_decl,type,    vanilla: syrup ).
thf(mix_decl,type,        mix: ( beverage > syrup ) > beverage ).
thf(heat_decl,type,       heat: beverage > beverage ).
thf(heated_mix_decl,type, heated_mix: ( beverage > syrup ) > beverage ).
thf(hot_decl,type,        hot: beverage > $o ).

thf(d_beverage_type,type, d_beverage: $tType ).
thf(d_syrup_type,type,    d_syrup: $tType ).
thf(d2beverage_decl,type, d2beverage: d_beverage > beverage ).
thf(d2syrup_decl,type,    d2syrup: d_syrup > syrup ).
thf(d_coffee_decl,type,   d_coffee: d_beverage ).
thf(d_vanilla_decl,type,  d_vanilla: d_syrup ).

thf(hot_coffee_beverage,interpretation-domains(beverage,d_beverage),
    ( ! [B: beverage] : ? [DB: d_beverage] : ( B = ( d2beverage @ DB ) )
    & ! [DB: d_beverage] : ( DB = d_coffee )
    & ! [DB1: d_beverage,DB2: d_beverage] :
        ( ( ( d2beverage @ DB1 ) = ( d2beverage @ DB2 ) )
       => ( DB1 = DB2 ) ) ) ).

thf(hot_coffee_syrup,interpretation-domains(syrup,d_syrup),
    ( ! [S: syrup] : ? [DS: d_syrup] : ( S = ( d2syrup @ DS ) )
    & ! [DS: d_syrup] : ( DS = d_vanilla )
    & ! [DS1: d_syrup,DS2: d_syrup] :
        ( ( ( d2syrup @ DS1 ) = ( d2syrup @ DS2 ) )
       => ( DS1 = DS2 ) ) ) ).

thf(hot_coffee_mappings,interpretation-mappings,
    ( ( coffee = ( d2beverage @ d_coffee ) )
    & ( vanilla = ( d2syrup @ d_vanilla ) )
    & ( ( heat @ ( d2beverage @ d_coffee ) ) = d_coffee )
    & ( mix = ( ^ [F: beverage > syrup] : ( d2beverage @ d_coffee ) ) )
    & ( heated_mix
      = ( ^ [F: beverage > syrup] : ( d2beverage @ d_coffee ) ) )
    & ( hot @ ( d2beverage @ d_coffee ) ) ) ).
%------------------------------------------------------------------------------
