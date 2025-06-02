*** Settings ***
Resource    ../Resources/base_resource.robot

*** Variables ***


*** Keywords ***
Criar uma sessão com o header adequado
    ${HEADERS}    Create Dictionary    Content-Type=application/json    Accept=application/json
    Create Session    alias=Booker    url=${URL}    headers=${HEADERS}

Criar um body com os dados da reserva
    ${BODY}=    Create Dictionary
    ...    firstname=Jimm
    ...    lastname=Brownn
    ...    totalprice=111
    ...    depositpaid=${True}
    ${BOOKINGDATES}=    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01
    Set To Dictionary    ${BODY}    bookingdates=${BOOKINGDATES}
    Set To Dictionary    ${BODY}    additionalneeds=Breakfast
    [Return]    ${BODY}

Fazer uma requisição no Booker
    [Arguments]    ${BODY}
    ${RESPONSEs}=    Post on Session    Booker    /booking    json=${BODY}
    Set global Variable    ${RESPONSEs}

Validar a response
    Status Should Be    ${RESPONSEs}    200
    Dictionary Should Contain Key    ${RESPONSEs.json()}    bookingid
    Log To Console    Reserva criada com sucesso: ${RESPONSEs.json()}

Armazenar o ID do produto 
    [Arguments]    ${RESPONSE}
    ${BOOKINGID}=    Get From Dictionary    ${RESPONSE.json()}    bookingid
    Set Global Variable    ${BOOKINGID}
    Log To Console    Booking ID armazenado: ${BOOKINGID}