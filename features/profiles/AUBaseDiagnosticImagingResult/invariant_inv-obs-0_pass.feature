Feature: HL7AU AU Base Diagnostic Imaging Result profile: expected passes for invariant 'inv-obs-0'

 - Context: Observation
 - Human: An imaging result shall at least have value or data absent reason or a child observation with a value or data absent reason
 - Expression: value.exists() or dataAbsentReason.exists() or hasMember.exists() or component.value.exists() or component.dataAbsentReason.exists()
 
As a verifier of HL7AU content
I want invariant 'inv-obs-0' to pass when expected to
In order to be assured of quality

Scenario: Observation.valueQuantity is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-01.xml" exists
    * element "Observation.valueQuantity" is present
    * element "Observation.dataAbsentReason" is not present
    * element "Observation.hasMember" is not present
    * element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.valueString is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-02.xml" exists
    * element "Observation.valueString" is present
    * element "Observation.dataAbsentReason" is not present
    * element "Observation.hasMember" is not present
    * element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.valueInteger is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-03.xml" exists
    * element "Observation.valueInteger" is present
    * element "Observation.dataAbsentReason" is not present
    * element "Observation.hasMember" is not present
    * element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.valueBoolean is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-04.xml" exists
    * element "Observation.valueBoolean" is present
    * element "Observation.dataAbsentReason" is not present
    * element "Observation.hasMember" is not present
    * element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.dataAbsentReason is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-05.xml" exists
    * element "Observation.valueQuantity" is not present
    * element "Observation.valueCodeableConcept" is not present
    * element "Observation.valueString" is not present
    * element "Observation.valueBoolean" is not present
    * element "Observation.valueInteger" is not present
    * element "Observation.valueRange" is not present
    * element "Observation.valueRatio" is not present
    * element "Observation.valueSampledData" is not present
    * element "Observation.valueTime" is not present
    * element "Observation.valueDateTime" is not present
    * element "Observation.valuePeriod" is not present
    * element "Observation.dataAbsentReason" is present
    * element "Observation.hasMember" is not present
    * element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.hasMember is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-06.xml" exists
    * element "Observation.valueQuantity" is not present
    * element "Observation.valueCodeableConcept" is not present
    * element "Observation.valueString" is not present
    * element "Observation.valueBoolean" is not present
    * element "Observation.valueInteger" is not present
    * element "Observation.valueRange" is not present
    * element "Observation.valueRatio" is not present
    * element "Observation.valueSampledData" is not present
    * element "Observation.valueTime" is not present
    * element "Observation.valueDateTime" is not present
    * element "Observation.valuePeriod" is not present
    * element "Observation.dataAbsentReason" is not present
    * element "Observation.hasMember" is present
    * element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: Observation.component.value is present, no others
    Given a test file named "test-cases/Observation/observation-inv-obs-0-pass-07.xml" exists
    * element "Observation.valueQuantity" is not present
    * element "Observation.valueCodeableConcept" is not present
    * element "Observation.valueString" is not present
    * element "Observation.valueBoolean" is not present
    * element "Observation.valueInteger" is not present
    * element "Observation.valueRange" is not present
    * element "Observation.valueRatio" is not present
    * element "Observation.valueSampledData" is not present
    * element "Observation.valueTime" is not present
    * element "Observation.valueDateTime" is not present
    * element "Observation.valuePeriod" is not present
    * element "Observation.dataAbsentReason" is not present
    * element "Observation.hasMember" is not present
    * element "Observation.component.valueString" is present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "succeed" with output message "Success: 0 errors"
