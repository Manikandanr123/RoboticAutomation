*** Settings ***
Documentation   TO validate the login form
Library  SeleniumLibrary
Test Teardown    Close Browser
#this will get executed at the end of each and every test case- tear down

#Resource

*** Variables ***
${Error_Message_Login}    xpath://div[@class='message-error validation-summary-errors']


*** Test Cases ***
validate Unsuccessful login in nopcommerce
    open the nopcommerce website with login url
    fill the login form
    wait until it checks and display error message
    verify error message is correct


*** Keywords ***
open the nopcommerce website with login url
    Open Browser    https://demo.nopcommerce.com/login?returnUrl=%2F    chrome
    Maximize Browser Window

fill the login form
    Input Text    id:Email    mani1987sat2@gmail.com
    Input Password    id:Password    @234Secrat
    Click Button    xpath://button[normalize-space()='Log in']

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    Element Should Contain    ${Error_Message_Login}    Login was unsuccessful. Please correct the errors and try again.



