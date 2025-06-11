*** Settings ***
Documentation    Cenários de testes do cadastro de usuários

Resource    ../resouces/base.robot

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


