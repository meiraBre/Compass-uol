*** Settings ***
Documentation   Consumindo a API REST do sistema

Library    RequestsLibrary

*** Keywords ***
POST a new task
    [Arguments]    ${playload}

    POST    url=http://localhost:3333/tasks
    ...    json=${playload}
    ...    expected_status=201