*** Settings ***
Documentation       Aqui neste arquivo estarão presentes os cenários e keywords que dizem respeito
...                 a automação mobi

Library             AppiumLibrary

Test Setup          Abrir App
Test Teardown       Fechar App

*** Keywords ***
# keywords utilizadas em mais de um caso de teste
Abrir App
    Open Application    http://localhost:4723/wd/hub
    ...                 automationName=uiautomator2
    ...                 deviceName=0068193924
    ...                 platformName=Android
    ...                 autoGrantPermissions=true
    ...                 appPackage=com.google.android.youtube
    ...                 appActivity=com.google.android.youtube.HomeActivity

Fechar App
    Close Application

Dado que o cliente esteja na tela de Home
    Wait Until Element Is Visible       accessibility_id=YouTube
    Element Attribute Should Match      xpath=//android.widget.Button[@content-desc="Home"]/android.widget.ImageView    selected    True

Quando usar swipe até o 10 item da tela
    FOR     ${i}    IN RANGE    0   10
        Log To Console      ${i}
        Swipe                           500  1200  500  600
    END

Então será clicado no vídeo
    Click A Point                       540   1200

# Caso de Teste 01
E pesquise um vídeo sobre "${BUSCA}"
    Click Element                       accessibility_id=Search
    Input Text                          id=search_edit_text     ${BUSCA}
    Press Keycode                       66

E acessar o canal da Prime
    Wait Until Element Is Visible   	xpath=(//android.widget.ImageView[@content-desc="Go to channel"])[1]
    Click Element                       xpath=(//android.widget.ImageView[@content-desc="Go to channel"])[1]

Quando clicar em Inscrever-se
    Wait Until Element Is Visible       accessibility_id=Subscribe to Prime Control.
    Click Element                       accessibility_id=Subscribe to Prime Control.

Então será apresentado como Inscrito
    Wait Until Element Is Visible       accessibility_id=Unsubscribe from Prime Control.

# Caso de Teste 02
Dado que o cliente logue no aplicativo com a conta "${ACCOUNT}"
    Wait Until Element Is Visible       accessibility_id=Account
    Click Element                       accessibility_id=Account
    Wait Until Element Is Visible       accessibility_id=Switch accounts
    Click Element                       accessibility_id=Switch accounts
    Wait Until Element Is Visible       xpath=(//android.widget.RelativeLayout[@content-desc="Doglas Rocha,No channel"])[3]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView
    Click Element                       xpath=(//android.widget.RelativeLayout[@content-desc="Doglas Rocha,No channel"])[3]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView

E entre no menu "Explorar"
    Wait Until Element Is Visible       accessibility_id=YouTube
    Element Attribute Should Match      xpath=//android.widget.Button[@content-desc="Home"]/android.widget.ImageView    selected    True

# Caso de Teste 03
Dado que o cliente entre no menu "Explorar"
    Wait Until Element Is Visible       accessibility_id=YouTube
    Element Attribute Should Match      xpath=//android.widget.Button[@content-desc="Home"]/android.widget.ImageView    selected    True

*** Test Case ***
Caso de Teste 01: Pesquisar canal “Prime Experts”
    [Tags]      ONE

    Dado que o cliente esteja na tela de Home
    E pesquise um vídeo sobre "Prime Experts"
    E acessar o canal da Prime
    Quando clicar em Inscrever-se
    Então será apresentado como Inscrito

Caso de Teste 02: Logar no YouTube
    [Tags]      TWO

    Dado que o cliente logue no aplicativo com a conta "teste_doglas@gmail.com"
    E entre no menu "Explorar"
    Quando usar swipe até o 10 item da tela
    Então será clicado no vídeo

Caso de Teste 03: Usar método swipe na tela
    [Tags]      THREE

    Dado que o cliente entre no menu "Explorar"
    Quando usar swipe até o 10 item da tela
    Então será clicado no vídeo