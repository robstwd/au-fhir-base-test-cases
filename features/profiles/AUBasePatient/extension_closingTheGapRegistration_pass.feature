
Feature: HL7AU AU Base Patient profile: expected passes for extension 'Closing the Gap Registration'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration
 - datatype: boolean

As a verifier of HL7AU content
I want extension 'closing-the-gap-registration' to pass when expected to
In order to be assured of quality

Scenario: correct context, boolean as true
    Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-pass-01.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" has child element "valueBoolean" with value "true"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: correct context, boolean as false
    Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-pass-02.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" has child element "valueBoolean" with value "false"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: as it optional, the extension is not present
    Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-pass-03.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is not present
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
