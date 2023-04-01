*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    https://www.amazon.com/    ${BROWSER}

*** Variables ***
${BROWSER}    chrome
${SEARCH_TERM}    test automation
${BEST_SELLER_FILTER}    Best Sellers
${BOOK_TITLE_LOCATOR}    //span[@class='a-size-medium a-color-base a-text-normal']
${ADD_TO_CART_BUTTON}    add-to-cart-button
${CART_ICON_LOCATOR}    //span[@class='nav-cart-icon nav-sprite']
${CART_QUANTITY_LOCATOR}    //span[@class='a-dropdown-prompt']
${EXPECTED_CART_QUANTITY}    1

*** Test Cases ***
Filter Best Seller Test Automation Books And Add Top Book To Cart
    Input Text    id=twotabsearchtextbox    ${SEARCH_TERM}
    Click Button    xpath=//input[@value='Go']
    Click Link    ${BEST_SELLER_FILTER}
    Wait Until Page Contains Element    ${BOOK_TITLE_LOCATOR}
    ${book_title}    Get Text    xpath=${BOOK_TITLE_LOCATOR}
    Click Element    xpath=${BOOK_TITLE_LOCATOR}
    Wait Until Page Contains Element    id=${ADD_TO_CART_BUTTON}
    Click Element    id=${ADD_TO_CART_BUTTON}
    Wait Until Element Contains    ${CART_ICON_LOCATOR}    ${EXPECTED_CART_QUANTITY}
    Click Element    ${CART_ICON_LOCATOR}
    Wait Until Page Contains Element    ${CART_QUANTITY_LOCATOR}
    ${cart_quantity}    Get Text    xpath=${CART_QUANTITY_LOCATOR}
    Should Be Equal As Strings    ${cart_quantity}    ${EXPECTED_CART_QUANTITY}


