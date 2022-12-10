
Feature: HL7AU AU Base Patient profile: expected passes for extension 'Australian Indigenous Status'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org.au/fhir/StructureDefinition/indigenous-status
 - datatype: Coding

As a verifier of HL7AU content
I want extension 'Australian Indigenous Status' to pass when expected to
In order to be assured of quality

Scenario: correct context, minimal child elements - only system
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-01.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.version"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.code"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.display"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.userSelected"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: correct context, minimal child elements - only version
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-02.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.system"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.version" with value "1.0.2"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.code"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.display"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.userSelected"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: correct context, minimal child elements - only code
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-03.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.system"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.version"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "1"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.display"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.userSelected"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: correct context, minimal child elements - only display
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-04.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.system"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.version"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.code"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.display" with value "Aboriginal but not Torres Strait Islander origin"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.userSelected"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: correct context, minimal child elements - only userSelected
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-05.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.system"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.version"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.code"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.display"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.userSelected" with value "true"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: correct context, typical content
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-06.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.version"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "2"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.display" with value "Torres Strait Islander but not Aboriginal origin"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" does not have child element "valueCoding.userSelected"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: correct context, maximal content
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-07.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is present in node "Patient"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.system" with value "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.version" with value "1.0.2"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.code" with value "9"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.display" with value "Not stated/inadequately described"
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" has child element "valueCoding.userSelected" with value "false"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

Scenario: as it optional, the extension is not present
    Given a test file named "test-cases/Patient/patient-ext-indigenousStatus-pass-08.xml" exists
    * extension "http://hl7.org.au/fhir/StructureDefinition/indigenous-status" is not present
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
