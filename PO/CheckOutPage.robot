*** Settings ***
Documentation    All the Page objects and Keywords of Product Page
Library  SeleniumLibrary
Resource    Generic.robot


*** Variables ***
${shop_page_load}         xpath://a[@class='shopping_cart_link']


*** Keywords ***
Verify Items in the Checkout Page and proceed
    Click Element    xpath://button[@id='checkout']





