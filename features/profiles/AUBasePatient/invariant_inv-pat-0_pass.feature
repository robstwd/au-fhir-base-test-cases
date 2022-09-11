Feature: HL7AU AU Base Patient profile: expected passws for invariant 'inv-pat-0'

 - Context: Patient (birthTime extension and birthDate)
 - Human: If present, birth time's date shall be the birth date
 - Expression: birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime').exists() implies birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime').value.toString().substring(0,10) = birthDate.toString()

As a verifier of HL7AU content
I want invariant 'inv-pat-0' to pass when expected to
In order to be assured of quality

Scenario: birthTime extension is not present
    Given a test file named "test-cases/Patient/patient-inv-pat-0-pass-01.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" is not present
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: birthTime extension has same date as birthDate, birthTime has time
    Given a test file named "test-cases/Patient/patient-inv-pat-0-pass-02.xml" exists
    * element "Patient.birthDate" has value "1978-09-12"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "1978-09-12T14:35:45-05:00"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: birthTime extension has same date as birthDate, birthTime has only date
    Given a test file named "test-cases/Patient/patient-inv-pat-0-pass-03.xml" exists
    * element "Patient.birthDate" has value "1963-04-24"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "1963-04-24"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: birthTime extension and birthDate have same YYYY-MM
    Given a test file named "test-cases/Patient/patient-inv-pat-0-pass-04.xml" exists
    * element "Patient.birthDate" has value "1963-04"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "1963-04"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: birthTime extension and birthDate have same YYYY
    Given a test file named "test-cases/Patient/patient-inv-pat-0-pass-05.xml" exists
    * element "Patient.birthDate" has value "1963"
    * valueDateTime extension "http://hl7.org/fhir/StructureDefinition/patient-birthTime" has value "1963"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"
