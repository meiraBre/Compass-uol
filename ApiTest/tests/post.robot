*** Settings ***
Resource    ../resources/post_resource.robot
*** Variables ***

*** Test Cases ***
Cenário 01: Fazer login de um usuário para ele poder atualizar e deletar reservas 
    Criar uma seção no Booker
    Gerar token de autenticação
    Validar o login

