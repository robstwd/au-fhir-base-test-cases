Feature: HL7AU AU Base Patient profile: expected passes for extension 'Patient.mothersMaidenName'

 - Context in profile: Patient
 - Context in extension definition: Patient
 - url: http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName
 - datatype: string

As a verifier of HL7AU content
I want extension 'Patient.mothersMaidenName' to pass when expected to
In order to be assured of quality

Scenario: correct context, simple expected content
    Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-pass-01.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Patient"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" has child element "valueString" with value "Jingleheimer"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: correct context, large content
    Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-pass-02.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Patient"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" has child element "valueString" with value "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: correct context, minimal content
    Given a test file named "test-cases/Patient/patient-ext-mothersMaidenName-pass-03.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" is present in node "Patient"
    * extension "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName" has child element "valueString" with value "t"
    When I run the validator command on this testfile against profile "au-patient"
    Then the command should "succeed" with output message "Success: 0 errors"
