*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/open_and_close_chrom.robot
Resource   ../keywords/category/on_categories_page.robot
Resource   ../keywords/go_to_page_from_page.robot
Resource    ../keywords/post/on_posts_page.robot


Suite Setup    Open Chrome And Go To Home Page
Suite Teardown    Close Chrome

*** Variables ***
${URL}  http://127.0.0.1:3000/
${BROWSER}    Chrome

${categoryName}    categoryName
*** Test Cases ***
Test Create A Category
    [Tags]    TC-008a
    [Setup]    Run Keywords    GO TO Sign In Page From Home Page
    ...                 AND    Sign In As Admin
    ...                 AND    Go To Categories Page From Admin Ui Page
    Create A Category   ${categoryName}
    Go To Categories Page From Edit Category Page
    Verify Categories Page Have Category    ${categoryName}
    [Teardown]   Run Keywords   Delete A Category   ${categoryName}
    ...                   AND   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s