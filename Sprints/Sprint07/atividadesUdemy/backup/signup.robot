*** Settings ***
Documentation    Cenários de testes do cadastro de usuários

Resource    ../resouces/base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuário
    ${user}    Create Dictionary
    ...    name=Brenda Meira
    ...    email=bremeira@iahoo.com
    ...    password=pwd123

    Remove user from database    ${user}[email] 

    Go to signup page
    Submit signup form    ${user}
    Notice should be      Boas vindas ao Mark85, o seu gerenciador de tarefas

Não deve permitir o cadastro com email duplicado
    [Tags]    dup

    ${user}    Create Dictionary
    ...    name=Brenda Meira
    ...    email=bremeira@gmail.com
    ...    password=pwd123

    Remove user from database    ${user}[email] 
    Insert user from database    ${user}

    Go to signup page
    Submit signup form    ${user}
    Notice should be      Oops! Já existe uma conta com o email informado.

Campos obrigatórios
    [Tags]    required

    ${user}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe seu nome completo  
    Alert should be    Informe seu email 
    Alert should be    Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email incorreto 
    ${user}    Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier.com.br
    ...        password=123456
    
Não deve cadastrar com senha de 1 dígito
    [Tags]    short_pass
    [Template]
    Short password



*** Keywords ***
Short password
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${short_pass}
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe uma senha com pelo menos 6 digitos