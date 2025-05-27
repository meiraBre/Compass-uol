*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${USERNAME}    admin
${PASSWORD}    password123
${BASE_URL}    https://restful-booker.herokuapp.com

*** Keywords ***
Criar uma seção no Booker
    ${HEADERS}    Create Dictionary    Content-Type=application/json
    Create Session    alias=Booker    url=${BASE_URL}    headers=${HEADERS}

Gerar token de autenticação
    ${BODY}    Create Dictionary
    ...    username=${USERNAME}
    ...    password=${PASSWORD}

    ${RESPOSTA}    POST On Session
    ...    alias=Booker
    ...    url=/auth
    ...    json=${BODY}

    ${TOKEN}    Set Variable    ${RESPOSTA.json()['token']}
    Log    Token gerado: ${TOKEN}
    Set global Variable    ${TOKEN}
    Set Global Variable    ${RESPOSTA}

Validar o login
    Should Be Equal    ${RESPOSTA.json(["message"])}    200 OK








    