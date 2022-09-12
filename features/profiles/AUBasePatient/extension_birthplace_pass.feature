
Feature: HL7AU AU Base Patient profile: expected passes for extension 'birthPlace'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org/fhir/StructureDefinition/patient-birthPlace
 - datatype: Address

As a verifier of HL7AU content
I want extension 'birthPlace' to pass when expected to
In order to be assured of quality

# TODO
Scenario: correct context, basic content
    Given a test file named "test-cases/Patient/patient-ext-birthPlace-pass-01.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"
