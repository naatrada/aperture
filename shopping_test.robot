*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   aperture/variable.resource

*** Variables ***
@{TEST_RESULTS}

*** Keywords ***
go to website
    # Set Selenium Speed    1.5
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
pick first item to cart
    click button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Element Should Contain    class=shopping_cart_link    1
pick second item to cart
    Scroll Element Into View    id=item_3_img_link
    click button    name=add-to-cart-test.allthethings()-t-shirt-(red)
    Element Should Contain    class=shopping_cart_link    2
pick third item to cart
    Scroll Element Into View    class=inventory_item_img
    click button    name=add-to-cart-sauce-labs-backpack
    Element Should Contain    class=shopping_cart_link    3
pick fourth item to cart
    Click button    name=add-to-cart-sauce-labs-bike-light
    Element Should Contain    class=shopping_cart_link    4
remove the fourth item
    Click button    id=remove-sauce-labs-bike-light
    Element Should Contain    class=shopping_cart_link    3
check the cart    
    click Element    class=shopping_cart_link
    page should contain    Your Cart
check items in cart
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Page Should Contain    Test.allTheThings() T-Shirt (Red)
    Page Should Contain    Sauce Labs Backpack
check out
    Click Button    id=checkout
    Page Should Contain    Checkout: Your Information
    Input Text    id=first-name    ${fname}
    Input Text    id=last-name    ${lname}
    Input Text    id=postal-code    ${zipcode}
    
overview
    Click Button    id=continue
    Page Should Contain    Checkout: Overview
finish
    Click Button    id=finish
    Page Should Contain    Thank you for your order!

** Test Cases ***
first page
    go to website
    # login fail by not fill username password
    # login fail by invalid username and invalid password
    # login fail by invalid username
    # login fail by invalid password
    login success
get something to cart
    pick first item to cart
    pick second item to cart
    pick third item to cart
    pick fourth item to cart
remove something
    remove the fourth item
check cart  
    check the cart
    check items in cart
check out   
    check out
overview
    overview
    check items in cart
final step
    finish
    