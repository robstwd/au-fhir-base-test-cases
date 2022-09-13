
Feature: HL7AU AU Base Patient profile: expected passes for extension 'birthPlace'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org/fhir/StructureDefinition/patient-birthPlace
 - datatype: Address

As a verifier of HL7AU content
I want extension 'birthPlace' to pass when expected to
In order to be assured of quality

Scenario: correct context, basic content
    Given a test file named "test-cases/Patient/patient-ext-birthPlace-pass-01.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.text"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.country"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: correct context, minimal content
    Given a test file named "test-cases/Patient/patient-ext-birthPlace-pass-02.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.use"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.type"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.text"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.line"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.city"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.district"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.state"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.postalCode"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.country"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" does not have child element "valueAddress.period"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: correct context, maximal content
    Given a test file named "test-cases/Patient/patient-ext-birthPlace-pass-03.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.use"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.type"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.text"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.line"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.city"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.district"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.state"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.postalCode"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.country"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueAddress.period"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"
