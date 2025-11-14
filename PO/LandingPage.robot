*** Settings ***
Documentation    All the Page objects and Keywords of Landing Page
Library  SeleniumLibrary
Resource    Generic.robot


*** Variables ***
${Error_Message_Login}    css:h3[data-test="error"]


*** Keywords ***

fill the login form
    [arguments]    ${user_name}    ${password}
    Input Text    id:user-name    ${user_name}
    Input Password    id:password    ${password}
    Click Button    xpath://input[@id='login-button']


Wait Until Element Is Located in the Page
    wait until element passed in located on page    ${Error_Message_Login}

verify error message is correct
    Element Should Contain    ${Error_Message_Login}    Epic sadface: Username and password do not match any user in this service

