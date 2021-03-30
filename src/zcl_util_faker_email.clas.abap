class ZCL_UTIL_FAKER_EMAIL definition
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



CLASS ZCL_UTIL_FAKER_EMAIL IMPLEMENTATION.


  METHOD find_data.

    DATA(n) = mmax_buffer + 20. " + un Margen

    DATA ti_email TYPE TABLE OF scustom-email WITH DEFAULT KEY.

    SELECT email INTO TABLE ti_email UP TO n ROWS
        FROM scustom WHERE email <> space.

    IF munique = abap_true.
      SORT ti_email.
      DELETE ADJACENT DUPLICATES FROM ti_email.
    ENDIF.

    set_list( ti_email ).

  ENDMETHOD.


  METHOD get_faker_name.
    r = c_faker_name.
  ENDMETHOD.
ENDCLASS.
