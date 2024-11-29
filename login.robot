*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   aperture/variable.resource

*** Variables ***
@{TEST_RESULTS}

*** Keywords ***
go to website
    Set Selenium Speed    0.8
    Open Browser    https://www.saucedemo.com/   chrome
    Maximize Browser Window
    ${status}=    Run Keyword And Return Status    Should Be Equal    1    1
    Append To List    ${TEST_RESULTS}    Test Case 1: ${status}
    Log    @{TEST_RESULTS}
login fail by not fill username password
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Username is required
    Click Element   id=login_button_container

login fail by invalid username and invalid password
    Input Text    id=user-name    ${invalidusername}
    Input Password    id=password    ${invalidpassword}
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Click Element   id=login_button_container

login fail by invalid username
    Input Text    id=user-name    ${invalidusername}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Click Element   id=login_button_container

login fail by invalid password
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${invalidpassword}
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Click Element   id=login_button_container
login success
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    page Should Contain    Products
get something to cart
    click button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Element Should Contain    class=shopping_cart_link    1
    Scroll Element Into View    id=item_3_img_link
    click button    name=add-to-cart-test.allthethings()-t-shirt-(red)
    Element Should Contain    class=shopping_cart_link    2
    Scroll Element Into View    class=inventory_item_img
    click button    name=add-to-cart-sauce-labs-backpack
    Element Should Contain    class=shopping_cart_link    3
    Click button    name=add-to-cart-sauce-labs-bike-light
    Element Should Contain    class=shopping_cart_link    4
remove something
    Click button    id=remove-sauce-labs-bike-light
    Element Should Contain    class=shopping_cart_link    3
check the cart    
    click Element    class=shopping_cart_link
    page should contain    Your Cart

** Test Cases ***
first page
    go to website
    # login fail by not fill username password
    # login fail by invalid username and invalid password
    # login fail by invalid username
    # login fail by invalid password
    login success
shopping page
    get something to cart
remove something
    remove something
check cart  
    check the cart