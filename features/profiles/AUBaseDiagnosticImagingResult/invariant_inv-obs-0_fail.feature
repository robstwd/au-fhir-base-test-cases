Feature: HL7AU AU Base Diagnostic Imaging Result profile: expected failures for invariant 'inv-obs-0'

 - Context: Observation
 - Human: An imaging result shall at least have value or data absent reason or a child observation with a value or data absent reason
 - Expression: value.exists() or dataAbsentReason.exists() or hasMember.exists() or component.value.exists() or component.dataAbsentReason.exists()
 
As a verifier of HL7AU content
I want invariant 'inv-obs-0' to fail when expected to
In order to be assured of quality

Scenario: Observation.value (all types), dataAbsentReason, hasMember and component.value are all NOT present
    Given a test file named "test-cases/Observation/observation-inv-obs-0-fail-01.xml" exists
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
    * element "Observation.component" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the output will include the result "*FAILURE*: 1 errors"
    And "Error @ Observation" is raised with message "Rule inv-obs-0: 'An imaging result shall at least have value or data absent reason or a child observation with a value or data absent reason' Failed"

Scenario: Observation.value (all types), dataAbsentReason, hasMember are not present, but component is present without a value
    Given a test file named "test-cases/Observation/observation-inv-obs-0-fail-02.xml" exists
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
    * element "Observation.component" is present
    * element "Observation.component.dataAbsentReason" is not present
    * element "Observation.component.valueQuantity" is not present
    * element "Observation.component.valueCodeableConcept" is not present
    * element "Observation.component.valueString" is not present
    * element "Observation.component.valueBoolean" is not present
    * element "Observation.component.valueInteger" is not present
    * element "Observation.component.valueRange" is not present
    * element "Observation.component.valueRatio" is not present
    * element "Observation.component.valueSampledData" is not present
    * element "Observation.component.valueTime" is not present
    * element "Observation.component.valueDateTime" is not present
    * element "Observation.component.valuePeriod" is not present
    When I run the validator command on this testfile against profile "au-imagingresult"
    Then the output will include the result "*FAILURE*: 1 errors"
    And "Error @ Observation" is raised with message "Rule inv-obs-0: 'An imaging result shall at least have value or data absent reason or a child observation with a value or data absent reason' Failed"
    