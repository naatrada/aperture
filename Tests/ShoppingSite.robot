*** Settings ***
Resource        ../Resource/ShoppingApp.robot
Resource        ../Resource/Common/Common.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test

# robot -d Results Tests/ShoppingSite.robot

*** Test Cases ***
Should be to access Login page
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
Login fail cases 
    # Set Selenium Speed    1
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.login fail cases
Login success
    # Set Selenium Speed    1
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
Verify that shopping page load
    # Set Selenium Speed    1
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
    ShoppingApp.Verify shopping page load
Check cart before shopping
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
    ShoppingApp.Check that cart empty
Get some items to cart and remove an item
    # Set Selenium Speed    1
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
    ShoppingApp.pick an item    ${ITEM1_ID}
    ShoppingApp.pick an item    ${ITEM2_ID}
    ShoppingApp.pick an item    ${ITEM3_ID}
    ShoppingApp.pick an item    ${ITEM4_ID}
    ShoppingApp.remove an item
Overview page should show correctly items
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
    ShoppingApp.Reset value on cart
    ShoppingApp.pick an item    ${ITEM1_ID}
    ShoppingApp.pick an item    ${ITEM2_ID}
    ShoppingApp.pick an item    ${ITEM3_ID}
    ShoppingApp.pick an item    ${ITEM4_ID}
    ShoppingApp.remove an item
    ShoppingApp.Navigate to Overview page
    ShoppingApp.Check items in cart
Navigate to Checkout page
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
    ShoppingApp.Reset value on cart
    ShoppingApp.pick an item    ${ITEM1_ID}
    ShoppingApp.pick an item    ${ITEM2_ID}
    ShoppingApp.pick an item    ${ITEM3_ID}
    ShoppingApp.pick an item    ${ITEM4_ID}
    ShoppingApp.remove an item
    ShoppingApp.Navigate to Overview page    
    ShoppingApp.Check items in cart
    ShoppingApp.Go to checkout page
Checkout fail cases
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
    ShoppingApp.Reset value on cart
    ShoppingApp.pick an item    ${ITEM1_ID}
    ShoppingApp.pick an item    ${ITEM2_ID}
    ShoppingApp.pick an item    ${ITEM3_ID}
    ShoppingApp.pick an item    ${ITEM4_ID}
    ShoppingApp.remove an item
    ShoppingApp.Navigate to Overview page
    ShoppingApp.Check items in cart
    ShoppingApp.Go to checkout page
    ShoppingApp.Checkout fail cases

Checkout success
    ShoppingApp.Navigate to Login page
    ShoppingApp.Verify page load by login an element
    ShoppingApp.Login success
    ShoppingApp.Reset value on cart
    ShoppingApp.pick an item    ${ITEM1_ID}
    ShoppingApp.pick an item    ${ITEM2_ID}
    ShoppingApp.pick an item    ${ITEM3_ID}
    ShoppingApp.pick an item    ${ITEM4_ID}
    ShoppingApp.remove an item
    ShoppingApp.Navigate to Overview page
    ShoppingApp.Check items in cart
    ShoppingApp.Go to checkout page
    ShoppingApp.Checkout success
    ShoppingApp.Overview page

    

    