*** Settings ***
Resource    ../resources/post_resource.robot
Resource    ../resources/delete_resource.robot

*** Test Cases ***
Cenário 05: Deletar uma reserva específica
    Criar uma seção no Booker
    Gerar token de autenticação
    Deletar uma reserva com ID válido    1       ${TOKEN}

