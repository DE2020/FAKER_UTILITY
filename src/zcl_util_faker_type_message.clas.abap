class ZCL_UTIL_FAKER_TYPE_MESSAGE definition
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
PRIVATE SECTION.

  CONSTANTS c_faker_name TYPE zcl_util_faker_abs=>ty_faker_name VALUE 'TYPE_MESSAGE' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_UTIL_FAKER_TYPE_MESSAGE IMPLEMENTATION.


  METHOD find_data.

    TYPES:ttl_registros TYPE STANDARD TABLE OF string WITH DEFAULT KEY .

    DATA(ti_registros) = VALUE ttl_registros(
        ( |S| )
        ( |I| )
        ( |W| )
        ( |E| )
        ( |A| )
         ).

    IF munique = abap_true.
      SORT ti_registros.
      DELETE ADJACENT DUPLICATES FROM ti_registros.
    ENDIF.

    set_list( ti_registros ).

  ENDMETHOD.


  METHOD GET_FAKER_NAME.
    r = c_faker_name.
  ENDMETHOD.
ENDCLASS.
