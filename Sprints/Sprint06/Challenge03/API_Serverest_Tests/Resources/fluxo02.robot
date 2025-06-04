*** Settings ***
Resource    ../Tests/base01.robot
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_Serverest}    https://compassuol.serverest.dev
&{HEADERS}          Content-Type=application/json
${EMAIL}            mirianii@qa.com
${PASSWORD}         teste123
${Nome_Produto}     Mouse

*** Keywords ***
# Avalia fluxo de realização de login com dados corretos
Criar uma sessão no Serverest 05
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Fazer login com os dados do usuário criado no C01
    ${BODY}=    Create Dictionary
    ...    email=${EMAIL}
    ...    password=${PASSWORD}
    ${LOGIN}=    Post on Session    Serverest    /login    json=${BODY}  
    Set Test Variable    ${LOGIN}  
Validar resposta 06
    Should Be Equal As Integers    ${LOGIN.status_code}    200
Armazenar o token em uma variável global
    ${TOKEN}=    Get From Dictionary    ${LOGIN.json()}    authorization
    Set Global Variable    ${TOKEN}
    Log To Console    ${TOKEN}

#Avalia como o sistema lida com a ação de realizar um Login com email inexistente
Criar uma sessão no Serverest 06
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Tentar fazer login com um email qualquer
    ${BODY}=    Create Dictionary    
    ...    email= bre10@qa.com
    ...    password= 123456
    ${LOGIN}    Post On Session    Serverest    /login    json=${BODY}    expected_status=anything
    Set Test Variable    ${LOGIN}
Validar resposta 07
    Should Be Equal As Integers    ${LOGIN.status_code}    400

# Avalia como o sistema se comporta com a tentativa de Login com senha incorreta
Criar uma sessão no Serverest 07
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Tentar fazer login com uma senha qualquer
    ${BODY}=    Create Dictionary    
    ...    email= bre10@qa.com
    ...    password= @
    ${LOGIN}    Post On Session    Serverest    /login    json=${BODY}    expected_status=anything
    Set Test Variable    ${LOGIN}
Validar resposta 08
    Should Be Equal As Integers    ${LOGIN.status_code}    400



