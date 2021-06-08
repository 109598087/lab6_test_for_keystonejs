*** Settings ***
Library    SeleniumLibrary
Resource    ../../keywords/wait_until.robot
Resource    ../../keywords/Enquirie/on_contact_page.robot

*** Keywords ***
Click Trash Can button
    [Arguments]    ${enquirieName}
    Click Element    //*[contains(@href, "/keystone/enquiries/") and text()="${enquirieName}"]/parent::td/parent::tr//*[@class="ItemList__control ItemList__control--delete"]
    Wait Until Delete Warning Dialog Is Visible

Click Delete Button
    Click Element    //*[contains(@data-button-type, "confirm") and contains(text(), "Delete")]
    Wait Until Posts Page Is Visible

Create A Enquirie
    [Arguments]    ${enquirieName}    ${enquirieEmail}    ${enquirieRegarding}    ${enquirieMessage}
    Sleep    1s
    Input Enquirie Name     ${enquirieName}
    Sleep    1s
    Input Enquirie Email     ${enquirieEmail}
    Sleep    1s
    Input Enquirie Regarding    ${enquirieRegarding}
    Sleep    1s
    Input Enquirie Type    ${enquirieMessage}
    Sleep    1s
    Submit Form

Delete A Enquiry
    [Arguments]    ${enquirieName}
    on_enquiries_page.Click Trash Can button    ${enquirieName}
    on_enquiries_page.Click Delete Button

Verify Enquiries Page Have Enquiry
    [Arguments]    ${enquirieName}
     Wait Until Element Is Visible    //*[contains(@href, "/keystone/enquiries/") and text()="${enquirieName}"]