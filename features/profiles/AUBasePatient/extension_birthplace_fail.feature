Feature: HL7AU AU Base Patient profile: expected failures for extension 'birthPlace'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org/fhir/StructureDefinition/patient-birthPlace
 - datatype: Address

As a verifier of HL7AU content
I want extension 'birthPlace' to fail when expected to
In order to be assured of quality

  Rule: Extension in correct context: Patient

    Scenario: wrong context: child of Patient.address
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-01.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is not present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient.address"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 3 errors"
      And "Error @ Patient.address" is raised with message "The extension http://hl7.org/fhir/StructureDefinition/patient-birthPlace is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.address, Address])"

    Scenario: wrong context: child of Patient.gender
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-02.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is not present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient.gender"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.gender" is raised with message "The extension http://hl7.org/fhir/StructureDefinition/patient-birthPlace is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.gender, code])"

    Scenario: wrong context: Practitioner
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-03.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Practitioner"
      When I run the validator command on this testfile against profile "au-practitioner"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Practitioner" is raised with message "The extension http://hl7.org/fhir/StructureDefinition/patient-birthPlace is not allowed to be used at this point (allowed = e:Patient; this element is [Practitioner])"

  Rule: Extension has correct datatype: valueAddress

    Scenario: wrong datatype: valueString
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-04.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueString"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.extension" is raised with message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-birthPlace' definition allows for the types [Address] but found type string"

    Scenario: wrong datatype: valueBoolean
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-05.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueBoolean"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.extension" is raised with message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-birthPlace' definition allows for the types [Address] but found type boolean"

  Rule: Extension has correct cardinality 0..1

    Scenario: wrong cardinality: 2 instances
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-06.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present "2" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient" is raised with message "Patient.extension:birthPlace: max allowed = 1, but found 2"

    Scenario: wrong cardinality: 7 instances
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-07.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present "7" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient" is raised with message "Patient.extension:birthPlace: max allowed = 1, but found 7"
