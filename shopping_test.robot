*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    BuiltIn
Resource   aperture/variable.resource


*** Keywords ***
go to website
    Open Browser    https://www.saucedemo.com/   chrome
    Maximize Browser Window
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
check cart0    #check that there is 0 amount for start shopping
    Log To Console   Verify that there is nothing on a cart and overview page
    Element Should not Be Visible    class=shopping_cart_badge   
    Click Element    class=shopping_cart_link  
    Page Should Not Contain Element    class=inventory_item_name
    Go Back
pick items to a cart  
    [Arguments]    ${item_id}
    ${cart_count}=    Evaluate    ${cart_count} + 1
    Set Global Variable    ${cart_count}
    Click Button    id=${item_id}
    Log To Console    Cart count after adding: ${cart_count}
    Element Should Contain    class=shopping_cart_link    ${cart_count}
remove the fourth item
    Log To Console   Verify that users can remove a product
    Click button    id=remove-sauce-labs-bike-light
    Element Should Contain    class=shopping_cart_link    ${cart_count-1}
check the cart    
    click Element    class=shopping_cart_link
    page should contain    Your Cart
check items in cart
    Log To Console   verify that final products are correct
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Page Should Contain    Test.allTheThings() T-Shirt (Red)
    Page Should Contain    Sauce Labs Backpack
check out fail by let every field empty
    Log To Console   verify that users can not checkout with filling incomplete data
    Click Button    id=checkout
    Click Button    id=continue
    Page Should Contain    Error: First Name is required
check out fail by let firstname field empty
    Go back
    Click Button    id=checkout
    Input Text    id=last-name    ${lname}
    Input Text    id=postal-code    ${zipcode}
    Click Button    id=continue
    Page Should Contain    Error: First Name is required
check out fail by let lastname field empty
    Go back
    Click Button    id=checkout
    Input Text    id=first-name    ${fname}
    Input Text    id=postal-code    ${zipcode}
    Click Button    id=continue
    Page Should Contain    Error: Last Name is required
    
check out fail by let zipcode field empty
    Go back
    Click Button    id=checkout
    Input Text    id=first-name    ${fname}
    Input Text    id=last-name    ${lname}
    Click Button    id=continue
    Page Should Contain    Error: Postal Code is required
check out success
    Log To Console  Veify that users can checkout when fill complete data
    Wait Until Page Contains    Checkout: Your Information
    Input Text    id=first-name    ${fname}
    Input Text    id=last-name    ${lname}
    Input Text    id=postal-code    ${zipcode}
    
overview
    Click Button    id=continue
    Wait Until Page Contains    Checkout: Overview
finish
    Click Button    id=finish
    Page Should Contain    Thank you for your order!

** Test Cases ***
first page
    go to website
    login fail by not fill username password
    login fail by invalid username and invalid password
    login fail by invalid username
    login fail by invalid password
    login success
get something to cart
    check cart0
    pick items to a cart    add-to-cart-sauce-labs-bolt-t-shirt
    pick items to a cart    add-to-cart-test.allthethings()-t-shirt-(red)
    pick items to a cart    add-to-cart-sauce-labs-backpack
    pick items to a cart    add-to-cart-sauce-labs-bike-light
remove something
    remove the fourth item
check cart  
    check the cart
    check items in cart
check out fail 
    check out fail by let every field empty
    check out fail by let firstname field empty
    check out fail by let lastname field empty
    check out fail by let zipcode field empty
check out success
    check out success
overview
    overview
    check items in cart
final step
    finish
    