*** Settings ***
Documentation   TO validate the login form
Library  SeleniumLibrary
Library    Collections
Suite Setup    Set Selenium Speed    2 s
Test Setup    open the saucedemo website with login url
Test Teardown    close Browser Session
#Test Teardown    NONE
Resource    resource.robot
#this will get executed at the end of each and every test case- tear down


*** Variables ***
${Error_Message_Login}    css:h3[data-test="error"]
${shop_page_load}         xpath://a[@class='shopping_cart_link']


*** Test Cases ***


#validate Unsuccessful login
    #fill the login form    ${user_name}    ${invalid_password}
    #Wait Until Element Is Located in the Page    ${Error_Message_Login}
    #verify error message is correct

validate cards display in the shopping Page
    [Tags]    EXCLUDE_ME
    fill the login form    ${user_name}    ${valid_password}
    Wait Until Element Is Located in the Page    ${shop_page_load}
    verify Card Titles in the Product Page
    select the Product    Sauce Labs Backpack

sort the product by lowest order
    [Tags]    EXCLUDE_ME
    sort by lowest order


*** Keywords ***


fill the login form
    [arguments]    ${user_name}    ${password}
    Input Text    id:user-name    ${user_name}
    Input Password    id:password    ${password}
    Click Button    xpath://input[@id='login-button']


Wait Until Element Is Located in the Page
    [arguments]    ${element}    ${timeout}=10s
    Wait Until Element Is Visible    ${element}    ${timeout}


verify error message is correct
    Element Should Contain    ${Error_Message_Login}    Epic sadface: Username and password do not match any user in this service

verify Card Titles in the Product Page
   @{expectedList}=  Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
   ${elements}=  Get WebElements    css:.inventory_item_name
   @{actualList}=  Create List
   FOR    ${element}    IN    @{elements}
       Log    ${element.text}
       Append To List  ${actualList}  ${element.text}
   END
   Lists Should Be Equal  ${expectedList}  ${actualList}

select the Product
    [arguments]    ${product}
    ${elements}=  Get WebElements    css:.inventory_item_name
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${product}' == '${element.text}'
        ${index}=    Evaluate  ${index} + 1
    END
    Click Button    xpath:(//*[@class='btn btn_primary btn_small btn_inventory '])[${index}]


sort by lowest order
    fill the login form    ${user_name}    ${valid_password}
    Select From List By Value    xpath://select[@class='product_sort_container']    lohi






