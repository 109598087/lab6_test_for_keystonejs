*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/open_and_close_chrom.robot
Resource   ../keywords/go_to_page_from_page.robot
Resource   ../keywords/on_sign_in_page.robot
Resource   ../keywords/post/on_posts_page.robot
Resource   ../keywords/user/on_users_page.robot
Resource    ../keywords/category/on_categories_page.robot

Suite Setup    Open Chrome And Go To Home Page
Suite Teardown    Close Chrome

*** Variables ***
${URL}  http://127.0.0.1:3000/
${BROWSER}    Chrome

${userFirstName}    userFirstName
${userLastName}    userLastName
${userEmail}    abcc@ntut.org.tw
${userPassword}    userPassword
*** Test Cases ***
Test Create A User
    [Tags]   TC-010a
    [Setup]  Run Keywords    GO TO Sign In Page From Home Page
    ...               AND    Sign In As Admin
    ...               AND    Go To Users Page From Admin Ui Page
    Create A User    ${userFirstName}    ${userLastName}    ${userEmail}    ${userPassword}
    Go To Users Page From Edit User Page
    Verify Users Page Have User    ${userFirstName}
    [Teardown]   Run Keywords   Sign Out
    ...                   AND   Go To Home Page From Sign In Page
    ...                   AND   Sleep   5s
