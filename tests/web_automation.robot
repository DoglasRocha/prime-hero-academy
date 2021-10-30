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

Fechar Navegador
    Capture Page Screenshot
    Close Browser

# Keywords utilizadas em mais de um cenário de teste
Acessar a página home do site Automation Practice
    Go To                           ${URL}
    Title Should Be                 My Store
    Wait Until Element Is Visible   id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                      id=search_query_top    ${PRODUTO}

Clicar no botão pesquisar
    Click Element                   xpath=//*[@name='submit_search' and @type='submit']

# Teste 01
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   id=center_column
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]

# Teste 02
Conferir mensagem "No results were found for your search "itemNãoExistente""
    Wait Until Element Is Visible   id=center_column
    Title Should Be                 Search - My Store
    Element Text Should Be          xpath=//p[@class="alert alert-warning"]     No results were found for your search "itemNãoExistente"

# Teste 03
Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Mouse Over                      xpath=//a[@title="Women"]

Clicar na sub categoria "Summer Dresses"
    Wait Until Element Is Visible   xpath=//a[@title="Summer Dresses"]
    Click Element                   xpath=//a[@title="Summer Dresses"]

Conferir se os produtos da sub categoria "Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible   id=center_column
    Title Should Be                 Summer Dresses - My Store
    Page Should Contain Image       xpath=//img[@src="http://automationpractice.com/img/p/1/2/12-home_default.jpg"]

# Teste 04
Clicar em "Sign in"
    Click Element                   xpath=//a[@class="login" and @title="Log in to your customer account"]

Informar um e-mail válido
    Wait Until Element Is Visible   xpath=//input[@id="email_create" and @name="email_create"]
    Title Should Be                 Login - My Store
    Input Text                      xpath=//input[@id="email_create" and @name="email_create"]   rocha@doglas.com

Clicar em "Create an account"
    Click Element                   xpath=//button[@id="SubmitCreate"]

Preencher os dados obrigatórios
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

Submeter cadastro
    Click Element                   xpath=//button[@id="submitAccount"]

Conferir se o cadastro foi efetuado com sucesso
    Title Should Be                 My account - My Store
    Wait Until Element Is Visible   xpath=//ul[@class="myaccount-link-list"]//a[@title="Orders"]
    Page Should Contain Element     xpath=//h1[@class="page-heading"]

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]      ONE

    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]      TWO

    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar Produtos
    [Tags]      THREE
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    [Tags]      FOUR

    Acessar a página home do site Automation Practice
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso