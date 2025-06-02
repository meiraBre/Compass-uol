*** Settings ***
Resource    ../Resources/base_resource.robot

*** Variables ***
${USERNAME}    admin
${PASSWORD}    password123

*** Keywords ***
Criar sessão com header
    ${HEADERS}    Create Dictionary    Content-Type=application/json
    Create Session    alias=Booker    url=${URL}    headers=${HEADERS}

Criar body de autenticação
    ${BODY}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    Set global Variable    ${BODY}

Fazer uma requisição 
    ${RESPONSE}=    Post on Session    Booker    /auth    json=${BODY}
    Set global Variable    ${RESPONSE}

Armazenar o token gerado
    ${TOKEN}    Set Variable    ${RESPONSE.json()['token']}
    Log    Token gerado: ${TOKEN}
    Set global Variable    ${TOKEN}

Validar se o token é válido
    Should Not Be Empty    ${TOKEN}
    Log To Console    Token recebido: ${TOKEN}
