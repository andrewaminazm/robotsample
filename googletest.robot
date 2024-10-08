*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.google.com
${SEARCH_TERM}    robot

*** Keywords ***
Open Browser To Google
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name:q    10

Input Search Term And Search
    Input Text    name:q    ${SEARCH_TERM}
    Press Keys    name:q    ENTER    # Presses the Enter key after inputting text

Verify Search Results Are Displayed
    Wait Until Element Is Visible    id:search    10
    Page Should Contain Element    id:search
    [Teardown]    Close Browser

*** Test Cases ***
test1
    Open Browser    https://robotframework.org/    chrome
    Close Browser

searchgoogle
    Open Browser To Google
    Input Search Term And Search
    Verify Search Results Are Displayed
