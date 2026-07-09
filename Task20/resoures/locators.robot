*** Variables ***
${USERNAME_FIELD}          id:user-name
${PASSWORD_FIELD}          id:password
${LOGIN_BUTTON}            id:login-button
#error message
${LP_ERROR_MSG}         css=[data-test='error']

#inventory page
${IP_TITLE}             css=.title
${IP_INVENTORY_LIST}    id=inventory_container
${IP_ADD_TO_CART}    xpath=//button[contains(@data-test,'add-to-cart')]
${IP_BADGE_COUNT}    xpath=//span[@class='shopping_cart_badge']


#cart page
${IP_CART_LINK}         xpath=//a[@class='shopping_cart_link']
${CP_TITLE}             xpath=//span[@class='title']
${CP_ITEM_NAMES}        css=.inventory_item_name

