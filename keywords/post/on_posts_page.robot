*** Settings ***
Library    SeleniumLibrary
Resource    ../../keywords/wait_until.robot

*** Keywords ***
Click Create Post Button
    Click Element   //*[contains(text(), "Create ")]
    Wait Until Create A New Post Dialog Is Visible

Click Trash Can button
    [Arguments]    ${postName}
    Click Element    //*[contains(@href, "/keystone/posts/") and text()="${postName}"]/parent::td/parent::tr//*[@class="ItemList__control ItemList__control--delete"]
    Wait Until Delete Warning Dialog Is Visible

Click Delete Button
    Click Element    //*[contains(@data-button-type, "confirm") and contains(text(), "Delete")]
    Wait Until Posts Page Is Visible

Input Post Name
    [Arguments]    ${postName}
    Input Text    //*[@name="name"]    ${postName}
    
Click Cancel Button
    Click Element    //*[@class="css-rd63ky" and @data-button-type="cancel"]
    Wait Until Posts Page Is Visible

Click Delete Cancel Button
    Click Element    //*[@class="css-w0lrv3" and @data-button-type="cancel"]
    Wait Until Posts Page Is Visible
#########################################################
Click Sign Out Button
    Click Element    //*[@href = "/keystone/signout"]
    Wait Until Sign In Page Is Visible

Create A Post
    [Arguments]    ${postName}
    Click Create Post Button
    Input Post Name    ${postName}
    Submit Form
    Wait Until Edit Post Page Is Visible

Delete A Post
    [Arguments]    ${postName}
    Click Trash Can button  ${postName}
    Click Delete Button

Sign Out
    Click Sign Out Button

Verify Posts Page Have Post
    [Arguments]    ${postName}
    Wait Until Element Is Visible    //*[contains(@href, "/keystone/posts/") and text()="${postName}"]

Verify Posts Page Do Not Have Post
    [Arguments]    ${postName}
    Element Should Not Be Visible    //*[contains(@href, "/keystone/posts/") and text()="${postName}"]

Search A Post
    [Arguments]    ${postName}
    Input Text    //*[@class="css-foh633"]    ${postName}
    Press Keys    //*[@class="css-foh633"]    RETURN
    Sleep    1s

Clean Search Input
    Press Keys    //*[@class="css-foh633"]    CTRL+a+BACKSPACE
    Press Keys    //*[@class="css-foh633"]    RETURN
    Sleep    1s