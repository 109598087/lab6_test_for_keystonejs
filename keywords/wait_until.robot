*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
# TODO: 找最慢出現元素
Wait Until Home Page Is Visible
    Wait Until Page Contains Element    //*[contains(text(), "Sign in") and @href="/keystone/signin"]

Wait Until Sign In Page Is Visible
    Wait Until Page Contains Element    //*[contains(@class, "logo")]

Wait Until Admin Ui Page Is Visible
    Wait Until Page Contains Element    //*[contains(@class, "dashboard-group")]

# TODO: 找最慢出現元素
Wait Until Posts Page Is Visible
    Wait Until Page Contains Element    //*[contains(text(), "Manage") or contains(text(), "Create ")]

Wait Until Edit Post Page Is Visible
    Wait Until Page Contains Element    //*[contains(@data-e2e-editform-header-back, "true") and contains(@href, "/keystone/posts")]

Wait Until Comments Page Is Visible
    Wait Until Page Contains Element    //*[contains(text(), "Create ")]

Wait Until Edit Comment Page Is Visible
    Wait Until Page Contains Element    //*[contains(@data-e2e-editform-header-back, "true") and contains(@href, "/keystone/post-comments")]

Wait Until Edit Category Page Is Visible
    Wait Until Page Contains Element    //*[contains(@data-e2e-editform-header-back, "true") and contains(@href, "/keystone/post-categories")]

Wait Until Users Page Is Visible
    Wait Until Page Contains Element    //*[contains(text(), "Manage")]

Wait Until Edit User Page Is Visible
    Wait Until Page Contains Element    //*[contains(@data-e2e-editform-header-back, "true") and contains(@href, "/keystone/users")]

# dialog
Wait Until Create A New Post Dialog Is Visible
    Wait Until Page Contains Element    //*[text()="Create a new Post"]

Wait Until Delete Warning Dialog Is Visible
    Wait Until Page Contains Element    //*[contains(@data-button-type, "confirm") and contains(text(), "Delete")]

Wait Until Create A New Comment Dialog Is Visible
    Wait Until Page Contains Element    //*[text()="Create a new Comment"]

Wait Until Create A New Category Dialog Is Visible
    Wait Until Page Contains Element    //*[text()="Create a new Category"]

Wait Until Create A New User Dialog Is Visible
    Wait Until Page Contains Element    //*[text()="Create a new User"]

Wait Until Reset Warning Dialog Is Visible
    Wait Until Page Contains Element    //*[contains(text(), "Reset your changes to")]
