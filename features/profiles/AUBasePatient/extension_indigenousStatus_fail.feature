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
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.gender" is raised with message "The modifier extension http://hl7.org.au/fhir/StructureDefinition/indigenous-status is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.gender, code])"

    Scenario: wrong context - child of Patient.birthDate
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-02.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is not present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient.birthDate"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "3"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.display" with value "Both Aboriginal and Torres Strait Islander origin"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.birthDate" is raised with message "The modifier extension http://hl7.org.au/fhir/StructureDefinition/indigenous-status is not allowed to be used at this point (allowed = e:Patient; this element is [Patient.birthDate, date])"

  Rule: Extension has correct datatype: valueCoding

    Scenario: wrong datatype - valueString
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-03.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueString" with value "Both Aboriginal and Torres Strait Islander origin"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.extension" is raised with message "The Extension 'http://hl7.org.au/fhir/StructureDefinition/indigenous-status' definition allows for the types [Coding] but found type string"

    Scenario: wrong datatype - valueCodeableConcept
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-04.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.coding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.coding.code" with value "3"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.coding.display" with value "Both Aboriginal and Torres Strait Islander origin"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCodeableConcept.text" with value "Both Aboriginal and Torres Strait Islander origin"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 3 errors"
      And "Error @ Patient.extension[0].value.ofType(CodeableConcept).coding[0]" is raised with message "This element is not allowed by the profile http://hl7.org/fhir/StructureDefinition/Coding|4.0.1"
      And "Error @ Patient.extension[0].value.ofType(CodeableConcept).text" is raised with message "This element is not allowed by the profile http://hl7.org/fhir/StructureDefinition/Coding|4.0.1"
      And "Error @ Patient.extension" is raised with message "The Extension 'http://hl7.org.au/fhir/StructureDefinition/indigenous-status' definition allows for the types [Coding] but found type CodeableConcept"

  Rule: Extension has correct cardinality in Patient 0..1

    Scenario: wrong cardinality: 2 instances
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-05.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present "2" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient" is raised with message "Patient.extension:indigenousStatus: max allowed = 1, but found 2"

    Scenario: wrong cardinality: 5 instances
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-06.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present "5" times in parent node "Patient"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient" is raised with message "Patient.extension:indigenousStatus: max allowed = 1, but found 5"

  Rule: required terminology https://healthterminologies.gov.au/fhir/ValueSet/australian-indigenous-status-1 

    @ncts
    Scenario: correct system but code is not member of system
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-07.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "017"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.extension[0].value.ofType(Coding)" is raised with message "Unknown Code https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1#017 in https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"

    @ncts
    Scenario: correct system and code, but display is wrong - invokes warning only
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-08.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "1"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.display" with value "Unspecified"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "Success: 0 errors"
      And "Warning @ Patient.extension[0].value.ofType(Coding)" is raised with message "Display Name for https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1#1 should be one of 1 choices from 'Aboriginal but not Torres Strait Islander origin', not 'Unspecified' for 'https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"

    @ncts
    Scenario: incorrect system, with code as a member of that system
      Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-fail-09.xml" exists
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "http://hl7.org/fhir/administrative-gender"
      * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "male"
      When I run the validator command on this testfile against profile "au-patient"
      Then the output will include the result "*FAILURE*: 1 errors"
      And "Error @ Patient.extension[0].value.ofType(Coding)" is raised with message "The Coding provided (http://hl7.org/fhir/administrative-gender#male) is not in the value set 'Australian Indigenous Status' (https://healthterminologies.gov.au/fhir/ValueSet/australian-indigenous-status-1|0.0.1), and a code is required from this value set.  (error message = Not in value set https://healthterminologies.gov.au/fhir/ValueSet/australian-indigenous-status-1)"