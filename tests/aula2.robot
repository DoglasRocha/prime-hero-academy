*** Settings ***
Documentation   Arquivo destinado para a segunda aula prática de RobotFramework

*** Variable ***
@{CORES_DE_CARRO}   vermelho
...                 azul
...                 preto
...                 branco
...                 prato
...                 verde
...                 rosa

*** Test Case ***
Cenario: Selecionando cores de carro na lista
    Seleciona cor de carro na lista

Cenario: Selecionando cor de carro
    Seleciona cor de carro  azul


*** Keywords ***
Seleciona cor de carro na lista

    FOR     ${cor}      IN      @{CORES_DE_CARRO}
        IF      '${cor}'=='preto'
            Log To Console      Não gosto da cor ${cor} em carros
        ELSE IF      '${cor}'=='branco'
            Log To Console      Não gosto da cor ${cor} em carros
        ELSE
            Log To Console      Gosto da cor ${cor} em carros
        END
    END

Seleciona cor de carro
    [Arguments]     ${COR}

    IF           '${COR}'=='azul'
        Log To Console      \nEssa cor é massa
    ELSE IF      '${COR}'=='verde'
        Log To Console      \nEssa cor é massa
    ELSE IF      '${COR}'=='vermelho'
        Log To Console      \nEssa cor é massa
    ELSE IF      '${COR}'=='amarelo'
        Log To Console      \nEssa cor é massa
    ELSE
        Log To Console      Essa cor não é massa
    END