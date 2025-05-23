*** Settings ***
Resource    ../resources/post_resource.robot
Resource    ../resources/put_resources.robot

*** Test Cases ***
Cenário 02: Atualizar uma reserva específica
    Criar uma seção no Booker
    Gerar token de autenticação

    ${BOOKINGDATES}    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01

    ${BODY}    Create Dictionary
    ...    firstname=James
    ...    lastname=Brown
    ...    totalprice=111
    ...    depositpaid=${True}
    ...    bookingdates=${BOOKINGDATES}
    ...    additionalneeds=Breakfast

    Atualizar uma reserva com ID válido    1    ${BODY}



