*** Settings ***
Documentation    Suite description
Resource    ../post/on_edit_post_page.robot
Resource    ../../keywords/wait_until.robot
Resource    ../post/on_posts_page.robot

*** Keywords ***
Click Create Comment Button
    Click Element   //*[contains(text(), "Create ")]
    Wait Until Create A New Comment Dialog Is Visible

Click Comment Author Select Arrow
    Click Element    //*[contains(@class, "css-1wrt3l9") and @for="author"]//*[@class = "Select-arrow"]

Input Select Comment Author
    [Arguments]    ${commentAuthor}
    Input Text    //*[@for="author"]//*[contains(@aria-activedescendant, "react-select")]    ${commentAuthor}

Input Select Comment Post Name
    [Arguments]    ${commentPostName}
    Input Text    //*[@for="post"]//*[contains(@aria-activedescendant, "react-select")]    ${commentPostName}

Input Comment Post Name
    [Arguments]     ${commentPostName}
    Click Comment Author Select Arrow
    Input Select Comment Post Name    ${commentPostName}
    Press Keys    //*[@for="post"]//*[contains(@aria-activedescendant, "react-select")]    RETURN

Input Comment Author
    [Arguments]    ${commentAuthor}
    Click Comment Author Select Arrow
    Input Select Comment Author    ${commentAuthor}
    Press Keys    //*[@for="author"]//*[contains(@aria-activedescendant, "react-select")]    RETURN

############################
Create A Comment
    [Arguments]    ${commentAuthor}   ${commentPostName}
    Click Create Comment Button
    Input Comment Author   ${commentAuthor}
    Input Comment Post Name    ${commentPostName}
    Submit Form
    Wait Until Edit Comment Page Is Visible

Verify Comments Page Have Comment
    [Arguments]    ${commentAuthor}   ${commentPostName}
    ${commentId} =    Get Element Attribute    //a[contains(@href, "/keystone/posts/") and text()="${commentPostName}"]/parent::td/parent::tr//a[contains(@href, "/keystone/users/") and text()="${commentAuthor}"]/parent::td/parent::tr//a[contains(@href, "/keystone/post-comments/")]   title
    Wait Until Element Contains    //a[text()="${commentId}"]   ${commentId}


Verify Comments Page Do Not Have Comment
    [Arguments]    ${commentId}
    Element Should Not Be Visible    //a[text()="${commentId}"]   ${commentId}

Verify Comments Page Do Not Have Comment With CommentPostName
    [Arguments]    ${commentPostName}
    Element Should Not Be Visible    //a[text()="${commentPostName}"]

Delete A Comment
    [Arguments]    ${commentAuthor}   ${commentPostName}
    ${commentId} =    Get CommentId    ${commentAuthor}   ${commentPostName}
    Click Element    //a[text()="${commentId}"]/parent::td/parent::tr//button
    Wait Until Delete Warning Dialog Is Visible
    Click Delete Button
    Wait Until Comments Page Is Visible
    [return]    ${commentId}

Get CommentId
    [Arguments]    ${commentAuthor}   ${commentPostName}
    ${commentId} =    Get Element Attribute    //a[contains(@href, "/keystone/posts/") and text()="${commentPostName}"]/parent::td/parent::tr//a[contains(@href, "/keystone/users/") and text()="${commentAuthor}"]/parent::td/parent::tr//a[contains(@href, "/keystone/post-comments/")]   title
    [return]    ${commentId}


Click Create Cancel Button
    Click Element    //*[@class="css-rd63ky" and @data-button-type="cancel"]
    Wait Until Comments Page Is Visible

Click Delete Cancle Button
    Click Element    //*[@class="css-w0lrv3" and @data-button-type="cancel"]
    Wait Until Comments Page Is Visible
