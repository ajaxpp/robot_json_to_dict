*** Settings ***
Library  Collections
Library  OperatingSystem

*** Variables ***
${MY_DATA_TABLE_VALUES_TEMP}  {"foo": "this is foo", "bar": "this is bar"}
${JSON_FILE}  ${EXECDIR}/training/robot/test.json

*** Keywords ***
Converting a JSON File
    ${JSON_DATA}  Get File  ${JSON_FILE}
    ${MY_DATA_TABLE_VALUES}  evaluate  json.loads($JSON_DATA)    json
    [Return]  ${MY_DATA_TABLE_VALUES}

*** Test Cases ***
Example
    ${data}=  converting a json file
    ${datatype}=  evaluate  str(type($data))
    should be equal  ${datatype}  <class 'dict'>
    # should be equal  ${data['title']}  this is foo
    Log To Console  ${data['glossary']['title']}
    Log To Console  ${data}[glossary][title]
