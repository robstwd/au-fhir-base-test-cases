Feature: HL7AU AU Base Patient profile: expected failures for invariant 'inv-pat-0'

 - Context: Patient (birthTime extension and birthDate)
 - Human: If present, birth time's date shall be the birth date
 - Expression: birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime').exists() implies birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime').value.toString().substring(0,10) = birthDate.toString()

As a verifier of HL7AU content
I want invariant 'inv-pat-0' to fail when expected to
In order to be assured of quality

Scenario: birthTime extension (with time) has different date to birthDate
    Given a test file named "test-cases/Patient/patient-inv-pat-0-fail-01.xml" exists
    * element "Patient.birthDate" has value "1978-09-12"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "1963-04-24T14:35:00-05:00"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "*FAILURE*: 1 errors"
    And "Error @ Patient" is raised with message "Rule inv-pat-0: 'If present, birth time's date shall be the birth date' Failed"

Scenario: birthTime extension (without time) has different date to birthDate
    Given a test file named "test-cases/Patient/patient-inv-pat-0-fail-02.xml" exists
    * element "Patient.birthDate" has value "2001-12-23"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "1963-04-24"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "*FAILURE*: 1 errors"
    And "Error @ Patient" is raised with message "Rule inv-pat-0: 'If present, birth time's date shall be the birth date' Failed"

Scenario: birthTime extension has full precision and birthDate has YYYY-MMM only
    Given a test file named "test-cases/Patient/patient-inv-pat-0-fail-03.xml" exists
    * element "Patient.birthDate" has value "2001-12"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "2001-12-24T14:35:00-05:00"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "*FAILURE*: 1 errors"
    And "Error @ Patient" is raised with message "Rule inv-pat-0: 'If present, birth time's date shall be the birth date' Failed"

Scenario: birthTime extension has full precision and birthDate has YYYY only
    Given a test file named "test-cases/Patient/patient-inv-pat-0-fail-04.xml" exists
    * element "Patient.birthDate" has value "2001"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "2001-12-24T14:35:00-05:00"
    When I run the validator command on this testfile against profile "au-patient"
    Then the output will include the result "*FAILURE*: 1 errors"
    And "Error @ Patient" is raised with message "Rule inv-pat-0: 'If present, birth time's date shall be the birth date' Failed"



