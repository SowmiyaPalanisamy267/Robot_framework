*** Settings ***
Library    SeleniumLibrary
Resource   C://Users/colon/PycharmProjects/Task20/resoures/locators.robot
Resource   C://Users/colon/PycharmProjects/Task20/resoures/variables.robot
Library    String

*** Keywords ***
Verify inventory Page
    Wait Until Element Is Visible    ${IP_TITLE}    timeout=${EXPLICIT_WAIT}
    Element Text Should Be           ${IP_TITLE}    Products
    Element Should Be Visible        ${IP_INVENTORY_LIST}

Convert Product Name To Slug
    [Documentation]    Convert "Sauce Labs Backpack" -> "sauce-labs-backpack"
    [Arguments]    ${product_name}
    ${lower}=    Convert To Lower Case    ${product_name}
    ${slug}=     Replace String    ${lower}    ${SPACE}    -
    RETURN    ${slug}

Add Product To Cart
    [Documentation]    Click Add to Cart for a named product
    [Arguments]    ${product_name}
    ${slug}=    Convert Product Name To Slug    ${product_name}

    Wait Until Element Is Visible    ${IP_ADD_TO_CART}    timeout=${EXPLICIT_WAIT}
    Click Element    ${IP_ADD_TO_CART}

Cart Badge Should Show
    [Arguments]    ${expected_count}
    ${actual}=    Get Text    ${IP_BADGE_COUNT}
    Should Be Equal    ${actual}    ${expected_count}    msg=Cart badge: expected '${expected_count}', got '${actual}'


