class ZCL_UTIL_FAKER_VALUES definition
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

    CONSTANTS c_faker_name TYPE zif_util_faker=>ty_faker_name VALUE 'EMAIL' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_UTIL_FAKER_VALUES IMPLEMENTATION.


  METHOD find_data.

    IF munique = abap_true.
      unique_for_content( ).
    ENDIF.

  ENDMETHOD.


  METHOD get_faker_name.
    r = 'VALUES'.
  ENDMETHOD.
ENDCLASS.
