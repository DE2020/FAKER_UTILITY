CLASS zcl_util_faker_values DEFINITION
  PUBLIC
  INHERITING FROM zcl_util_faker_abs
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_faker_name
        REDEFINITION .
    METHODS get_string REDEFINITION.
  PROTECTED SECTION.

    METHODS find_data
        REDEFINITION .
  PRIVATE SECTION.

    CONSTANTS c_faker_name TYPE zcl_util_faker_abs=>ty_faker_name VALUE 'VALUES' ##NO_TEXT.
ENDCLASS.



CLASS zcl_util_faker_values IMPLEMENTATION.


  METHOD find_data.

    IF munique = abap_true.
      unique_for_content( ).
    ENDIF.

  ENDMETHOD.


  METHOD get_faker_name.
    r = c_faker_name.
  ENDMETHOD.

  METHOD get_string.
    pop(
    EXPORTING remove = abap_false
      IMPORTING
        val    = r
         ).
  ENDMETHOD.
ENDCLASS.
