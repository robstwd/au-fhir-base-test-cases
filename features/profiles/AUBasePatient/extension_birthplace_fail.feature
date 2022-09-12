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
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "TODO"

    Scenario: wrong context: child of Patient.gender
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-02.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is not present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient.gender"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "TODO"

    Scenario: wrong context: Practitioner
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-03.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Practitioner"
      When I run the validator command on this testfile against profile "au-practitioner"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "TODO"

  Rule: Extension has correct datatype: valueAddress

    Scenario: wrong datatype: valueString
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-04.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueString"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-birthPlace' definition allows for the types [Address] but found type string"

    Scenario: wrong datatype: valueBoolean
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-05.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present in node "Patient"
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" has child element "valueBoolean"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org/fhir/StructureDefinition/patient-birthPlace' definition allows for the types [Address] but found type boolean"

  Rule: Extension has correct cardinality

    Scenario: wrong cardinality: 2 instances
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-06.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present "2" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:birthPlace: max allowed = 1, but found 2"

    Scenario: wrong cardinality: 7 instances
      Given a test file named "test-cases/Patient/patient-ext-birthPlace-fail-07.xml" exists
      * extension "http://hl7.org/fhir/StructureDefinition/patient-birthPlace" is present "7" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:birthPlace: max allowed = 1, but found 7"
