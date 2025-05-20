*** Settings ***
Library           String

*** Keywords ***
Gerar Email Customizado
    [Arguments]    ${nome}    ${sobrenome}
    ${palavra}=    Generate Random String    8
    ${email}=    Catenate    SEPARATOR=    ${nome}${sobrenome}${palavra}@testerobot.com
    [Return]    ${email}

*** Test Cases ***
Criar E Imprimir Email Customizado
    ${email_pronto}=    Gerar Email Customizado    Ana    Silva
    Log To Console    ${email_pronto}
