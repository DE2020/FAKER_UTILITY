class ZCL_UTIL_FAKER_CHAR definition
  public
  inheriting from ZCL_UTIL_FAKER_ABS
  final
  create public .

public section.

  methods GET_FAKER_NAME
    redefinition .
protected section.

  methods FIND_DATA
    redefinition .
private section.

  constants C_FAKER_NAME type ZCL_UTIL_FAKER_ABS=>TY_FAKER_NAME value 'EMAIL' ##NO_TEXT.
  data PATTERN type STRING value 'ABCDEF' ##NO_TEXT.
  data LONG_CHAR type I value 5 ##NO_TEXT.
ENDCLASS.



CLASS ZCL_UTIL_FAKER_CHAR IMPLEMENTATION.


  METHOD find_data.

    DATA caracteres TYPE string VALUE 'ABCDEFG'.

    DATA ti TYPE TABLE OF string WITH DEFAULT KEY.

    DATA(lg) = strlen( pattern ).

*    random_int( max = lg ).
    DO mmax_buffer TIMES.
      APPEND INITIAL LINE TO ti ASSIGNING FIELD-SYMBOL(<l>).
      DO long_char TIMES.
        DATA(pos) = zcl_util_faker=>random_int( max = strlen( pattern ) ).
        <l> = <l> && pattern+pos(1).
      ENDDO.
    ENDDO.

    IF munique = abap_true.
      SORT ti.
      DELETE ADJACENT DUPLICATES FROM ti.
    ENDIF.

    set_list( ti ).

  ENDMETHOD.


  METHOD GET_FAKER_NAME.
    r = c_faker_name.
  ENDMETHOD.
ENDCLASS.
