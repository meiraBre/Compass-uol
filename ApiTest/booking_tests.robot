*** Settings ***
Documentation     Test suite for Restful-Booker API
Library          RequestsLibrary
Library          Collections
Library          String

*** Variables ***
${BASE_URL}      https://restful-booker.herokuapp.com
${USERNAME}      admin
${PASSWORD}      password123
${VALID_ID}      1

*** Test Cases ***
Scenario 01: Log in a user so they can update and delete reservations
    [Documentation]    Test user authentication for booking management
    Create a section in Booker
    ${TOKEN}=    Generate authentication token
    Validate login

Scenario 02: Create a reservation successfully as an authenticated user
    [Documentation]    Test creating a new reservation
    Create a section in Booker
    ${BOOKINGDATES}=    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01
    ${BODY}=    Create Dictionary
    ...    firstname=Jim
    ...    lastname=Brown
    ...    totalprice=111
    ...    depositpaid=${True}
    ...    bookingdates=${BOOKINGDATES}
    ...    additionalneeds=Breakfast
    ${RESPONSE}=    Create a new reservation    ${BODY}
    Set Test Variable    ${CREATED_ID}    ${RESPONSE.json()}[bookingid]

Scenario 03: Search for a specific reservation
    [Documentation]    Test searching for a specific reservation
    Create a section in Booker
    Query a reservation with a valid ID    ${VALID_ID}

Scenario 04: Update a specific reservation
    [Documentation]    Test updating an existing reservation
    Create a section in Booker
    ${TOKEN}=    Generate authentication token
    ${BOOKINGDATES}=    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01
    ${BODY}=    Create Dictionary
    ...    firstname=James
    ...    lastname=Brown
    ...    totalprice=111
    ...    depositpaid=${True}
    ...    bookingdates=${BOOKINGDATES}
    ...    additionalneeds=Breakfast
    Update a booking with valid ID    1    ${BODY}    ${TOKEN}

Scenario 05: Delete a specific booking
    [Documentation]    Test deleting a booking
    Create a section in Booker
    ${TOKEN}=    Generate authentication token
    Delete a booking with valid ID    1    ${TOKEN}

*** Keywords ***
Create a section in Booker
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    Create Session    Booker    ${BASE_URL}    headers=${HEADERS}

Generate authentication token
    ${AUTH_BODY}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${RESPONSE}=    POST On Session    Booker    /auth    json=${AUTH_BODY}
    [Return]    ${RESPONSE.json()}[token]

Validate login
    [Arguments]    ${TOKEN}
    ${HEADERS}=    Create Dictionary    Cookie=token=${TOKEN}
    ${RESPONSE}=    GET On Session    Booker    /booking    headers=${HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200

Create a new reservation
    [Arguments]    ${BODY}
    ${RESPONSE}=    POST On Session    Booker    /booking    json=${BODY}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    [Return]    ${RESPONSE}

Query a reservation with a valid ID
    [Arguments]    ${ID}
    ${RESPONSE}=    GET On Session    Booker    /booking/${ID}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200

Update a booking with valid ID
    [Arguments]    ${ID}    ${BODY}    ${TOKEN}
    ${HEADERS}=    Create Dictionary    Cookie=token=${TOKEN}    Content-Type=application/json
    ${RESPONSE}=    PUT On Session    Booker    /booking/${ID}    json=${BODY}    headers=${HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200

Delete a booking with valid ID
    [Arguments]    ${ID}    ${TOKEN}
    ${HEADERS}=    Create Dictionary    Cookie=token=${TOKEN}
    ${RESPONSE}=    DELETE On Session    Booker    /booking/${ID}    headers=${HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    201 
