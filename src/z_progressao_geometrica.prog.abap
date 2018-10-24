*&---------------------------------------------------------------------*
*& Report Z_PROGRESSAO_GEOMETRICA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_progressao_geometrica.

TYPES: y_i TYPE STANDARD TABLE OF i WITH EMPTY KEY.

DATA(razao) = VALUE i( ).
DATA(quant) = VALUE i( ).

cl_demo_input=>new( )->add_field( EXPORTING text = |Defina a Razão|                         CHANGING field = razao
                    )->add_field( EXPORTING text = |Defina a Quantidade de Números Gerados| CHANGING field = quant
                    )->request( ).

cl_demo_output=>new( )->begin_section( |Progressão Geométrica|
                     )->begin_section( |Estrutura montada pelo Reduce|
                     )->write( REDUCE #( INIT out TYPE y_i
                                              j   TYPE i
                                         FOR i = 1 UNTIL i > quant
                                         NEXT out = VALUE #( BASE out ( COND #( WHEN i = 1 THEN 1 ELSE j * razao ) ) )
                                              j   = COND  #( WHEN j = 0 THEN 1 ELSE j * razao ) )

                     )->begin_section( |Progressão Geométrica|
                     )->begin_section( |Estrutura montada pelo Value|
                     )->write( VALUE y_i( FOR i = 1 UNTIL i > quant
                                          LET j = COND #( WHEN i = 1 THEN 1 ELSE j * razao )
                                              k = COND #( WHEN i = 1 THEN 1 ELSE j ) IN ( J ) )
*                                              ( k * razao ) )
                                                )->display( ).
