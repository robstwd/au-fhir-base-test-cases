Feature: HL7AU AU Base Patient profile: expected failures for extension 'Closing the Gap Registration'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration
 - datatype: boolean

As a verifier of HL7AU content
I want extension 'closing-the-gap-registration' to fail when expected to
In order to be assured of quality

  Rule: Extension in correct context: Patient

    Scenario: wrong context - child of Patient.gender
      Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-fail-01.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is not present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present in node "Patient.gender"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" has child element "valueBoolean"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The modifier extension http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.gender, code])"

    Scenario: wrong context - child of Patient.birthDate
      Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-fail-02.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is not present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present in node "Patient.birthDate"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" has child element "valueBoolean"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The modifier extension http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.birthDate, date])"

  Rule: Extension has correct datatype: valueBoolean

    Scenario: wrong datatype - valueString
      Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-fail-03.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" does not have child element "valueBoolean"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" has child element "valueString" with value "true"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration' definition allows for the types [boolean] but found type string"

    Scenario: wrong datatype - valueDateTime
      Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-fail-04.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" does not have child element "valueBoolean"
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" has child element "valueDateTime"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 2 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration' definition allows for the types [boolean] but found type dateTime"

  Rule: Extension has correct cardinality in Patient 0..1

    Scenario: wrong cardinality: 2 instances
      Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-fail-05.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present "2" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:closingTheGapRegistration: max allowed = 1, but found 2"

    Scenario: wrong cardinality: 4 instances
      Given a test file named "test-cases/Patient/patient-ext-closingTheGapRegistration-fail-06.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration" is present "4" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:closingTheGapRegistration: max allowed = 1, but found 4"
