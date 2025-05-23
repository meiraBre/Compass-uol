*** Settings ***
Library    RequestsLibrary
Library    String
Resource    post_resource.robot    # Importa a autenticação

*** Keywords ***
Atualizar uma reserva com ID válido
    [Arguments]    ${ID}    ${BODY}

    ${HEADERS}    Create Dictionary
    ...    Content-Type=application/json
    ...    Accept=application/json
    ...    Cookie=token=${TOKEN}

    ${RESPOSTA}    PUT On Session
    ...    alias=Booker
    ...    url=/booking/${ID}
    ...    headers=${HEADERS}
    ...    json=${BODY}

    Log    Status Code: ${RESPOSTA.status_code}
    Log    Response: ${RESPOSTA.json()}
