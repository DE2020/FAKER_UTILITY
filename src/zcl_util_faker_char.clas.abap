CLASS zcl_util_faker_char DEFINITION
  PUBLIC
  INHERITING FROM zcl_util_faker_abs
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_faker_name
        REDEFINITION .
    CONSTANTS c_pattern_01 TYPE string VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
    CONSTANTS c_pattern_02 TYPE string VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.

    DATA pattern TYPE string VALUE c_pattern_01.
    DATA long_char TYPE i VALUE 5 .
  PROTECTED SECTION.

    METHODS find_data
        REDEFINITION .

  PRIVATE SECTION.

    CONSTANTS c_faker_name TYPE zcl_util_faker_abs=>ty_faker_name VALUE 'CHAR'.

ENDCLASS.



CLASS zcl_util_faker_char IMPLEMENTATION.


  METHOD find_data.

    DATA caracteres TYPE string VALUE 'ABCDEFG'.

    DATA ti TYPE TABLE OF string WITH DEFAULT KEY.

    DATA(lg) = strlen( pattern ).

    DO mmax_buffer TIMES.
      APPEND INITIAL LINE TO ti ASSIGNING FIELD-SYMBOL(<l>).
      DO long_char TIMES.
        DATA(pos) = ( zcl_util_faker=>random_int( max = strlen( pattern ) ) ) - 1.
        <l> = <l> && pattern+pos(1).
      ENDDO.
    ENDDO.

    IF munique = abap_true.
      SORT ti.
      DELETE ADJACENT DUPLICATES FROM ti.
    ENDIF.

    set_list( ti ).

  ENDMETHOD.


  METHOD get_faker_name.
    r = c_faker_name.
  ENDMETHOD.
ENDCLASS.
