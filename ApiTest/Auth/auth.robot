*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${USERNAME}    admin
${PASSWORD}    password123
${BASE_URL}    https://restful-booker.herokuapp.com

*** Test Cases ***
Cenário 01: Fazer login de um usuário para ele poder atualizar e deletar reservas 
    Criar uma seção no Booker
    Gerar token de autenticação
    
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



