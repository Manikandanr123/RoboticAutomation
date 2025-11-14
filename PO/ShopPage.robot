*** Settings ***
Documentation    All the Page objects and Keywords of Product Page
Library  SeleniumLibrary
Resource    Generic.robot


*** Variables ***
${shop_page_load}         xpath://a[@class='shopping_cart_link']


*** Keywords ***

Wait Until Element Is Located in the Page
    wait until element passed in located on page    ${shop_page_load}

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




