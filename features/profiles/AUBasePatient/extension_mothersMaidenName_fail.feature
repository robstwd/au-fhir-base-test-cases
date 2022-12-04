Feature: HL7AU AU Base Patient profile: expected failures for extension 'Patient.mothersMaidenName'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName
 - datatype: string

As a verifier of HL7AU content
I want extension 'Patient.mothersMaidenName' to fail when expected to
In order to be assured of quality

  Rule: Extension in correct context: Patient

    Scenario: wrong context: child of Patient.name
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-01.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is not present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Patient.name"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "TODO"

    Scenario: wrong context: child of Patient.gender
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-02.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is not present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Patient.gender"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The modifier extension http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName is not allowed to be used at this point (allowed = e:Patient"

    Scenario: wrong context: Practitioner
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-03.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Practitioner"
      When I run the validator command on this testfile against profile "au-practitioner"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "TODO"

  Rule: Extension has correct datatype: valueString

    Scenario: wrong datatype: valueDateTime
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-04.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" has child element "valueDateTime"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName' definition allows for the types [string] but found type dateTime"

    Scenario: wrong datatype: valueBoolean
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-05.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" has child element "valueBoolean"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName' definition allows for the types [string] but found type boolean"

  Rule: Extension has correct cardinality 0..1

    Scenario: wrong cardinality: 2 instances
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-06.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present "2" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:mothersMaidenName: max allowed = 1, but found 2"

    Scenario: wrong cardinality: 7 instances
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-07.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present "8" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:mothersMaidenName: max allowed = 1, but found 8"

    Scenario: combo - wrong context, wrong datatypes and wrong cardinality
      Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-fail-08.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present "2" times in parent node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present "2" times in parent node "Patient.name"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present "1" times in parent node "Patient.gender"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 7 errors"
      And the command should "fail" with output message "Patient.extension:mothersMaidenName: max allowed = 1, but found 2"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName' definition allows for the types [string] but found type code"
      And the command should "fail" with output message "The modifier extension http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.name, HumanName])"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName' definition allows for the types [string] but found type boolean"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName' definition allows for the types [string] but found type dateTime"
      And the command should "fail" with output message "The modifier extension http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.gender, code])"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName' definition allows for the types [string] but found type dateTime"