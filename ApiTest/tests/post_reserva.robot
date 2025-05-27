*** Settings ***
Resource    ../resources/post_resource.robot
Resource    ../resources/post_reserva_resource.robot

*** Test Cases ***
Cenário 02: Criar uma reserva com sucesso como usuário autenticado
    Criar uma seção no Booker
    Criar uma nova reserva
    ...    Jim
    ...    Brown
    ...    111
    ...    True
    ...    2018-01-01
    ...    2019-01-01
    ...    Breakfast
