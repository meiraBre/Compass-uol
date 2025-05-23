*** Settings ***
Library    RequestsLibrary
Library    String

*** Keywords ***
Deletar uma reserva com ID válido
    [Arguments]    ${ID}    ${TOKEN}
    ${HEADERS}    Create Dictionary
    ...    Content-Type=application/json
    ...    Cookie=token=${TOKEN}

    ${RESPOSTA}    DELETE On Session
    ...    alias=Booker
    ...    url=/booking/${ID}
    ...    headers=${HEADERS}

    Log    Status Code: ${RESPOSTA.status_code}
    Log    Response Text: ${RESPOSTA.text}
    Should Be Equal As Numbers    ${RESPOSTA.status_code}    201


