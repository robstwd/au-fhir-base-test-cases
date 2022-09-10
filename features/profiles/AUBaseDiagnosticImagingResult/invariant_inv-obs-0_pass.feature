Feature: HL7AU AU Base Diagnostic Imaging Result profile: expected passes for invariant 'inv-obs-0'

 - Context: Observation
 - Human: An imaging result shall at least have value or data absent reason or a child observation with a value or data absent reason
 - Expression: value.exists() or dataAbsentReason.exists() or hasMember.exists() or component.value.exists() or component.dataAbsentReason.exists()
 
As a verifier of HL7AU content
I want invariant 'inv-obs-0' to pass when expected to
In order to be assured of quality

Scenario: Observation.valueQuantity is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-01.xml" exists
    And its element "Observation.valueQuantity.value" has value "0.887"
    And its element "Observation.valueQuantity.unit" has value "g/cm-2"
    And its element "Observation.valueQuantity.system" has value "http://unitsofmeasure.org"
    And its element "Observation.valueQuantity.code" has value "g/cm-2"
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.valueString is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-02.xml" exists
    And its element "Observation.valueString" has value "Imaging report details"
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.valueInteger is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-03.xml" exists
    And its element "Observation.valueInteger" has value "7"
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.valueBoolean is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-04.xml" exists
    And its element "Observation.valueBoolean" has value "true"
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

