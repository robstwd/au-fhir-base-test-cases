# AUBasePatient testing results

**Profile**: AU Base Patient

http://hl7.org.au/fhir/StructureDefinition/au-patient

|Element|Constraint type|Constraint|Tests|
| ------|---------------|----------|-----|
|Patient|invariant|[inv-pat-0](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-patient-definitions.html#Patient)|[![inv-pat-0 tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-inv-pat-0.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-inv-pat-0.yml)|
|Patient|extension|[birthPlace](http://hl7.org/fhir/R4/extension-patient-birthplace.html) (core)|[![birthPlace extension tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-birthPlace.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-birthPlace.yml)|
|Patient|extension|[indigenousStatus](http://hl7.org.au/fhir/StructureDefinition/indigenous-status)|[![indigenousStatusextension tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-indigenousStatus.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-indigenousStatus.yml)|
|Patient|extension|[closingTheGapRegistration](http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration)|[![closingTheGapRegistration tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-closingTheGapRegistration.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-closingTheGapRegistration.yml)|
|Patient|extension|[mothersMaidenName](http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName) (core)|[![mothersMaidenName extension tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-mothersMaidenName.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-mothersMaidenName.yml)|
|Patient|extension|[interpreterRequired](http://hl7.org/fhir/StructureDefinition/patient-interpreterRequired) (core)| |
|Patient|extension|[dateOfArrival](http://hl7.org.au/fhir/StructureDefinition/date-of-arrival)| |
|Patient|extension|[genderIdentity](http://hl7.org/fhir/StructureDefinition/patient-genderIdentity) (core)| |
|Patient.extension:genderIdentity|terminology|[Gender Identity Response ](https://healthterminologies.gov.au/fhir/ValueSet/gender-identity-response-1 ) (extensible)| |
|Patient.identifier|datatype|[AUIHI](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-ihi.html)| |
|Patient.identifier|datatype|[AUMedicareCardNumber](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-medicarecardnumber.html)| |
|Patient.identifier|datatype|[AUDVANumber](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-dvanumber.html)| |
|Patient.identifier|datatype|[AUHealthCareCardNumber](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-healthcarecardnumber.html)| |
|Patient.identifier|datatype|[AUPensionerConcessionCardNumber](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-pensionerconcessioncardnumber.html)| |
|Patient.identifier|datatype|[AUCwlthSeniorsHealthCardNumber](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-cwlthseniorshealthcardnumber.html)| |
|Patient.identifier|datatype|[AUMedicalRecordNumber](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-medicalrecordnumber.html)| |
|Patient.identifier|datatype|[AUInsuranceMemberNumber](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-insurancemembernumber.html)| |
|Patient.birthDate|extension|[accuracyIndicator](http://hl7.org.au/fhir/StructureDefinition/date-accuracy-indicator)| |
|Patient.birthDate|extension|[birthTime](http://hl7.org/fhir/StructureDefinition/patient-birthTime)| |
|Patient.deceasedDateTime|extension|[accuracyIndicator](http://hl7.org.au/fhir/StructureDefinition/date-accuracy-indicator)| |
|Patient.address|datatype|[AustralianAddress](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-address.html)| |
|Patient.communication.language|terminology|[Common Languages in Australia](https://healthterminologies.gov.au/fhir/ValueSet/common-languages-australia-2) (extensible)|[![communication.language binding tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-tx-communication.language.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-tx-communication.language.yml)|
