*** Settings ***
Resource    base.robot
Resource    ../Auth/auth.robot

*** Keywords ***
Criar uma seção no Booker
    ${HEADERS}    Create Dictionary    Content-Type=application/json
    Create Session    alias=Booker    url=${BASE_URL}    headers=${HEADERS}

Gerar massa de dados dinâmica
    ${FIRSTNAME}    Fake First Name
    ${LASTNAME}    Fake Last Name
    ${TOTALPRICE}    Generate Random String    3    [NUMBERS]
    ${TOTALPRICE}    Convert To Integer    ${TOTALPRICE}
    ${DEPOSITPAID}    Set Variable    True
    ${CHECKIN}    Set Variable    2023-01-01
    ${CHECKOUT}    Set Variable    2023-12-31
    ${ADDITIONALNEEDS}    Fake Sentence

    Set Global Variable    ${FIRSTNAME}
    Set Global Variable    ${LASTNAME}
    Set Global Variable    ${TOTALPRICE}
    Set Global Variable    ${DEPOSITPAID}
    Set Global Variable    ${CHECKIN}
    Set Global Variable    ${CHECKOUT}
    Set Global Variable    ${ADDITIONALNEEDS}

Criar uma nova reserva com massa dinâmica
    ${BOOKINGDATES}    Create Dictionary    checkin=${CHECKIN}    checkout=${CHECKOUT}

    ${BODY}    Create Dictionary
    ...    firstname=${FIRSTNAME}
    ...    lastname=${LASTNAME}
    ...    totalprice=${TOTALPRICE}
    ...    depositpaid=${DEPOSITPAID}
    ...    bookingdates=${BOOKINGDATES}
    ...    additionalneeds=${ADDITIONALNEEDS}

    ${RESPOSTA}    POST On Session
    ...    alias=Booker
    ...    url=/booking
    ...    json=${BODY}

    Should Be Equal As Integers    ${RESPOSTA.status_code}    200

    ${ID_RESERVA}    Set Variable    ${RESPOSTA.json()['bookingid']}
    Log    ID da reserva criada: ${ID_RESERVA}
    Set Global Variable    ${ID_RESERVA}

Armazenar o ID da reserva como variável global
    No Operation





