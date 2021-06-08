*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/open_and_close_chrom.robot
Resource   ../keywords/go_to_page_from_page.robot
Resource   ../keywords/on_sign_in_page.robot
Resource   ../keywords/post/on_posts_page.robot

Suite Setup    Open Chrome And Go To Home Page
Suite Teardown    Close Chrome

*** Variables ***
${URL}  http://127.0.0.1:3000/
${BROWSER}    Chrome

${postName}    postName
${postState}    Published
${postAuthor}   Demo User
${publishedDate}   2020-05-20
${postContentBrief}    postContentBrief
${postContentExtended}    postContentExtended

*** Test Cases ***
Test Create A Post
    [Tags]    TC-001a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    Create A Post   ${postName}
    Go To Posts Page From Edit Page
    Verify Posts Page Have Post    ${postName}
    [Teardown]   Run Keywords   Delete A Post   ${postName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Create A Post And Click Cancel Button
    [Tags]    TC-001b
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    Click Create Post Button
    Input Post Name    ${postName}
    Click Cancel Button
    Verify Posts Page Do Not Have Post    ${postName}
    [Teardown]   Run Keywords   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Edit A Post
    [Tags]    TC-002a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post   ${postName}
    Input Post State    ${postState}
    Input Post Author    ${postAuthor}
    Input Post Published Date    ${publishedDate}
    Input Post Content Brief    ${postContentBrief}
    Input Post Content Extended    ${postContentExtended}
    Save Edit Post
    Verify Edit Post Successfully
    Verify Edit Post State Successfully    ${postState}
    Verify Edit Post Author Successfully    ${postAuthor}
    Verify Edit Post Published Date Successfully    ${publishedDate}
    Verify Edit Post Content Brief Successfully    ${postContentBrief}
    Verify Edit Post Content Extended Successfully     ${postContentExtended}
    [Teardown]   Run Keywords   Go To Posts Page From Edit Page
    ...                   AND   Delete A Post   ${postName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Delete A Post
    [Tags]    TC-003a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post   ${postName}
    ...                 AND    Go To Posts Page From Edit Page
    Delete A Post   ${postName}
    Verify Posts Page Do Not Have Post    ${postName}
    [Teardown]   Run Keywords   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Delete A Post And Click Cancel Button
    [Tags]    TC-003b
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post   ${postName}
    ...                 AND    Go To Posts Page From Edit Page
    Click Trash Can button  ${postName}
    Click Delete Cancel Button
    Verify Posts Page Have Post    ${postName}
    [Teardown]   Run Keywords   Delete A Post   ${postName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Search A Post
    [Tags]    TC-004a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post   ${postName}
    ...                 AND    Go To Posts Page From Edit Page
    Search A Post   ${postName}
    Verify Posts Page Have Post    ${postName}
    [Teardown]   Run Keywords   Delete A Post   ${postName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s

Test Search A Post With Wrong PostName
    [Tags]    TC-004b
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Posts Page From Admin Ui Page
    ...                 AND    Create A Post   ${postName}
    ...                 AND    Go To Posts Page From Edit Page
    Search A Post   abciqojlksdfjasdlkfji
    Verify Posts Page Do Not Have Post    ${postName}
    [Teardown]   Run Keywords   Clean Search Input
    ...                   AND   Delete A Post   ${postName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s