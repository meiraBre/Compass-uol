*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com

*** Keywords ***

Criar uma nova reserva
    [Arguments]    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkin}    ${checkout}    ${additionalneeds}
    
    ${BODY}=    Create Dictionary
    ...    firstname=${firstname}
    ...    lastname=${lastname}
    ...    totalprice=${totalprice}
    ...    depositpaid=${depositpaid}
    ...    additionalneeds=${additionalneeds}

    ${BOOKINGDATES}=    Create Dictionary    checkin=${checkin}    checkout=${checkout}
    Set To Dictionary    ${BODY}    bookingdates=${BOOKINGDATES}

    ${RESPONSE}=    POST On Session
    ...    alias=Booker
    ...    url=/booking
    ...    json=${BODY}

    Log    Status Code: ${RESPONSE.status_code}
    Log    Response: ${RESPONSE.json()}

    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Dictionary Should Contain Key    ${RESPONSE.json()}    bookingid
