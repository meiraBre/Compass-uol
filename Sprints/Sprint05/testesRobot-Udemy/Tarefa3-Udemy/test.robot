*** Variables ***
@{MESES}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***
Imprimir Meses Do Ano
    Log    ${MESES[0]}
    Log    ${MESES[1]}
    Log    ${MESES[2]}
    Log    ${MESES[3]}
    Log    ${MESES[4]}
    Log    ${MESES[5]}
    Log    ${MESES[6]}
    Log    ${MESES[7]}
    Log    ${MESES[8]}
    Log    ${MESES[9]}
    Log    ${MESES[10]}
    Log    ${MESES[11]}

