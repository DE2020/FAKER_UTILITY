*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section


CLASS lcl_buffer DEFINITION.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF tyl_buffer,
        clave TYPE string,
        dt    TYPE REF TO data,
      END OF tyl_buffer .
    TYPES:
      ttl_buffer TYPE HASHED TABLE OF tyl_buffer WITH UNIQUE KEY clave .

    CONSTANTS c_inc_clave TYPE n LENGTH 10 VALUE '0000000001'.
    DATA mclave TYPE n LENGTH 10.

    DATA mbuffer TYPE ttl_buffer .

    METHODS push IMPORTING val TYPE any.
    METHODS pop IMPORTING remove TYPE abap_bool DEFAULT abap_false
                EXPORTING val    TYPE any.
    METHODS unique_for_content.

    METHODS add
      IMPORTING
        !ikey  TYPE any
        !idata TYPE any
        !irps  TYPE abap_bool DEFAULT abap_false
      EXCEPTIONS
        duplicado .
    METHODS get
      IMPORTING
        !ikey  TYPE any
      EXPORTING
        !idata TYPE any
      EXCEPTIONS
        no_existe .
    METHODS clear .
    METHODS get_table
      RETURNING
        VALUE(r) TYPE ttl_buffer .
    METHODS lines
      RETURNING
        VALUE(r) TYPE i .
    METHODS remove
      IMPORTING
        !low    TYPE tyl_buffer-clave
        !high   TYPE tyl_buffer-clave OPTIONAL
        !sign   TYPE sychar01 DEFAULT 'I'
        !option TYPE sychar02 DEFAULT 'EQ'
      EXCEPTIONS
        no_existe .
ENDCLASS.
