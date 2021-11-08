CLASS zcl_util_faker DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_clsif,
        faker_name TYPE zcl_util_faker_abs=>ty_faker_name,
        clsname    TYPE vseoifimpl-clsname,
        inst       TYPE REF TO zcl_util_faker_abs,
      END OF ty_clsif .
    TYPES:
      tt_clsif TYPE HASHED TABLE OF ty_clsif WITH UNIQUE KEY faker_name .

    DATA tclsname TYPE tt_clsif .

    METHODS constructor .
    CLASS-METHODS random_int
      IMPORTING
        !min     TYPE i DEFAULT 1
        !max     TYPE i DEFAULT 100
      RETURNING
        VALUE(r) TYPE i .

    CLASS-METHODS random_bool
      IMPORTING
        !min     TYPE i DEFAULT 1
        !max     TYPE i DEFAULT 100
      RETURNING
        VALUE(r) TYPE abap_bool .

    CLASS-METHODS factory
      EXPORTING
        VALUE(ofaker) TYPE REF TO zcl_util_faker .
    METHODS faker
      IMPORTING
        !faker_name TYPE string
      RETURNING
        VALUE(r)    TYPE REF TO zcl_util_faker_abs .
    CLASS-METHODS list_domvalue
      IMPORTING
        !domname TYPE dd07l-domname
      RETURNING
        VALUE(r) TYPE srt_strings .
  PROTECTED SECTION.

    DATA munique TYPE abap_bool .
  PRIVATE SECTION.

    CLASS-DATA buffer_rnd TYPE REF TO zcl_abap_tool_buffer_01 .
ENDCLASS.



CLASS zcl_util_faker IMPLEMENTATION.


  METHOD constructor.
    TYPES: BEGIN OF ty_clsif1,
             clsname TYPE vseoifimpl-clsname,
           END OF ty_clsif1,
           tt_clsif1 TYPE STANDARD TABLE OF ty_clsif1 WITH EMPTY KEY.

    DATA tclsname1 TYPE tt_clsif1. "tclsname

    SELECT clsname FROM seometarel
             INTO TABLE tclsname1
            WHERE refclsname = 'ZCL_UTIL_FAKER_ABS'
              AND version = 1
              AND state   = 1.
    DATA if TYPE REF TO zcl_util_faker_abs.
    LOOP AT tclsname1 ASSIGNING FIELD-SYMBOL(<t>).
      CLEAR if.
      TRY .
          CREATE OBJECT if TYPE (<t>-clsname).
        CATCH cx_root.
          CONTINUE.
      ENDTRY.
      IF if->get_faker_name( ) = space.
        CONTINUE.
      ENDIF.
      TRY .
          INSERT VALUE #( faker_name = if->get_faker_name( )
                          clsname    = <t>-clsname
                          inst       = if )
             INTO TABLE tclsname.
        CATCH cx_root.
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.


  METHOD factory.
    CREATE OBJECT ofaker.
  ENDMETHOD.


  METHOD faker.
    READ TABLE tclsname ASSIGNING FIELD-SYMBOL(<l>)
       WITH TABLE KEY faker_name = faker_name.
    IF <l> IS ASSIGNED.
      r = <l>-inst.
    ENDIF.
  ENDMETHOD.


  METHOD list_domvalue.
    DATA dd07v_tab TYPE dd07v_tab.
    CALL FUNCTION 'DD_DOMVALUES_GET'
      EXPORTING
        domname   = domname
      TABLES
        dd07v_tab = dd07v_tab
      EXCEPTIONS
        OTHERS    = 0.

    LOOP AT dd07v_tab ASSIGNING FIELD-SYMBOL(<d>).
      APPEND <d>-domvalue_l TO r.
    ENDLOOP.
  ENDMETHOD.


  METHOD random_int.
    DATA rnd TYPE REF TO cl_abap_random_int.
    IF buffer_rnd IS INITIAL.
      CREATE OBJECT buffer_rnd.
    ENDIF.

    buffer_rnd->get( EXPORTING ikey = min && '/' && max IMPORTING idata = rnd EXCEPTIONS OTHERS = 100 ).
    IF sy-subrc <> 0.
      rnd = cl_abap_random_int=>create( min = min max = max ).
      buffer_rnd->add( EXPORTING ikey = min && '/' && max idata = rnd EXCEPTIONS OTHERS = 0 ).
    ENDIF.

    r = rnd->get_next( ).
  ENDMETHOD.
  METHOD random_bool.
    DATA rnd TYPE REF TO cl_abap_random_int.
    CASE CONV i( cl_abap_random_int=>create( min = 0 max = 1 )->get_next( ) ).
      WHEN 0.
        r = abap_true.
      WHEN OTHERS.
        r = abap_false.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
