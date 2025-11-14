*** Settings ***
Documentation   TO validate the login form with different user inputs via Excel
Library  SeleniumLibrary
Library    DataDriver    file=resources/data.csv    encoding=utf_8    dialect=unix
Test Teardown    Close Browser
Test Template    validate Unsuccessful login
#this will get executed at the end of each and every test case- tear down

#Resource

*** Variables ***
${Error_Message_Login}    css:h3[data-test="error"]

*** Test Cases ***
Login with user ${user_name} and password ${password}
#giving xyz and 1234 is optional - if in case if it doesnt find data in file , it will take this username and password passed

*** Keywords ***
validate Unsuccessful login
    [Arguments]    ${user_name}    ${password}
    open the saucedemo website with login url
    fill the login form    ${user_name}    ${password}
    wait until it checks and display error message
    verify error message is correct
    Click Element    xpath://button[@class='error-button']//*[name()='svg']


open the saucedemo website with login url
    #${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
    #${prefs}=      Evaluate    {"credentials_enable_service": False, "profile.password_manager_enabled": False}
    #Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    #Call Method    ${options}    add_argument    --incognito
    #Call Method    ${options}    add_argument    --disable-notifications
    #Create Webdriver    Chrome    options=${options}
    Open Browser    https://saucedemo.com    chrome
    Maximize Browser Window

fill the login form
    [arguments]    ${user_name}    ${password}
    Input Text    id:user-name    ${user_name}
    Input Password    id:password    ${password}
    Click Button    xpath://input[@id='login-button']

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    Element Should Contain    ${Error_Message_Login}    Epic sadface: Username and password do not match any user in this service



