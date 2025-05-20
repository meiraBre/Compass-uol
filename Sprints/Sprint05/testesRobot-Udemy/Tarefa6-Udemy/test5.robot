*** Variables ***
@{NUMEROS}    2    5    7    10    12

*** Test Cases ***
Executar Verificacao Da Lista
    FOR    ${numero}    IN    @{NUMEROS}
        Run Keyword If    '${numero}' == '5'    Log To Console    Eu sou o número 5!
        ...    ELSE IF    '${numero}' == '10'    Log To Console    Eu sou o número 10!
        ...    ELSE    Log To Console    Eu não sou o número 5 e nem o 10!
    END

