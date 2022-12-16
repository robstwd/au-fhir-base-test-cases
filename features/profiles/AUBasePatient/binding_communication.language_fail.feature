Feature: HL7AU AU Base Patient profile: expected warnings for binding on Patient.communication.language

 - Context in profile: Patient.communication.language (CodeableConcept)
 - Binding: https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2
 - Binding: extensible

NOTE 
The binding is extensible therefore a failure specifically due to the terminology binding cannot be invoked, only warnings.
Errors can be raised due to Coding datatype malformation, but that is not the point of this feature

As a verifier of HL7AU content
I want terminology binding on Patient.communication.language to give warnings when expected to
In order to be assured of quality

  Scenario: Warning - code from another system eg SNOMED CT
    Given a test file named "test-cases/Patient/patient-tx-communication.language-fail-01.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" has value "http://snomed.info/sct"
    * element "Patient.communication.language.coding.code" has value "439314001"
    * element "Patient.communication.language.coding.display" has value "Central Khmer language"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
    And "Warning @ Patient.communication[0].language" is raised with message "None of the codings provided are in the value set 'Common Languages in Australia' (https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2|2.2.1), and a coding should come from this value set unless it has no suitable code (note that the validator cannot judge what is suitable) (codes = http://snomed.info/sct#439314001)"

  Scenario: Warning - code from BCP47 but unexpected display
    Given a test file named "test-cases/Patient/patient-tx-communication.language-fail-02.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" has value "urn:ietf:bcp:47"
    * element "Patient.communication.language.coding.code" has value "wbp"
    * element "Patient.communication.language.coding.display" has value "Central Khmer language"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
    And "Warning @ Patient.communication[0].language" is raised with message "The display \"Central Khmer language\" is not a valid display for the code {urn:ietf:bcp:47}wbp - should be one of ['Warlpiri'] (from http://tx.fhir.org/r4)"

  Scenario: Warning - no code provided, only text
    Given a test file named "test-cases/Patient/patient-tx-communication.language-fail-03.xml" exists
    * element "Patient.communication.language.coding" is not present
    * element "Patient.communication.language.text" has value "Spanish"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
    And "Warning @ Patient.communication[0].language" is raised with message "No code provided, and a code should be provided from the value set 'Common Languages in Australia' (https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2"

  Scenario: Warning - code that is not in BCP47
    Given a test file named "test-cases/Patient/patient-tx-communication.language-fail-04.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" has value "urn:ietf:bcp:47"
    * element "Patient.communication.language.coding.code" has value "439314001"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
    And "Warning @ Patient.communication[0].language" is raised with message "None of the codings provided are in the value set 'Common Languages in Australia' (https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2|2.2.1), and a coding should come from this value set unless it has no suitable code (note that the validator cannot judge what is suitable) (codes = urn:ietf:bcp:47#439314001)"
