*** Settings ***
Documentation    Ações e elementos da página de Login
Library          Browser
Library          String

*** Keywords ***
Sumbit Login form
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[placeholder$=mail]    ${email}
    Fill Text    css=input[placeholder=senha]    ${password}

    Click        xpath=//button[()="Entrar"]



    