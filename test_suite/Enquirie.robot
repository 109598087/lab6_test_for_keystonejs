*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/open_and_close_chrom.robot
Resource   ../keywords/go_to_page_from_page.robot
Resource   ../keywords/Enquirie/on_contact_page.robot
Resource   ../keywords/on_home_page.robot
Resource   ../keywords/Enquirie/on_enquiries_page.robot
Resource   ../keywords/post/on_posts_page.robot
Resource    ../keywords/category/on_categories_page.robot

Suite Setup    Open Chrome And Go To Home Page
Suite Teardown    Close Chrome

*** Variables ***
${URL}  http://127.0.0.1:3000/
${BROWSER}    Chrome

${enquirieName}    Chu
${enquirieEmail}    t109598087@ntut.org.tw
${enquirieRegarding}    Just leaving a message
${enquirieMessage}  enquirie_message


*** Test Cases ***
Test Create A Enquirie
    [Tags]    TC-009a
    [Setup]    Run Keywords    Go To contact Page From Home Page
    Create A Enquirie   ${enquirieName}    ${enquirieEmail}    ${enquirieRegarding}    ${enquirieMessage}
    Verify Create Enquirie Successfully
    Sleep    1s
    [Teardown]    Run Keywords    Go To Home Page From contact Page
    ...                    AND    GO TO Sign In Page From Home Page
    ...                    AND    Sign In As Admin
    ...                    AND    Go To Enquiries Page From Admin Ui Page
    ...                    AND    Delete A Enquiry    ${enquirieName}
    ...                    AND    Sign Out
    ...                    AND    Go To Home Page From Sign In Page
    ...                    AND    Sleep   5s
#
#Test Delete A Enquirie
#    [Setup]    Run Keywords    Go To contact Page From Home Page
#    ...                 AND    Create A Enquirie   ${enquirieName}    ${enquirieEmail}    ${enquirieRegarding}    ${enquirieMessage}
#    ...                 AND    Sleep    1s
#    ...                 AND    Go To Home Page From contact Page
#    ...                 AND    GO TO Sign In Page From Home Page
#    ...                 AND    Sign In As Admin
#    ...                 AND    Go To Enquiries Page From Admin Ui Page
#    Delete A Enquiry    ${enquirieName}
#    Verify Enquiries Page Have Enquiry    ${enquirieName}
#    [Teardown]    Run Keywords    Sign Out
#    ...                    AND    Go To Home Page From Sign In Page
#    ...                    AND    Sleep   2s