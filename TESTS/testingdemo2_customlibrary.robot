*** Settings ***
Documentation   TO validate the login form
Library  SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Suite Setup    Set Selenium Speed    1 s
Test Setup    open the saucedemo website with login url
Test Teardown    close Browser Session
#Test Teardown    NONE
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot
Resource    ../PO/CheckOutPage.robot
Resource    ../PO/ConfirmationPage.robot
#this will get executed at the end of each and every test case- tear down

#Resource

*** Variables ***
@{listofProducts}         Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt
${first_name}             Mani
${last_name}              R
${zip}                    22056


*** Test Cases ***

#validate Unsuccessful login
    #LandingPage.fill the login form    ${user_name}    ${invalid_password}
    #LandingPage.Wait Until Element Is Located in the Page
    #LandingPage.verify error message is correct

validate cards display in the shopping Page
    LandingPage.fill the login form    ${user_name}    ${valid_password}
    Sleep    2 s
    Sleep    2 s
    ShopPage.Wait Until Element Is Located in the Page
    #Sleep    2 s
    ShopPage.verify Card Titles in the Product Page
    #Sleep    2 s
    Add Items To Cart And Checkout    @{listofProducts}
    #Sleep    2 s
    CheckOutPage.Verify Items in the Checkout Page and proceed
    ConfirmationPage.Enter your Information    ${first_name}    ${last_name}    ${zip}
    ConfirmationPage.Purchase the Product and confirm the Purchase









