*** Settings ***
Library    SeleniumLibrary
Resource   ../../keywords/wait_until.robot
Resource   ../../keywords/post/on_posts_page.robot


*** Keywords ***
Click Create Category Button
    Click Element    //*[contains(text(), "Create ")]
    Wait Until Create A New Category Dialog Is Visible

Input Category Name
    [Arguments]    ${categoryName}
    Input Text    //*[@name="name"]    ${categoryName}

Click Trash Can button
    [Arguments]    ${categoryName}
    Click Element    //*[contains(@href, "/keystone/post-categories/") and text()="${categoryName}"]/parent::td/parent::tr//*[@class="ItemList__control ItemList__control--delete"]
    Wait Until Delete Warning Dialog Is Visible

###############################
Create A Category
    [Arguments]    ${categoryName}
    Click Create Category Button
    Input Category Name    ${categoryName}
    Submit Form
    Wait Until Edit Category Page Is Visible

Verify Categories Page Have Category
    [Arguments]    ${categoryName}
    Wait Until Element Is Visible    //*[contains(@href, "/keystone/post-categories/") and text()="${categoryName}"]

Delete A Category
    [Arguments]    ${categoryName}
    on_categories_page.Click Trash Can button     ${categoryName}
    Click Delete Button