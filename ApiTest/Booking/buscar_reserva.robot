*** Settings ***
Resource    base.robot
Resource    ../Auth/auth.robot

*** Keywords ***
Consultar com o ID gerado no C2
    ${RESPOSTA}    GET On Session
    ...    alias=Booker
    ...    url=/booking/${ID_RESERVA}

    Should Be Equal As Integers    ${RESPOSTA.status_code}    200
    Log    Reserva consultada: ${RESPOSTA.json()}

Gerar token de autenticação
    ${BODY}    Create Dictionary
    ...    username=admin
    ...    password=password123

    ${RESPOSTA}    POST On Session
    ...    alias=Booker
    ...    url=/auth
    ...    json=${BODY}

    ${TOKEN}    Set Variable    ${RESPOSTA.json()['token']}
    Log    Token gerado: ${TOKEN}
    Set Global Variable    ${TOKEN}

Utilizar o token de autenticação já criado
    Run Keyword If    '${TOKEN}' == ''    Gerar token de autenticação

Gerar body atualizado
    ${BOOKINGDATES}    Create Dictionary    checkin=2024-01-01    checkout=2024-12-31

    ${BODY_ATUALIZADO}    Create Dictionary
    ...    firstname=James
    ...    lastname=Brown
    ...    totalprice=222
    ...    depositpaid=True
    ...    bookingdates=${BOOKINGDATES}
    ...    additionalneeds=Late Checkout

    Set Global Variable    ${BODY_ATUALIZADO}