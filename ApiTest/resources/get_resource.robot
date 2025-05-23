*** Settings ***
Library    RequestsLibrary
Library    String

*** Keywords ***
Criar uma seção no Booker
    ${HEADERS}    Create Dictionary    Content-Type=application/json
    Create Session    alias=Booker    url=https://restful-booker.herokuapp.com    headers=${HEADERS}
Consultar com um ID válido uma reserva
    [Arguments]    ${ID}
    ${HEADERS}    Create Dictionary    Accept=application/json
    ${RESPOSTA}    GET On Session
    ...    alias=Booker
    ...    url=/booking/${ID}
    ...    headers=${HEADERS}
    Log    Status Code: ${RESPOSTA.status_code}
    Log    Response: ${RESPOSTA.json()}
   
