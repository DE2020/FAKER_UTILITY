class ZCL_UTIL_FAKER_ABS definition
  public
  abstract
  create public .

public section.

  types TY_FAKER_NAME type STRING .

  data MUNIQUE type ABAP_BOOL .
  data MMAX_BUFFER type I value 100 ##NO_TEXT.

  methods CLEAR_VALUES .
  methods CONSTRUCTOR .
  methods GET_FAKER_NAME
    returning
      value(R) type TY_FAKER_NAME .
  methods GET_STRING
    importing
      !LEN type I default 100
    returning
      value(R) type STRING .
  methods MAX_BUFFER
    importing
      !MAX type I
    returning
      value(R) type ref to ZCL_UTIL_FAKER_ABS .
  methods POP
    importing
      !REMOVE type ABAP_BOOL default ABAP_TRUE
    exporting
      !VAL type ANY .
  methods PUSH
    importing
      !VALUE type ANY
    returning
      value(R) type ref to ZCL_UTIL_FAKER_ABS .
  methods SET_LIST
    importing
      !LIST type ANY TABLE
    returning
      value(R) type ref to ZCL_UTIL_FAKER_ABS .
  methods UNIQUE
    returning
      value(R) type ref to ZCL_UTIL_FAKER_ABS .
  methods SET_PROPERTY
    importing
      !FIELD type STRING
      !VALUE type ANY
    returning
      value(R) type ref to ZCL_UTIL_FAKER_ABS .
protected section.

  methods FIND_DATA
  abstract .
  methods UNIQUE_FOR_CONTENT
    returning
      value(R) type ref to ZCL_UTIL_FAKER_ABS .
private section.

  data BUFFER type ref to LCL_BUFFER .
ENDCLASS.



CLASS ZCL_UTIL_FAKER_ABS IMPLEMENTATION.


  METHOD clear_values.
    buffer->clear( ).
  ENDMETHOD.


  METHOD constructor.
    CREATE OBJECT buffer.
  ENDMETHOD.


  METHOD GET_FAKER_NAME.
** redefinir
  ENDMETHOD.


  METHOD GET_STRING.
    pop(
      IMPORTING
        val    = r ).
  ENDMETHOD.


  METHOD MAX_BUFFER.
    mmax_buffer = max.
    r = me.
  ENDMETHOD.


  METHOD pop.
    IF buffer->lines( ) = 0.
      find_data( ).
    ENDIF.
    buffer->pop( EXPORTING remove = remove IMPORTING val = val ).
  ENDMETHOD.


  METHOD push.
    buffer->push( value ).
  ENDMETHOD.


  METHOD set_list.
    LOOP AT list ASSIGNING FIELD-SYMBOL(<l>).
      push( <l> ).
    ENDLOOP.
    r = me.
  ENDMETHOD.


  METHOD set_property.
    ASSIGN (field) TO FIELD-SYMBOL(<any>).
    IF sy-subrc = 0.
      <any> = value.
    ENDIF.
    r = me.
  ENDMETHOD.


  METHOD UNIQUE.
    munique = abap_true.
    r = me.
  ENDMETHOD.


  METHOD unique_for_content.
    buffer->unique_for_content( ).
    r = me.
  ENDMETHOD.
ENDCLASS.
