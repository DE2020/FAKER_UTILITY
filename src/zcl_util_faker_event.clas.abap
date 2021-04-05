class ZCL_UTIL_FAKER_EVENT definition
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

    CONSTANTS c_faker_name TYPE zcl_util_faker_abs=>ty_faker_name VALUE 'EVENT' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_UTIL_FAKER_EVENT IMPLEMENTATION.


  METHOD find_data.

*    DATA(n) = mmax_buffer + 20. " + un Margen
    TYPES:ttl_registros TYPE STANDARD TABLE OF string WITH DEFAULT KEY .

    DATA(ti_registros) = VALUE ttl_registros(
     ( |Post-Procesamiento| )
     ( |Pre-Procesamiento| )
     ( |Procesamiento| )
     ( |Pre-Inicio| )
     ( |Post-Inicio| )
     ( |Inicio| )
     ( |Pre-Final| )
     ( |Post-Final| )
     ( |Final| )
     ( |Pre-Guardado| )
     ( |Post-Guardado| )
     ( |Guardado| )
     ( |Pre-Registro| )
     ( |Post-Registro| )
     ( |Registro| )
     ( |Pre-Transformación| )
     ( |Post-Transformación| )
     ( |Transformación| )
     ( |Pre-Control| )
     ( |POst-Control| )
     ( |Control| )
     ( |Pre-Análisis| )
     ( |Post-Análisis| )
     ( |Análisis| )
     ( |Pre-Presentación| )
     ( |Post-Presentación| )
     ( |Presentación| )
     ( |Pre-Introducción| ) ( |Post-Introducción| )  ( |Introducción| )
     ( |Pre-Administración| ) ( |Post-Administración| )  ( |Administración| )
      ).

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
