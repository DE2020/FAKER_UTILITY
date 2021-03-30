class ZCL_UTIL_FAKER_TITLE definition
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

    CONSTANTS c_faker_name TYPE zif_util_faker=>ty_faker_name VALUE 'TITLE' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_UTIL_FAKER_TITLE IMPLEMENTATION.


  METHOD find_data.

*    DATA(n) = mmax_buffer + 20. " + un Margen
    TYPES:ttl_registros TYPE STANDARD TABLE OF string WITH DEFAULT KEY .

    DATA(ti_registros) = VALUE ttl_registros(
( |Administración de los tipos de datos de transformación| )
( |Algoritmos clasificadores| )
( |Análisis de coincidencia de identidades| )
( |Análisis de elementos QName| )
( |Archivos de memoria caché| )
( |Asignación de entrada de la transformación de consumidor de servicio web REST| )
( |Asignación de entrada de transformación de consumidor de servicio web| )
( |Asignación de salida de la transformación de consumidor de servicio web REST| )
( |Asignación de salida de transformación de consumidor de servicio web| )
( |Aumento del tamaño de la memoria caché por el Servicio de integración de datos| )
( |Caso práctico de índice persistente| )
( |Cómo analizar construcciones XML en mensajes SOAP| )
( |Cómo analizar elementos anyType| )
( |Cómo analizar grupos de sustitución| )
( |Cómo analizar tipos derivados| )
( |UNIDAD I. ANTECEDENTES DE LA INFORMÁTICA| )
( | 1. Evolución histórica de las diversas formas de procesamiento de la información.| )
( | 2. Terminología básica usada en informática y computación.| )
( | 3. Implicaciones sociales de las computadoras.| )
( | 4. Aplicaciones| )
( |UNIDAD II. ESTRUCTURA FÍSICA DE UNA COMPUTADORA| )
( | 1. Equipo central de una computadora.| )
( | 2. Equipo periférico.| )
( | 3. Teclado.| )
( |UNIDAD III. PROCESAMIENTO DE TEXTOS.| )
( | 1. Programa de aplicación: procesador de textos.| )
( | 2. Partes básicas de un documento.| )
( | 3. Comandos básicos para el manejo del procesador de textos.| )
( |UNIDAD IV. ESTRUCTURA LÓGICA DE UNA COMPUTADORA| )
( | 1. Sistema numérico.| )
( | 2. Sistema operativo.| )
( | 3. Virus.| )
( |UNIDAD V. METODOLOGÍA DE SOLUCIÓN DE PROBLEMAS Y PROGRAMACIÓN| )
( | 1. Método de solución de problemas.| )
( | 2. Lenguajes de programación.| )
( | 3. Fundamentos de programación en un lenguaje estructurado.| )
( |UNIDAD VI. SOFTWARE DE APLICACIÓN Y SERVICIOS DE RED| )
( | 1. Ambientes gráficos. | )
( | 2. Hojas de cálculo.| )
( | 3. Manejadores de bases de datos.| )
( | 4. Editores gráficos.| )
( | 5. Servicios de red. | )
( |Cómo configurar una estrategia de agrupación| )
( |Cómo configurar una estrategia de clasificador| )
( |Cómo configurar una estrategia de estandarización| )
( |Cómo configurar una estrategia de fusión| )
( |Cómo crear una transformación| )
( |Tip #1 — Beautify| )
( |Tip #3 — Color HightLight| )
( |Tip #2 — BookMarks| )
( |Tip #4 — Dracula Official| )
( |Tip #5 — Winter is Coming| )
( |Tip #6 — Git History| )
( |Tip #7 — GitLens| )
( |Tip #8 — Guides| )
( |Tip #9 — Live Server| )
( |Tip #10 — Path Intellisense| )
( |Tip #11 — Rainbow Brackets| )
( |Tip #12 — Live Share| )
( |Tip #13 — VsCode-icons| )
( |Tip #14 — Azure Tools| )
( |Kotlin Bootcamp for Programmers| )
( |Data and file storage overview| )
( |Handle mixed connectivity| )
( |Build for device range| )
( |Use battery efficiently| )
( |Provide data controls| )
( |UI and content| )
( |AndroidX| )
( |Jetpack Compose| )
( |AndroidX Test| )
( |AndroidX Constraint Layout| )
( |Databinding Library| )
( |Android Automotive Library| )
( |Android for Cars App Library (Beta)| )
( |Android Wearable Library| )
( |Material Components| )
( |Android NDK| )
( |Play In-app Billing Library| )
( |Play Core Library| )
( |Play Install Referrer library| )
( |Cómo desarrollar una transformación| )
( |Cómo trabajar con la interfaz avanzada| )
( |Cómo trabajar con la interfaz simple| )
( |Cómo utilizar el cuadro de diálogo Definir función para definir una expresión| )
( |Condición de filtro| )
( |Configuración de la transformación de consumidor de servicio web REST| )
( |Configuración de salidas de ocurrencia múltiple| )
( |Configurar una estrategia de análisis de patrones| )
( |Configurar una estrategia de análisis de tokens| )
( |Consejos sobre el rendimiento de la transformación de filtro| )
( |Creación de la transformación de consumidor de servicio web REST| )
( |Crear una transformación de consumidor de servicio web| )
( |Cuando utilizar una transformación de analizador| )
( |Ejemplo de análisis de clasificador| )
( |Ejemplo de análisis de coincidencia de identidades| )
( |Ejemplo de transformación de consumidor de servicio web| )
( |Estrategia de cadena| )
( |Estrategia NYSIIS| )
( |Estrategia Soundex| )
( |Estrategias de clasificador| )
( |Estrategias de coincidencia de identidades| )
( |Estrategias de estandarización| )
( |Expresiones dinámicas| )
( |Expresiones en transformaciones| )
( |Flujo de proceso para el análisis de coincidencia de identidades| )
( |Interfaz de usuario de transformación| )
( |Introducción al resumen de las transformaciones| )
( |Métodos HTTP| )
( |Modelos de clasificador| )
( |Modo de análisis basado en patrones| )
( |Modos de transformación del analizador| )
( |Niveles de seguimiento| )
( |Opciones de la transformación de clasificador| )
( |Opciones de salida de coincidencia de identidades| )
( |Operaciones de análisis de tokens| )
( |Optimización del tamaño de la memoria caché| )
( |Optimizaciones de filtro| )
( |Probar expresiones| )
( |Propiedades avanzadas de coincidencia de identidades| )
( |Propiedades avanzadas de la transformación de consumidor de servicio web| )
( |Propiedades avanzadas de la transformación de consumidor de servicio web REST| )
( |Propiedades avanzadas de la transformación de expresión| )
( |Propiedades avanzadas de la transformación de filtro| )
( |Propiedades avanzadas de Transformación de analizador| )
( |Propiedades avanzadas de Transformación de clasificador| )
( |Propiedades avanzadas de Transformación de estandarizador| )
( |Propiedades avanzadas de Transformación de fusión| )
( |Propiedades avanzadas de Transformación de generador de claves| )
( |Propiedades de estandarización| )
( |Propiedades de la creación de claves| )
( |Propiedades de tipo de coincidencia de identidades| )
( |Propiedades del análisis de tokens| )
( |Puertos de la transformación de consumidor de servicio web REST| )
( |Puertos de salida del generador de claves| )
( |Puertos de transformación| )
( |Puertos de transformación de consumidor de servicio web| )
( |Puertos de transformación de expresión| )
( |Puertos del análisis de tokens| )
( |Referencia API de la clase JExpression| )
( |Resumen de la transformación de analizador| )
( |Resumen de la transformación de clasificador| )
( |Resumen de la transformación de consumidor de servicio web| )
( |Resumen de la transformación de consumidor de servicio web REST| )
( |Resumen de la transformación de estandarizador| )
( |Resumen de la transformación de expresión| )
( |Resumen de la transformación de filtro| )
( |Resumen de la transformación de fusión| )
( |Resumen de la transformación de generador de claves| )
( |Resumen de las expresiones de Java| )
( |Resumen de memorias caché de transformaciones| )
( |Resumen del análisis de mensajes SOAP del servicio web| )
( |Selección WSDL| )
( |Selectores de puerto| )
( |Tamaño de la memoria caché| )
( |Tamaño de la memoria caché para memorias caché con particiones| )
( |Tipos de memoria caché| )
( |Transformaciones de filtro en asignaciones dinámicas| )
( |Transformaciones de varios grupos| )
( |Transformaciones no reutilizables| )
( |Transformaciones reutilizables| )
( |Uso de los datos de referencia en la transformación de analizador| )
( |Valores predeterminados para los puertos| )
( |Variables locales| )
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
