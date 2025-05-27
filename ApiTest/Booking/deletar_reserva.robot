*** Settings ***
Resource    base.robot
Resource    ../Auth/auth.robot

*** Keywords ***
Deletar uma reserva com ID válido
    [Arguments]    ${ID}
    ${HEADERS}    Create Dictionary
    ...    Cookie=token=${TOKEN}

    ${RESPOSTA}    DELETE On Session
    ...    alias=Booker
    ...    url=/booking/${ID}
    ...    headers=${HEADERS}

    Should Be Equal As Integers    ${RESPOSTA.status_code}    201
    Log    Reserva deletada com sucesso.