*** Settings ***
Documentation   Aqui estão presentes os testes Web do curso Prime Hero.
...             Para eles, será utilizada a lib Selenium.

Library         SeleniumLibrary

Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Variables ***
${URL}          http://automationpractice.com/index.php
${BROWSER}      chrome
${PRODUTO}      blouse

*** Keywords ***
Abrir Navegador
    Open Browser                    browser=${BROWSER}
    Maximize Browser Window
    Set Screenshot Directory        img/

Fechar Navegador
    Capture Page Screenshot
    Close Browser

# Keywords utilizadas em mais de um cenário de teste
Dado que o cliente esteja na home do site Automation Practice
    Go To                           ${URL}
    Title Should Be                 My Store
    Wait Until Element Is Visible   id=block_top_menu

E digite o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                      id=search_query_top    ${PRODUTO}

Quando clicar no botão pesquisar
    Click Element                   xpath=//*[@name='submit_search' and @type='submit']

# Teste 01
Então será checado se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   id=center_column
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]

# Teste 02
Então será checada a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible   id=center_column
    Title Should Be                 Search - My Store
    Element Text Should Be          xpath=//p[@class="alert alert-warning"]     ${MENSAGEM}

# Teste 03
E passe o mouse por cima da categoria "Women" no menu principal superior de categorias
    Mouse Over                      xpath=//a[@title="Women"]

Quando clicar na sub categoria "Summer Dresses"
    Wait Until Element Is Visible   xpath=//a[@title="Summer Dresses"]
    Click Element                   xpath=//a[@title="Summer Dresses"]

Então será checado se os produtos da sub categoria "Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible   id=center_column
    Title Should Be                 Summer Dresses - My Store
    Page Should Contain Image       xpath=//img[@src="http://automationpractice.com/img/p/1/2/12-home_default.jpg"]

# Teste 04
E clicar em "Sign in"
    Click Element                   xpath=//a[@class="login" and @title="Log in to your customer account"]

E informar um e-mail válido
    Wait Until Element Is Visible   xpath=//input[@id="email_create" and @name="email_create"]
    Title Should Be                 Login - My Store
    Input Text                      xpath=//input[@id="email_create" and @name="email_create"]   novo.email.tres@doglasrocha.com

E clicar em "Create an account"
    Click Element                   xpath=//button[@id="SubmitCreate"]

E preencher os dados obrigatórios
    Title Should Be                 Login - My Store
    Wait Until Element Is Visible   xpath=//input[@id="id_gender1"]
    Click Element                   xpath=//input[@id="id_gender1"]
    Input Text                      xpath=//input[@id="customer_firstname"]     Doglas
    Input Text                      xpath=//input[@id="customer_lastname"]      Rocha
    Input Text                      xpath=//input[@id="passwd"]                 12345
    Input Text                      xpath=//input[@id="address1"]               Baker Street
    Input Text                      xpath=//input[@id="city"]                   London
    Click Element                   xpath=//select[@id="id_state"]
    Click Element                   xpath=//select[@id="id_state"]//option[@value="53"]
    Input Text                      xpath=//input[@id="postcode"]               55555
    Input Text                      xpath=//input[@id="phone_mobile"]           9999999999

Quando submeter cadastro
    Click Element                   xpath=//button[@id="submitAccount"]

Então será checado se o cadastro foi efetuado com sucesso
    Title Should Be                 My account - My Store
    Wait Until Element Is Visible   xpath=//ul[@class="myaccount-link-list"]//a[@title="Orders"]
    Page Should Contain Element     xpath=//h1[@class="page-heading"]

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]      ONE

    Dado que o cliente esteja na home do site Automation Practice
    E digite o nome do produto "Blouse" no campo de pesquisa
    Quando clicar no botão pesquisar
    Então será checado se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]      TWO

    Dado que o cliente esteja na home do site Automation Practice
    E digite o nome do produto "itemNãoExistente" no campo de pesquisa
    Quando clicar no botão pesquisar
    Então será checada a mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar Produtos
    [Tags]      THREE

    Dado que o cliente esteja na home do site Automation Practice
    E passe o mouse por cima da categoria "Women" no menu principal superior de categorias
    Quando clicar na sub categoria "Summer Dresses"
    Então será checado se os produtos da sub categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    [Tags]      FOUR

    Dado que o cliente esteja na home do site Automation Practice
    E clicar em "Sign in"
    E informar um e-mail válido
    E clicar em "Create an account"
    E preencher os dados obrigatórios
    Quando submeter cadastro
    Então será checado se o cadastro foi efetuado com sucesso