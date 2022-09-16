Feature: HL7AU AU Base Patient profile: expected failures for extension 'Australian Indigenous Status'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org.au/fhir/StructureDefinition/indigenous-status
 - datatype: Coding

As a verifier of HL7AU content
I want extension 'Australian Indigenous Status' to fail when expected to
In order to be assured of quality

  Rule: Extension in correct context: Patient

    Scenario: wrong context - child of Patient.gender
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-01.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is not present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient.gender"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "2"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.display" with value "Torres Strait Islander but not Aboriginal origin"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The modifier extension http://hl7.org.au/fhir/StructureDefinition/indigenous-status is not allowed to be used at this point (allowed = e:Patient; this element is [[Patient.gender, code])"

    Scenario: wrong context - child of Patient.birthDate
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-02.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is not present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient.birthDate"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "3"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.display" with value "Both Aboriginal and Torres Strait Islander origin"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The modifier extension http://hl7.org.au/fhir/StructureDefinition/indigenous-status is not allowed to be used at this point (allowed = e:Patient; this element is [[Patient.birthDate, date])"

  Rule: Extension has correct datatype: valueCoding

    Scenario: wrong datatype - valueString
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-03.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueString" with value "Both Aboriginal and Torres Strait Islander origin"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org.au/fhir/StructureDefinition/indigenous-status' definition allows for the types [Coding] but found type string"

    # 3 errors are raised all related to CodeableConcept
    Scenario: wrong datatype - valueCodeableConcept    # 
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-04.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.coding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.coding.code" with value "3"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.coding.display" with value "Both Aboriginal and Torres Strait Islander origin"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.text" with value "Both Aboriginal and Torres Strait Islander origin"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 3 errors"
      And the command should "fail" with output message "The Extension 'http://hl7.org.au/fhir/StructureDefinition/indigenous-status' definition allows for the types [Coding] but found type CodeableConcept"

  Rule: Extension has correct cardinality in Patient 0..1

    Scenario: wrong cardinality: 2 instances
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-05.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present "2" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:indigenousStatus: max allowed = 1, but found 2"

    Scenario: wrong cardinality: 5 instances
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-06.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present "5" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the command should "fail" with output message "*FAILURE*: 1 errors"
      And the command should "fail" with output message "Patient.extension:indigenousStatus: max allowed = 1, but found 5"

  Rule: required terminology https://healthterminologies.gov.au/fhir/ValueSet/australian-indigenous-status-1 
