
CLASS lcl_faker_test_01 DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>lcl_Faker_Test_01
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZCL_UTIL_FAKER
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE/>
*?<GENERATE_CLASS_FIXTURE/>
*?<GENERATE_INVOCATION/>
*?<GENERATE_ASSERT_EQUAL/>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  PRIVATE SECTION.
    DATA:
      ofaker TYPE REF TO zcl_util_faker.  "class under test

    METHODS: test_email  FOR TESTING.
    METHODS: test_values FOR TESTING.
    METHODS: test_values2 FOR TESTING.
ENDCLASS.       "lcl_Faker_Test_01


CLASS lcl_faker_test_01 IMPLEMENTATION.

  METHOD test_values2.
    zcl_util_faker=>factory( IMPORTING ofaker = ofaker ).

    cl_abap_unit_assert=>assert_not_initial(
         ofaker->faker( 'VALUES'
               )->set_list(
                  zcl_util_faker=>list_domvalue( '/BOBF/FRW_ACCESS_TYPE' )
                )->unique(
               )->get_string( )
    ). " Si es inicial, Error

    DATA ex_not_defined TYPE sxmsflag.
    DATA im_value       TYPE sxmsvalue.
    im_value = ofaker->faker( 'VALUES' )->get_string( ).

    CALL FUNCTION 'SXMB_CHECK_DOMAIN_VALUES'
      EXPORTING
        im_value       = im_value
        im_domain      = '/BOBF/FRW_ACCESS_TYPE'
      IMPORTING
        ex_not_defined = ex_not_defined.

    cl_abap_unit_assert=>assert_initial( ex_not_defined ).

  ENDMETHOD.

  METHOD test_values.
    zcl_util_faker=>factory( IMPORTING ofaker = ofaker ).

    cl_abap_unit_assert=>assert_not_initial(
         ofaker->faker( 'VALUES'
               )->set_list( VALUE srt_strings(
                 ( |Valor 001| )
                 ( |Valor 002| )
                 ( |Valor 003| )
                 ( |Valor 004| )
                 ( |Valor 005| )
                 ( |Valor 006| )
                 ( |Valor 007| )
                 ( |Valor 008| )
                 ( |Valor 009| )
                 ( |Valor 010| )
                 ( |Valor 011| )
                 ( |Valor 012| )
                 ( |Valor 013| )
                 ( |Valor 014| )
                 ( |Valor 015| )
                 ( |Valor 016| )
                 ( |Valor 017| )
                 ( |Valor 018| )
                 ( |Valor 019| )
                 ( |Valor 020| )
                  ) )->unique(
               )->get_string( )
  ). " Si es inicial, Error

    zcl_util_faker=>factory( IMPORTING ofaker = DATA(ofaker2) ).

    cl_abap_unit_assert=>assert_not_initial(
         ofaker2->faker( faker_name = 'VALUES'
          )->set_list( VALUE srt_strings(
            ( |Valor A01| )
            ( |Valor A02| )
            ( |Valor A03| )
            ( |Valor A04| )
            ( |Valor A05| )
            ( |Valor A06| )
            ( |Valor A07| )
            ( |Valor A08| )
            ( |Valor A09| )
             ) )->unique(
          )->get_string( )
         ). " Si es inicial, Error

    cl_abap_unit_assert=>assert_not_initial(
        ofaker2->faker( 'VALUES' )->get_string( )
          ). " Si es inicial, Error

  ENDMETHOD.
  METHOD test_email.

    zcl_util_faker=>factory( IMPORTING ofaker = ofaker ).

    DATA(r1) = ofaker->faker( 'EMAIL' )->unique( )->max_buffer( 50 )->get_string( ).
    DATA(r2) = ofaker->faker( 'EMAIL' )->unique( )->max_buffer( 50 )->get_string( ).

    cl_abap_unit_assert=>assert_not_initial( r1 ). " Si es inicial, Error
    cl_abap_unit_assert=>assert_not_initial( r2 ). " Si es inicial, Error
    cl_abap_unit_assert=>assert_differs( act = r1 exp = r2 ). " Si son Iguales, Error

  ENDMETHOD.




ENDCLASS.
