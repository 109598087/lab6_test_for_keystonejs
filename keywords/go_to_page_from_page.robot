*** Settings ***
Resource   ../keywords/wait_until.robot
Resource   ../keywords/on_home_page.robot
Resource   ../keywords/on_admin_ui_page.robot
Resource   ../keywords/post/on_edit_post_page.robot
Resource   ../keywords/on_sign_in_page.robot
Resource   ../keywords/comment/on_edit_comment_page.robot
Resource   ../keywords/category/on_edit_category_page.robot
Resource   ../keywords/user/on_edit_user_page.robot

*** Keywords ***
GO TO Sign In Page From Home Page
    Click Sign In Button

Go To Posts Page From Admin Ui Page
    Click A Dashboard Button    Posts   Posts

Go To Posts Page From Edit Page
    Click Go Back To Posts Page Button

Go To Home Page From Sign In Page
    Click Logo Button

Go To Comments Page From Admin Ui Page
    Click A Dashboard Button    Posts   Comments

Go Admin Ui Page From Edit Post Page  # TODO: rename
    Click Go To Admin Ui Page Button

Go To Comments Page From Edit Comment Page
    Click Go Back To Comments Page Button

GO TO Admin Ui Page From Comment Page
    Click Go To Admin Ui Page Button

Go To Categories Page From Admin Ui Page
    Click A Dashboard Button    Posts   Categories

Go To Categories Page From Edit Category Page
    Click Go Back To Categories Page Button

Go To contact Page From Home Page
    Click Element    //*[@href="/contact"]
    Wait Until Element Contains    //*[@class="navbar-brand" and @href="/" and text()="KeystoneJS"]    KeystoneJS

Go To Home Page From contact Page
    Click Element    //*[@class="navbar-brand" and @href="/" and text()="KeystoneJS"]
    Wait Until Element Is Visible    //*[contains(text(), "Sign in") and @href="/keystone/signin"]

Go To Enquiries Page From Admin Ui Page
    Click A Dashboard Button    Enquiries   Enquiries
    
Go To Users Page From Admin Ui Page
    Click A Dashboard Button    Users   Users

Go To Users Page From Edit User Page
    Click Go Back To Users Page Button
