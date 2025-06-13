*** Settings ***
Documentation    Cenários de autenticação do usuário
Resource         ../resources/base.resource
Library          Collections

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado
    ${user}    Create Dictionary
    ...    name=Brenda Meira
    ...    email=bremeira@iahoo.com
    ...    password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Submit Login form    ${user}
    User should be logged in    ${user}[name]

Não deve logar com senha inválida
    ${user}    Create Dictionary
    ...    name=Brenda Meira
    ...    email=bremeira@iahoo.com
    ...    password=123456

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=123abc

    Submit Login form    ${user}
    Notice should be    Ocorreu um erro ao fazer login, verifique suas credenciais




