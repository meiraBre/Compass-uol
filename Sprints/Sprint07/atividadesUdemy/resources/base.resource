*** Settings ***
Library    libs/database.py
Library    Browser
Library    JSONLibrary

Resource    env.resource

Resource    pages/components/Notice.resource
Resource    pages/components/Header.resource
Resource    pages/components/alert.resource
Resource    pages/SignupPage.resource
Resource    pages/LoginPage.resource
Resource    pages/TaskCreatePage.resource
Resource    pages/TasksPage.resource
Resource    services.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page       ${BASE_URL}

#Helpers
Get fixtures    
    [Arguments]    ${file_name}    ${scenario}
    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    [Return]    ${data}${scenario}



