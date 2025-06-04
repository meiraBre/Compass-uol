*** Settings ***
Resource    ../Tests/base01.robot
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_Serverest}    https://compassuol.serverest.dev
&{HEADERS}          Content-Type=application/json
${NOME}             Fulano da Silva
${EMAIL}            mirianii@qa.com
${PASSWORD}         teste123
${ADMINISTRADOR}    true

*** Keywords ***
#Avalia o fluxo de criação de um usuário válido
Criar uma sessão no Serverest 01
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Cadastrar um usuário com as informações necessárias
    ${BODY}=    Create Dictionary
    ...    nome=${NOME}
    ...    email=${EMAIL}
    ...    password=${PASSWORD}
    ...    administrador=${ADMINISTRADOR}
    ${RESPONSE}=    Post on Session    Serverest    /usuarios    json=${BODY}    
    Set Test Variable    ${RESPONSE}    ${response}
Validar a resposta 01
    Should Be Equal As Integers    ${RESPONSE.status_code}    201
Armazenar o ID do novo usuário
    ${ID}=    Get From Dictionary    ${RESPONSE.json()}    _id
    Set Global Variable    ${ID}


#Avalia a criação de um usuário com os mesmos dados do usuário criado anteriormente
Criar uma sessão no Serverest 02
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Cadastrar um usuário com as mesmas informações do usuário anterior
    ${BODY}=    Create Dictionary
    ...    nome=${NOME}
    ...    email=${EMAIL}
    ...    password=${PASSWORD}
    ...    administrador=${ADMINISTRADOR}
    ${responses}=    Post on Session    Serverest    /usuarios    json=${BODY}    expected_status=anything   
    Set Global Variable    ${responses}
Validar resposta 02
#Espera status 400 pois está criando um usuário duplicado
    Should Be Equal As Integers    ${responses.status_code}    400
    ${mensagem}=    Get From Dictionary    ${responses.json()}    message
    Should Contain    ${mensagem}    Este email já está sendo usado


#Avalia a resposta do sistema ao tentar criar um usuário com senha inválida
Criar uma sessão no Serverest 03
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Cadastrar um usuário com uma senha de 4 caracteres
    ${BODY}=    Create Dictionary
    ...    nome= Brendaa
    ...    email= meiraa@qa.com.br
    ...    password= 1234
    ...    administrador= true
    ${esponse}=    Post on Session    Serverest    /usuarios    json=${BODY}
    Set Test Variable    ${response}
Validar resposta 03 
    Should Be Equal As Integers    ${response.status_code}    400
Cadastrar um usuário com uma senha de 11 caracteres
    ${BODY}=    Create Dictionary
    ...    nome= Maria
    ...    email= meira@qa.com.br
    ...    password= 1234678901
    ...    administrador= true
    ${Responses}=    Post on Session    Serverest    /usuarios    json=${BODY}
    Set Test Variable    ${responses}
Validar resposta 04
    Should Be Equal As Integers    ${Response.status_code}    400 

#Tentar excluir um usuário com ID inexistente
Criar uma sessão no Serverest 04
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Enviar um ID inexistente de um suposto usuário para Deletar
    ${ID_inexistente}=    Set Variable    000000000000
    ${SEND}=    Delete On Session    Serverest    /usuarios/${ID_inexistente}    expected_status=anything
    Set Test Variable    ${SEND}
Validar resposta 05
    Should Be Equal As Integers    ${SEND.status_code}    200





    



