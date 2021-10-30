*** Settings ***
Documentation   Aqui estarão presentes as resoluções de todos os exercícios do Prime Hero
...             Este documento é extremamente importante.   # três pontinhos indicam continuação
                # this is a comment
*** Variables ***
${NOME}     Doglas 

&{PESSOA}   
...         nome=Doglas
...         sobrenome=Rocha
...         idade=18
...         cpf=999.999.999-99
...         altura=1.65
...         sexo=Masculino

@{FRUTAS}
...         melancia
...         pokan
...         laranja
...         uva
...         abacaxi

*** Test Cases ***
Cenario: Imprimindo informações da pessoa
    Log To Console      \n${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.cpf}
    Log To Console      ${PESSOA.altura}
    Log To Console      ${PESSOA.sexo}

Cenario: Imprimindo lista de frutas
    [Tags]      LISTA
    Log To Console      \n${FRUTAS[0]}
    Log To Console      ${FRUTAS[1]}
    Log To Console      ${FRUTAS[2]}
    Log To Console      ${FRUTAS[3]}
    Log To Console      ${FRUTAS[4]}

    # rodando robot -i TAG_NAME ele irá testar somente os testes dessa tag

Cenario: Somando dois valores
    [Tags]  SOMAR
    ${SOMA}    Somar dois numeros    10     10    
    Log to console   ${SOMA}

    ${SOMA2}    Somar os numeros "10" e "20"
    Log to console  ${SOMA2}

Cenario: Concatenando strings
    [Tags]  CONCATENACAO
    ${CONCAT}   Concatenar duas strings     gato     preto
    Log to console  ${CONCAT}

Cenario: Criando email
    [Tags]  EMAIL
    ${EMAIL}    Cria email  doglas  rocha  18
    Log to console  \n${EMAIL}

Cenario: Contando de 0 a 9
    [Tags]   CONT
    Contar de 0 a 9

Cenario: Percorrer lista de frutas
    [Tags]  PER
    Percorrer lista de frutas

*** Keywords ***
Somar dois numeros
    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}     Evaluate    ${NUM_A}+${NUM_B}
    # evaluate faz uma conta, catenate concatena strings
    [Return]    ${SOMA}

Somar os numeros "${NUM_A}" e "${NUM_B}"
    # chamando os args na definição da keyword
    ${SOMA}     Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}

Concatenar duas strings
    [Arguments]     ${STRING1}      ${STRING2}
    ${RESULT}   catenate    ${STRING1} ${STRING2}
    [Return]     ${RESULT}

Cria email
    [Arguments]     ${NOME}     ${SOBRENOME}    ${IDADE}
    ${EMAIL}    Catenate    ${NOME}_${SOBRENOME}_${IDADE}@robot.com
    [Return]    ${EMAIL}

Contar de 0 a 9
    FOR     ${COUNT}    IN RANGE    0   9
        Log to Console  ${COUNT}
    END

Percorrer lista de frutas
    @{FRUTAS}   Create List     melancia    uva     maça    laranja
    FOR  ${FRUTA}   IN      @{FRUTAS}
        Log to console      ${FRUTA}
    END