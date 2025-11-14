*** Settings ***
Documentation    All the Page objects and Keywords of Product Page
Library  SeleniumLibrary
Resource    Generic.robot


*** Variables ***
${shop_page_load}         xpath://a[@class='shopping_cart_link']


*** Keywords ***

Enter your Information
    [Arguments]    ${first_name}    ${last_name}    ${zip}
    Input Text    id:first-name    ${first_name}
    Input Text    id:last-name    ${last_name}
    Input Text    id:postal-code    ${zip}

Purchase the Product and confirm the Purchase
    Click Button    id:continue
    Click Button    id:finish
    Page Should Contain    Checkout: Complete!



