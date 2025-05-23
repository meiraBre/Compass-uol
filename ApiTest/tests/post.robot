*** Settings ***
Resource    ../resources/post_resource.robot
*** Variables ***

*** Test Cases ***
Cenário 01: Autenticar um usuário para ele poder atualizar e deletar reservas
    Criar uma seção no Booker
    Gerar token de autenticação

