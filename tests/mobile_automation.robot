*** Settings ***
Documentation       Aqui neste arquivo estarão presentes os cenários e keywords que dizem respeito
...                 a automação mobile.

Library             AppiumLibrary

Test Setup          Abrir App
Test Teardown       Fechar App

*** Keywords ***
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
    Wait Until Element Is Visible       id=youtube_logo
    Element Attribute Should Match      xpath=//android.widget.Button[@content-desc="Home"]/android.widget.ImageView    selected    True

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

*** Test Case ***
Caso de Teste 01: Pesquisar canal “Prime Experts”
    Dado que o cliente esteja na tela de Home
    E pesquise um vídeo sobre "Prime Experts"
    E acessar o canal da Prime
    Quando clicar em Inscrever-se
    Então será apresentado como Inscrito