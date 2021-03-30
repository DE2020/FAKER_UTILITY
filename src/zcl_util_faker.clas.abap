class ZCL_UTIL_FAKER definition
  public
  create public .

public section.

  types:
    BEGIN OF ty_clsif,
        faker_name TYPE zif_util_faker=>ty_faker_name,
        clsname    TYPE vseoifimpl-clsname,
        inst       TYPE REF TO zcl_util_faker_abs,
      END OF ty_clsif .
  types:
    tt_clsif TYPE HASHED TABLE OF ty_clsif WITH UNIQUE KEY faker_name .

  data TCLSNAME type TT_CLSIF .

  methods CONSTRUCTOR .
  class-methods RANDOM_INT
    importing
      !MIN type I default 1
      !MAX type I default 100
    returning
      value(R) type I .
  class-methods FACTORY
    exporting
      value(OFAKER) type ref to ZCL_UTIL_FAKER .
  methods FAKER
    importing
      !FAKER_NAME type STRING
    returning
      value(R) type ref to ZCL_UTIL_FAKER_ABS .
  class-methods LIST_DOMVALUE
    importing
      !DOMNAME type DD07L-DOMNAME
    returning
      value(R) type SRT_STRINGS .
  PROTECTED SECTION.

    DATA munique TYPE abap_bool .
private section.

  class-data BUFFER_RND type ref to ZCL_ABAP_TOOL_BUFFER_01 .
ENDCLASS.



CLASS ZCL_UTIL_FAKER IMPLEMENTATION.


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


  METHOD LIST_DOMVALUE.
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
ENDCLASS.
