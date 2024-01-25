%------------------------------------------------------------------------------
cnf(c_0_15,interpretation-herbrand,
    ( created_equal(X1,X2) | ~ human(X1) | ~ human(X2) ) ).

cnf(c_0_16,interpretation-herbrand, ~ human(grade_of(X1)) ).

cnf(c_0_17,interpretation-herbrand, grade_of(esk3_0) = a ).

cnf(c_0_18,interpretation-herbrand, grade_of(john) = f ).

cnf(c_0_20,interpretation-herbrand,
    ( esk1_0 != esk2_0 | ~ human(esk1_0) | ~ human(esk2_0) ) ).

cnf(c_0_21,interpretation-herbrand,
    ( created_equal(esk1_0,esk2_0) | esk1_0 = esk2_0 ) ).

cnf(c_0_22,interpretation-herbrand, ( human(esk2_0) | esk1_0 = esk2_0 ) ).

cnf(c_0_23,interpretation-herbrand, ( human(esk1_0) | esk1_0 = esk2_0 ) ).

cnf(c_0_24,interpretation-herbrand, ~ human(a) ).

cnf(c_0_25,interpretation-herbrand, ~ human(f) ).

cnf(c_0_26,interpretation-herbrand, a != f ).

cnf(c_0_27,interpretation-herbrand, human(esk3_0) ).

cnf(c_0_28,interpretation-herbrand, human(john) ).
%------------------------------------------------------------------------------
