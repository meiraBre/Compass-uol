*** Variables ***
&{MESES}    
...    Janeiro=31
...    Fevereiro=28
...    Março=31
...    Abril=30
...    Maio=31
...    Junho=30
...    Julho=31
...    Agosto=31
...    Setembro=30
...    Outubro=31
...    Novembro=30
...    Dezembro=31

*** Test Cases ***
Imprimir Meses E Dias No Console
    Log To Console    Janeiro tem ${MESES['Janeiro']} dias
    Log To Console    Fevereiro tem ${MESES['Fevereiro']} dias
    Log To Console    Março tem ${MESES['Março']} dias
    Log To Console    Abril tem ${MESES['Abril']} dias
    Log To Console    Maio tem ${MESES['Maio']} dias
    Log To Console    Junho tem ${MESES['Junho']} dias
    Log To Console    Julho tem ${MESES['Julho']} dias
    Log To Console    Agosto tem ${MESES['Agosto']} dias
    Log To Console    Setembro tem ${MESES['Setembro']} dias
    Log To Console    Outubro tem ${MESES['Outubro']} dias
    Log To Console    Novembro tem ${MESES['Novembro']} dias
    Log To Console    Dezembro tem ${MESES['Dezembro']} dias

