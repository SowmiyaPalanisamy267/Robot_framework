*** Settings ***
Library    SeleniumLibrary
Resource   C://Users/colon/PycharmProjects/Task20/resoures/locators.robot
Resource   C://Users/colon/PycharmProjects/Task20/resoures/variables.robot
Library    Collections
*** Keywords ***
Go To Cart page
    Click Element    ${IP_CART_LINK}
    Wait Until Location Is    ${CART_URL}    timeout=${EXPLICIT_WAIT}
    Wait Until Element Is Visible    ${CP_TITLE}    timeout=${EXPLICIT_WAIT}
    Element Text Should Be           ${CP_TITLE}    Your Cart

Get Cart Item Names
    ${elements}=    Get WebElements    ${CP_ITEM_NAMES}
    ${names}=       Create List
    FOR    ${el}    IN    @{elements}
        Append To List    ${names}    ${el.text}
    END
    RETURN    ${names}

Cart Should Contain Product
    [Arguments]    ${product_name}
    ${names}=    Get Cart Item Names
    Should Contain    ${names}    ${product_name}    msg=Cart does not contain '${product_name}'. Cart has: ${names}


