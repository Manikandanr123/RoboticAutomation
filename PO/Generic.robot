*** Settings ***
Documentation    A resource file with resuable keywords and variables
...
...
Library  SeleniumLibrary
Library    Collections

*** Variables ***
${user_name}            standard_user
${invalid_password}     @234sderet
${valid_password}       secret_sauce
${url}                  https://saucedemo.com


*** Keywords ***
open the saucedemo website with login url
     ${chrome options}=    Evaluate    __import__('selenium.webdriver.chrome.options').webdriver.chrome.options.Options()

     ${flag1}=    Set Variable    --disable-features=AutofillServerCommunication,AutofillEnableAccountWalletStorage,PasswordManagerOnboarding,PasswordManagerRedesign,PasswordLeakDetection
     ${flag2}=    Set Variable    --disable-save-password-bubble
     ${flag3}=    Set Variable    --disable-extensions
     ${flag4}=    Set Variable    --disable-infobars
     ${flag5}=    Set Variable    --disable-blink-features=AutomationControlled

     Call Method    ${chrome options}    add_argument    ${flag1}
     Call Method    ${chrome options}    add_argument    ${flag2}
     Call Method    ${chrome options}    add_argument    ${flag3}
     Call Method    ${chrome options}    add_argument    ${flag4}
     Call Method    ${chrome options}    add_argument    ${flag5}

     ${prefs}=    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}    autofill.profile_enabled=${False}    autofill.credit_card_enabled=${False}
     Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}

     Create Webdriver    Chrome    options=${chrome options}
     Open Browser    ${url}    Chrome
     Maximize Browser Window


close Browser Session
    Close Browser


wait until element passed in located on page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}
