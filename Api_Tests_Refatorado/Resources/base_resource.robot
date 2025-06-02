*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../Tests/auth.robot   
Resource    ../Tests/booking.robot

*** Variables ***
${URL}    https://restful-booker.herokuapp.com
${USERNAME}     admin
${PASSWORD}     password123

*** Test Cases ***
Cenário 01: Fazer a autenticação do usuário e armazenar o token
    Criar sessão com header
    Criar body de autenticação
    Fazer uma requisição   
    Armazenar o token gerado
    Validar se o token é válido

Cenário 02: Criar uma nova reserva no Booker
    Criar uma sessão com o header adequado
    Criar um body com os dados da reserva
    Fazer uma requisição no Booker
    Validar a response
    Armazenar o ID do produto    
