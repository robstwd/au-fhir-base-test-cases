Feature: HL7AU AU Base Diagnostic Imaging Result profile: expected failures for invariant 'inv-obs-0'

 - Context: Observation
 - Human: An imaging result shall at least have value or data absent reason or a child observation with a value or data absent reason
 - Expression: value.exists() or dataAbsentReason.exists() or hasMember.exists() or component.value.exists() or component.dataAbsentReason.exists()
 
As a verifier of HL7AU content
I want invariant 'inv-obs-0' to fail when expected to
In order to be assured of quality

Scenario: Observation.value (all types), dataAbsentReason, hasMember and component.value are all NOT present
    Given a test file named "test-cases/Observation/observation-inv-obs-0-fail-01.xml" exists
    And element "Observation.valueQuantity" is not present
    And element "Observation.valueCodeableConcept" is not present
    And element "Observation.valueString" is not present
    And element "Observation.valueBoolean" is not present
    And element "Observation.valueInteger" is not present
    And element "Observation.valueRange" is not present
    And element "Observation.valueRatio" is not present
    And element "Observation.valueSampledData" is not present
    And element "Observation.valueTime" is not present
    And element "Observation.valueDateTime" is not present
    And element "Observation.valuePeriod" is not present
    And element "Observation.dataAbsentReason" is not present
    And element "Observation.hasMember" is not present
    And element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule inv-obs-0: 'An imaging result shall at least have value or data absent reason or a child observation with a value or data absent reason' Failed"
    
