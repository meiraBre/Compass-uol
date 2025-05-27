*** Settings ***
Resource    base.robot
Resource    ../Auth/auth.robot

*** Keywords ***
Atualizar uma reserva com ID válido
    [Arguments]    ${ID}    ${BODY}
    ${HEADERS}    Create Dictionary
    ...    Content-Type=application/json
    ...    Cookie=token=${TOKEN}

    ${RESPOSTA}    PUT On Session
    ...    alias=Booker
    ...    url=/booking/${ID}
    ...    headers=${HEADERS}
    ...    json=${BODY}

    Should Be Equal As Integers    ${RESPOSTA.status_code}    200
    Log    Reserva atualizada: ${RESPOSTA.json()}