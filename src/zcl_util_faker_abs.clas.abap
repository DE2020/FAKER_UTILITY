CLASS zcl_util_faker_abs DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_faker_name TYPE string .

    DATA munique TYPE abap_bool .
    DATA mmax_buffer TYPE i VALUE 100 ##NO_TEXT.

    METHODS clear_values .
    METHODS constructor .
    METHODS get_faker_name ABSTRACT
      RETURNING
        VALUE(r) TYPE ty_faker_name .
    METHODS get_string
      IMPORTING
        !len     TYPE i DEFAULT 100
      RETURNING
        VALUE(r) TYPE string .
    METHODS max_buffer
      IMPORTING
        !max     TYPE i
      RETURNING
        VALUE(r) TYPE REF TO zcl_util_faker_abs .
    METHODS pop
      IMPORTING
        !remove TYPE abap_bool DEFAULT abap_true
      EXPORTING
        !val    TYPE any .
    METHODS push
      IMPORTING
        !value   TYPE any
      RETURNING
        VALUE(r) TYPE REF TO zcl_util_faker_abs .
    METHODS set_list
      IMPORTING
        !list    TYPE ANY TABLE
      RETURNING
        VALUE(r) TYPE REF TO zcl_util_faker_abs .
    METHODS unique
      RETURNING
        VALUE(r) TYPE REF TO zcl_util_faker_abs .
    METHODS set_property
      IMPORTING
        !field   TYPE string
        !value   TYPE any
      RETURNING
        VALUE(r) TYPE REF TO zcl_util_faker_abs .
  PROTECTED SECTION.

    METHODS find_data
        ABSTRACT .
    METHODS unique_for_content
      RETURNING
        VALUE(r) TYPE REF TO zcl_util_faker_abs .

  PRIVATE SECTION.

   DATA buffer TYPE REF TO lcl_buffer .
ENDCLASS.



CLASS ZCL_UTIL_FAKER_ABS IMPLEMENTATION.


  METHOD clear_values.
    buffer->clear( ).
  ENDMETHOD.


  METHOD constructor.
    CREATE OBJECT buffer.
  ENDMETHOD.


  METHOD get_string.
    pop(
      IMPORTING
        val    = r ).
  ENDMETHOD.


  METHOD max_buffer.
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
    ASSIGN me->(field) TO FIELD-SYMBOL(<any>).
    IF sy-subrc = 0.
      <any> = value.
    ENDIF.
    r = me.
  ENDMETHOD.


  METHOD unique.
    munique = abap_true.
    r = me.
  ENDMETHOD.


  METHOD unique_for_content.
    buffer->unique_for_content( ).
    r = me.
  ENDMETHOD.
ENDCLASS.
