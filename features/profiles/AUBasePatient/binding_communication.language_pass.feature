Feature: HL7AU AU Base Patient profile: expected passes for binding on Patient.communication.language

 - Context in profile: Patient.communication.language (CodeableConcept)
 - Binding: https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2
 - Binding: extensible

As a verifier of HL7AU content
I want terminology binding on Patient.communication.language to pass when expected to
In order to be assured of quality

  Scenario: standard expected content, correct code and display from the ValueSet
    Given a test file named "test-cases/Patient/patient-tx-communication.language-pass-01.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" has value "urn:ietf:bcp:47"
    * element "Patient.communication.language.coding.code" has value "wbp"
    * element "Patient.communication.language.coding.display" has value "Warlpiri"
    * element "Patient.communication.language.text" is not present
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

  Scenario: standard expected content, another correct code and display from the ValueSet, with text
    Given a test file named "test-cases/Patient/patient-tx-communication.language-pass-02.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" has value "urn:ietf:bcp:47"
    * element "Patient.communication.language.coding.code" has value "nay"
    * element "Patient.communication.language.coding.display" has value "Narrinyeri"
    * element "Patient.communication.language.text" has value "Ngarrindjeri"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

  Scenario: given extensible, standard expected content, but from another system - pass with warning
    Given a test file named "test-cases/Patient/patient-tx-communication.language-pass-03.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" has value "http://snomed.info/sct"
    * element "Patient.communication.language.coding.code" has value "439314001"
    * element "Patient.communication.language.coding.display" has value "Central Khmer language"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
    And "Warning @ Patient.communication[0].language" is raised with message "None of the codings provided are in the value set 'Common Languages in Australia' (https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2|2.2.1), and a coding should come from this value set unless it has no suitable code (note that the validator cannot judge what is suitable) (codes = http://snomed.info/sct#439314001)"

  Scenario: all elements, another correct code and display from the ValueSet
    Given a test file named "test-cases/Patient/patient-tx-communication.language-pass-04.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" has value "urn:ietf:bcp:47"
    * element "Patient.communication.language.coding.version" has value "4.0.1"
    * element "Patient.communication.language.coding.code" has value "kdd"
    * element "Patient.communication.language.coding.display" has value "Yankunytjatjara"
    * element "Patient.communication.language.coding.userSelected" has value "true"
    * element "Patient.communication.language.text" has value "Yankunytjatjara"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"

  Scenario: bare minimum coding content, pass with warnings
    Given a test file named "test-cases/Patient/patient-tx-communication.language-pass-05.xml" exists
    * element "Patient.communication.language.coding" is present
    * element "Patient.communication.language.coding.system" is not present
    * element "Patient.communication.language.coding.version" is not present
    * element "Patient.communication.language.coding.code" has value "wbp"
    * element "Patient.communication.language.coding.display" is not present
    * element "Patient.communication.language.coding.userSelected" is not present
    * element "Patient.communication.language.text" is not present
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "Success: 0 errors"
    And "Warning @ Patient.communication[0].language" is raised with message "None of the codings provided are in the value set 'Common Languages in Australia' (https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2|2.2.1), and a coding should come from this value set unless it has no suitable code (note that the validator cannot judge what is suitable) (codes = null#wbp)"
    And "Warning @ Patient.communication[0].language.coding[0]" is raised with message "A code with no system has no defined meaning. A system should be provided"
