*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/open_and_close_chrom.robot
Resource   ../keywords/go_to_page_from_page.robot
Resource   ../keywords/comment/on_comments_page.robot

Suite Setup    Open Chrome And Go To Home Page
Suite Teardown    Close Chrome

*** Variables ***
${URL}  http://127.0.0.1:3000/
${BROWSER}    Chrome

${commentPostName}    commentPostName
${commentAuthor}   Demo User
${commentState}    Published
${commentContent}   commentContent
*** Test Cases ***
Test Create A Comment
    [Tags]    TC-005a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post     ${commentPostName}
    ...                 AND    Go Admin Ui Page From Edit Post Page
    ...                 AND    Go To Comments Page From Admin Ui Page
    Create A Comment    ${commentAuthor}    ${commentPostName}
    Go To Comments Page From Edit Comment Page
    Verify Comments Page Have Comment    ${commentAuthor}   ${commentPostName}
    [Teardown]   Run Keywords   Delete A Comment   ${commentAuthor}   ${commentPostName}
    ...                   AND   GO TO Admin Ui Page From Comment Page
    ...                   AND   Go To Posts Page From Admin Ui Page
    ...                   AND   Delete A Post   ${commentPostName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Create A Comment And Click Cancel Button
    [Tags]    TC-005b
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post     ${commentPostName}
    ...                 AND    Go Admin Ui Page From Edit Post Page
    ...                 AND    Go To Comments Page From Admin Ui Page
    Click Create Comment Button
    Input Comment Author   ${commentAuthor}
    Input Comment Post Name    ${commentPostName}
    Click Create Cancel Button
    Sleep    1s
    Verify Comments Page Do Not Have Comment With CommentPostName    ${commentPostName}
    [Teardown]   Run Keywords   GO TO Admin Ui Page From Comment Page
    ...                   AND   Go To Posts Page From Admin Ui Page
    ...                   AND   Delete A Post   ${commentPostName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Edit Comment
    [Tags]    TC-006a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post     ${commentPostName}
    ...                 AND    Go Admin Ui Page From Edit Post Page
    ...                 AND    Go To Comments Page From Admin Ui Page
    ...                 AND    Create A Comment    ${commentAuthor}    ${commentPostName}
    Input Comment Author    ${commentAuthor}
    Input Comment Post Name    ${commentPostName}
    Input Comment State    ${commentState}
    Input Comment Content   ${commentContent}
    Click Save Button
    Verify Edit Comment Successfully
    Verify Edit Comment Author Successfully    ${commentAuthor}
    Verify Edit Comment Post Name Successfully     ${commentPostName}
    Verify Edit Comment State Successfully    ${commentState}
    Verify Edit Comment Content Successfully    ${commentContent}
    [Teardown]   Run Keywords   Go To Comments Page From Edit Comment Page
    ...                   AND   Delete A Comment   ${commentAuthor}   ${commentPostName}
    ...                   AND   GO TO Admin Ui Page From Comment Page
    ...                   AND   Go To Posts Page From Admin Ui Page
    ...                   AND   Delete A Post   ${commentPostName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s
#
Test Delete Comment
    [Tags]    TC-007a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post     ${commentPostName}
    ...                 AND    Go Admin Ui Page From Edit Post Page
    ...                 AND    Go To Comments Page From Admin Ui Page
    ...                 AND    Create A Comment    ${commentAuthor}    ${commentPostName}
    ...                 AND    Go To Comments Page From Edit Comment Page
    ${commentId} =    Delete A Comment    ${commentAuthor}   ${commentPostName}
    Verify Comments Page Do Not Have Comment    ${commentId}
    [Teardown]   Run Keywords   GO TO Admin Ui Page From Comment Page
    ...                   AND   Go To Posts Page From Admin Ui Page
    ...                   AND   Delete A Post   ${commentPostName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Delete A Commentt And Click Cancel Button
    [Tags]    TC-007b
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post     ${commentPostName}
    ...                 AND    Go Admin Ui Page From Edit Post Page
    ...                 AND    Go To Comments Page From Admin Ui Page
    ...                 AND    Create A Comment    ${commentAuthor}    ${commentPostName}
    ...                 AND    Go To Comments Page From Edit Comment Page
    ${commentId} =    Get CommentId    ${commentAuthor}   ${commentPostName}
    Click Element    //a[text()="${commentId}"]/parent::td/parent::tr//button
    Wait Until Delete Warning Dialog Is Visible
    Click Delete Cancle Button
    Verify Comments Page Have Comment    ${commentAuthor}   ${commentPostName}
    [Teardown]   Run Keywords   Delete A Comment   ${commentAuthor}   ${commentPostName}
    ...                   AND   GO TO Admin Ui Page From Comment Page
    ...                   AND   Go To Posts Page From Admin Ui Page
    ...                   AND   Delete A Post   ${commentPostName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s