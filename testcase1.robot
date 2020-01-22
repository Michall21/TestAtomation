*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${numberValue}
${NextButton1}  xpath://article[@id='entry-216']//input[2] 
${tableRows}


*** Test Cases ***
SlspTest
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    user-agent\= VuGen
    Create WebDriver    Chrome    chrome_options=${options}    
    Go To    https://www.myloadtest.com/training/correlation-challenge/




    ##create webdriver    chrome  executable_path="C:\drivers\chromedriver.exe"
    ##open browser    https://www.myloadtest.com/training/correlation-challenge/   chrome  executable

    click element  ${NextButton1}
    ${numberValue} =    Get Text    xpath:/html/body/div[3]/div[2]/div/div[1]/article/div/div/p/strong
    input text  //input[@name='magicnumber']   ${numberValue}
    click element   xpath://div[@class='grid entry-list']//input[2]
    click element   xpath://div[@class='text clearfix']//form//input
    ${tableRows} =  Get element count   tag:tr
    ##log to console  ${tableRows} 
    :FOR    ${index}    IN RANGE   1  ${tableRows} + 1
    \   ${isChecked} =  get table cell  xpath://div[@class='text clearfix']//form//table     ${index}    3
    \   run keyword if  '${isChecked}' == 'In Stock'  click element     xpath://tr[${index}]//td[4]//input[1]
    click element   xpath://input[4]
    click element   xpath://input[485]
    current frame should contain    Correlation Challenge Completed!



*** Keywords ***
