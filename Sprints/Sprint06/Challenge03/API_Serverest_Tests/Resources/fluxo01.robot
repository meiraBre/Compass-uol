*** Settings ***
Resouce    ../Tests/base.robot
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_Serverest}    https://compassuol.serverest.dev
&{HEADERS}          Content-Type=application/json
${NOME}             Fulano da Silva
${EMAIL}            juliana@qa.com
${PASSWORD}         teste123
${ADMINISTRADOR}    true

*** Test Cases ***
Cenário 01: Criar um usuário válido
    Criar uma sessão no Serverest 
    Cadastrar um usuário com as informações necessárias
    Validar a resposta com Status 201
    Armazenar o ID do novo usuário

*** Keywords ***
Criar uma sessão no Serverest
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Cadastrar um usuário com as informações necessárias
    ${BODY}=    Create Dictionary
    ...    nome=${NOME}
    ...    email=${EMAIL}
    ...    password=${PASSWORD}
    ...    administrador=${ADMINISTRADOR}
    ${RESPONSE}=    Post on Session    Serverest    /usuarios    json=${BODY}    
    Set Test Variable    ${RESPONSE}    ${response}
Validar a resposta com Status 201
    Should Be Equal As Integers    ${RESPONSE.status_code}    201
Armazenar o ID do novo usuário
    ${ID}=    Get From Dictionary    ${RESPONSE.json()}    _id
    Set Test Variable    ${ID_USUARIO}    ${ID}

