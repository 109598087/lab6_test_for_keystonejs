*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/wait_until.robot

*** Keywords ***
Click Sign In Button
    Sleep    2s
    Click Element   //a[@class="btn btn-default" and contains(text(), "Sign in") and @href="/keystone/signin"]
    Wait Until Sign In Page Is Visible
