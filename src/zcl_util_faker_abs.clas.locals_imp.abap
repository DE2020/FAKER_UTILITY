*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_buffer IMPLEMENTATION.
  METHOD unique_for_content.
    DATA l_buffer TYPE STANDARD TABLE OF tyl_buffer WITH DEFAULT KEY.
    l_buffer = mbuffer.
    SORT l_buffer BY dt.
    delete ADJACENT DUPLICATES FROM l_buffer COMPARING dt.
  ENDMETHOD.
  METHOD pop.
    DATA ldref_record TYPE REF TO data. "

    DATA l_buffer TYPE STANDARD TABLE OF tyl_buffer WITH DEFAULT KEY.

    l_buffer = mbuffer.

    FIELD-SYMBOLS: <ls_record> LIKE LINE OF l_buffer.
    FIELD-SYMBOLS: <any> TYPE any.

    DATA(rnd) = zcl_util_faker=>random_int( max = lines( ) ).

    READ TABLE l_buffer ASSIGNING <ls_record> INDEX rnd.
    IF sy-subrc = 0.
      ASSIGN <ls_record>-dt->* TO <any>.
      MOVE <any> TO val.
      IF remove = abap_true.
        CALL METHOD remove
          EXPORTING
            ikey   = <ls_record>-clave
          EXCEPTIONS
            OTHERS = 0.
      ENDIF.
    ENDIF.

  ENDMETHOD.
  METHOD push.
    mclave = mclave + c_inc_clave.
    add(
      EXPORTING
        ikey  = mclave
        idata = val
      EXCEPTIONS
       OTHERS    = 0
      ).
  ENDMETHOD.
ENDCLASS.
