*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_buffer IMPLEMENTATION.
  METHOD unique_for_content.
    DATA l_buffer TYPE STANDARD TABLE OF tyl_buffer WITH DEFAULT KEY.
    l_buffer = mbuffer.
    SORT l_buffer BY dt.
    DELETE ADJACENT DUPLICATES FROM l_buffer COMPARING dt.
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
            low    = <ls_record>-clave
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
  METHOD add.
    DATA ln LIKE LINE OF mbuffer. "
    DATA ldref_record TYPE REF TO data.
    FIELD-SYMBOLS: <ls_record> TYPE any.

    CREATE DATA ldref_record LIKE idata.
    ASSIGN ldref_record->* TO <ls_record>.
    MOVE idata TO <ls_record>.
    GET REFERENCE OF <ls_record> INTO ln-dt.
    ln-clave = ikey.
    INSERT ln INTO TABLE mbuffer.
    IF sy-subrc NE 0.
      IF irps NE space.
        MODIFY TABLE mbuffer FROM ln TRANSPORTING dt.
      ELSE.
        RAISE duplicado.
      ENDIF.
    ENDIF.
  ENDMETHOD.
  METHOD clear.
    CLEAR mbuffer.
  ENDMETHOD.
  METHOD get.
    DATA ldref_record TYPE REF TO data. "
    FIELD-SYMBOLS: <ls_record> LIKE LINE OF mbuffer.
    FIELD-SYMBOLS: <any> TYPE any.
    READ TABLE mbuffer ASSIGNING <ls_record> WITH TABLE KEY clave = ikey.
    IF sy-subrc NE 0.
      RAISE no_existe.
    ENDIF.
    ASSIGN <ls_record>-dt->* TO <any>.
    MOVE <any> TO idata.
  ENDMETHOD.
  METHOD get_table.
    r = mbuffer.
  ENDMETHOD.
  METHOD lines.
    DESCRIBE TABLE mbuffer LINES r.
  ENDMETHOD.
  METHOD remove.
    DATA rkey TYPE RANGE OF tyl_buffer-clave.
    APPEND INITIAL LINE TO rkey ASSIGNING FIELD-SYMBOL(<r>).
    <r>-low    = low.
    <r>-high   = high.
    <r>-sign   = sign.
    <r>-option = option.

    DELETE mbuffer WHERE clave IN rkey.
    IF sy-subrc NE 0.
      RAISE no_existe.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
