*** Settings ***
Documentation    Cenários de cadastro de tarefas
Resource        ../../resources/base.resource
Library         JSONLibrary

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefas

    ${data}    Get fixture    tasks    create

    Clean user from database    ${data}[user][email]
    Inser user from database    ${data}[user]    

    Submit Login form    ${user}
    User should be logged in    ${user}[name]

    Go to task form
    Submit task form             ${data}[task]
    Task should be registered    ${data}[task][name]   

Não deve cadastrar tarefa com nome duplicado
    ${data}    Get fixture    tasks    duplicate

    Clean user from database    ${data}[user][email]
    Insert user from database    ${data}[user]

    Submit Login form    ${data}[user]
    User should be logged in    ${data}[user][name]

    Go to task form
    Submit task form        ${data}[task]

    Notice should be        Oops! Tarefa duplicada.


