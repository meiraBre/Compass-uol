*** Settings ***
Resource    ../Tests/base01.robot

*** Variables ***

*** Keywords ***
#Avalia o fluxo de criação de um usuário válido
Criar uma sessão no Serverest 01
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Gerar dados do usuário
    ${NOME}=    FakerLibrary.Name
    ${EMAIL}=   FakerLibrary.Email
    ${PASSWORD}=    FakerLibrary.Password
    Set Suite Variable    ${NOME}
    Set Suite Variable    ${EMAIL}
    Set Suite Variable    ${PASSWORD}
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
    Should Be Equal As Integers    ${responses.status_code}    400
    ${mensagem}=    Get From Dictionary    ${responses.json()}    message
    Should Contain    ${mensagem}    Este email já está sendo usado


#Avalia a resposta do sistema ao tentar criar um usuário com senha inválida
Criar uma sessão no Serverest 03
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Cadastrar um usuário com uma senha de 4 caracteres
    ${NOME01}=    FakerLibrary.Name
    ${EMAIL01}=   FakerLibrary.Email
    ${BODY}=    Create Dictionary
    ...    nome=${NOME01}
    ...    email=${EMAIL01}
    ...    password=1234
    ...    administrador=true
    ${response}=    Post on Session    Serverest    /usuarios    json=${BODY}
    Set Test Variable    ${response}
Validar resposta 03 
    Should Be Equal As Integers    ${response.status_code}    400
Cadastrar um usuário com uma senha de 11 caracteres
    ${NOME02}=    FakerLibrary.Name
    ${EMAIL02}=   FakerLibrary.Email
    ${BODY}=    Create Dictionary
    ...    nome=${NOME02}
    ...    email=${EMAIL02}
    ...    password=1234678901
    ...    administrador=true
    ${Responses}=    Post on Session    Serverest    /usuarios    json=${BODY}
    Set Test Variable    ${Responses}
Validar resposta 04
    Should Be Equal As Integers    ${Responses.status_code}    400 

#Tentar excluir um usuário com ID inexistente
Criar uma sessão no Serverest 04
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Enviar um ID inexistente de um suposto usuário para Deletar
    ${ID_inexistente}=    Set Variable    000000000000
    ${SEND}=    Delete On Session    Serverest    /usuarios/${ID_inexistente}    expected_status=anything
    Set Test Variable    ${SEND}
Validar resposta 05
    Should Be Equal As Integers    ${SEND.status_code}    200





    



