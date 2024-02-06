%------------------------------------------------------------------------------
thf(beverage_decl,type,   beverage: $tType ).
thf(syrup_decl,type,      syrup: $tType ).
thf(coffee_type,type,     coffee: beverage ).
thf(mix_type,type,        mix: beverage > syrup > beverage ).
thf(heat_type,type,       heat: beverage > beverage ).
thf(heated_mix_type,type, heated_mix: beverage > syrup > beverage ).
thf(hot_type,type,        hot: beverage > $o ).

thf(d_beverage_decl,type, d_beverage: $tType ).
thf(d_syrup_decl,type,    d_syrup: $tType ).
thf(d2beverage_type,type, d2beverage: d_beverage > beverage ).
thf(d2syrup_type,type,    d2syrup: d_syrup > syrup ).
thf(d_coffee_type,type,   d_coffee: d_beverage ).
thf(d_date_type,type,     d_date: d_syrup ).

thf(hot_coffee_beverage,interpretation-domain(beverage,d_beverage),
    ( ! [B: beverage] : ? [DB: d_beverage] : ( B = ( d2beverage @ DB ) )
    & ! [DB: d_beverage] : ( DB = d_coffee )
    & ! [DB1: d_beverage,DB2: d_beverage] :
        ( ( ( d2beverage @ DB1 ) = ( d2beverage @ DB2 ) ) => ( DB1 = DB2 ) ) ) ).

thf(hot_coffee_syrup,interpretation-domain(syrup,d_syrup),
    ( ! [S: syrup] : ? [DS: d_syrup] : ( S = ( d2syrup @ DS ) )
    & ! [DS: d_syrup] : ( DS = d_date )
    & ! [DS1: d_syrup,DS2: d_syrup] :
        ( ( ( d2syrup @ DS1 ) = ( d2syrup @ DS2 ) ) => ( DS1 = DS2 ) ) ) ).

thf(hot_coffee,interpretation-mapping,
    ( ( ( mix @ ( d2beverage @ d_coffee ) @ ( d2syrup @ d_date ) ) 
      = ( d2beverage @ d_coffee ) )
    & ( ( heat @ ( d2beverage @ d_coffee ) ) 
      = ( d2beverage @ d_coffee ) )
    & ( ( heated_mix @ ( d2beverage @ d_coffee ) @ ( d2syrup @ d_date ) ) 
      = ( d2beverage @ d_coffee ) )
    & ( hot @ ( d2beverage @ d_coffee ) ) ) ).
%------------------------------------------------------------------------------
