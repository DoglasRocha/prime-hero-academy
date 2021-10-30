*** Settings ***
Documentation   Este arquivo contém os exercícios para casa da primeira aula
...             prática do RobotFramework.

*** Variables ***
@{PAISES}   brasil
...         alemanha
...         rússia
...         inglaterra
...         canadá
...         austrália
...         cuba
...         china

*** Test Cases ***
Cenario: Imprimindo de 0 a 10
    Imprimir de zero a dez

Cenario: Imprimindo 5 países
    Imprimir 5 países

*** Keywords ***
Imprimir de zero a dez
    FOR     ${i}    IN RANGE    0   11
        Log To Console      Estou no número ${i}
    END

Imprimir 5 países
    FOR     ${i}    IN RANGE    0   6
        Log To Console      ${PAISES[${i}]}
    END
