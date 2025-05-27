*** Settings ***
Library    RequestsLibrary
Library    String
Library    FakerLibrary
robot -d ../results auth.robot
*** Variables ***


*** Test Cases ***
Cenário 02: Criar uma reserva com massa de dados dinâmica
    Criar uma seção no Booker
    Gerar massa de dados dinâmica
    Criar uma nova reserva com massa dinâmica
    Armazenar o ID do produto como uma variável global

Cenário 03: Buscar uma reserva específica
    Criar uma seção no Booker
    Consultar com o ID gerado no C2

Cenário 04: Atualizar a reserva criada anteriormente
    Criar uma seção no Booker
    Utilizar o token de autenticação já criado
    Gerar body atualizado
    Atualizar uma reserva com ID válido    ${ID_RESERVA}    ${BODY_ATUALIZADO}

Cenário 05: Deletar uma reserva específica
    Criar uma seção no Booker
    Utilizar o token de autenticação já criado
    Deletar uma reserva com ID válido    ${ID_RESERVA}