*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section


CLASS lcl_buffer DEFINITION INHERITING FROM zcl_abap_tool_buffer_01.

  PUBLIC SECTION.
    CONSTANTS c_inc_clave TYPE n LENGTH 10 VALUE '0000000001'.
    DATA mclave TYPE n LENGTH 10.
    METHODS push IMPORTING val TYPE any.
    METHODS pop IMPORTING remove TYPE abap_bool DEFAULT abap_false
                EXPORTING val    TYPE any.
    METHODS unique_for_content.
ENDCLASS.
