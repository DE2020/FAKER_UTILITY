CLASS zcl_util_faker_comp_hierarchy DEFINITION
  PUBLIC
  INHERITING FROM zcl_util_faker_abs
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_faker_name
        REDEFINITION .

  PROTECTED SECTION.

    METHODS find_data
        REDEFINITION .

  PRIVATE SECTION.

    CONSTANTS c_faker_name TYPE zcl_util_faker_abs=>ty_faker_name VALUE 'COMPONENT_HIERARCHY' ##NO_TEXT.

ENDCLASS.



CLASS zcl_util_faker_comp_hierarchy IMPLEMENTATION.

  METHOD find_data.

    DATA params TYPE dfparam.
    DATA: nodetab TYPE STANDARD TABLE OF snodetext.

    CALL FUNCTION 'BM_COMPONENT_HIERARCHY_GET'
      EXPORTING
        levels              = 1
        language            = sy-langu
        params              = params
        ignore_sfw_switches = space
      TABLES
        nodetab             = nodetab.

    DATA ti_registros TYPE STANDARD TABLE OF string WITH DEFAULT KEY .

    LOOP AT nodetab ASSIGNING FIELD-SYMBOL(<n>).
      APPEND |{ <n>-text }/{ <n>-text4 }| TO ti_registros.
    ENDLOOP.

    IF munique = abap_true.
      SORT ti_registros.
      DELETE ADJACENT DUPLICATES FROM ti_registros.
    ENDIF.

    set_list( ti_registros ).
  ENDMETHOD.


  METHOD get_faker_name.
    r = c_faker_name.
  ENDMETHOD.
ENDCLASS.
