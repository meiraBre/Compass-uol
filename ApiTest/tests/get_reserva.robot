*** Settings ***
Resource    ../resources/get_resource.robot

*** Variables ***
${ID_VALIDO}    1

*** Test Cases ***
Cenário 01: Buscar uma reserva específica
    Criar uma seção no Booker
    Consultar com um ID válido uma reserva    ${ID_VALIDO}


        