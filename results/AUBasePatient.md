# AUBasePatient testing results

**Profile**: AU Base Patient

http://hl7.org.au/fhir/StructureDefinition/au-patient

|Element|Constraint type|Constraint|Tests|
| ------|---------------|----------|-----|
|Patient|invariant|[inv-pat-0](https://build.fhir.org/ig/hl7au/au-fhir-base/StructureDefinition-au-patient-definitions.html#Patient)|[![inv-pat-0 tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-inv-pat-0.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-inv-pat-0.yml)|
|Patient|extension|[birthPlace](http://hl7.org/fhir/R4/extension-patient-birthplace.html) (core)|[![birthPlace extension tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-birthPlace.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-birthPlace.yml)|
|Patient|extension|[indigenousStatus](http://hl7.org.au/fhir/StructureDefinition/indigenous-status)|[![indigenousStatusextension tests](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-indigenousStatus.yml/badge.svg)](https://github.com/robstwd/au-fhir-base-test-cases/actions/workflows/AUBasePatient-validation-ext-indigenousStatus.yml)|
|Patient|extension|[closingTheGapRegistration](http://hl7.org.au/fhir/StructureDefinition/closing-the-gap-registration)| |
|Patient|extension|[mothersMaidenName](http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName) (core)| |
|Patient|extension|[interpreterRequired](http://hl7.org/fhir/StructureDefinition/patient-interpreterRequired) (core)| |
|Patient|extension|[dateOfArrival](http://hl7.org.au/fhir/StructureDefinition/date-of-arrival)| |
|Patient.birthDate|extension|[accuracyIndicator](http://hl7.org.au/fhir/StructureDefinition/date-accuracy-indicator)| |
|Patient.deceasedDateTime|extension|[accuracyIndicator](http://hl7.org.au/fhir/StructureDefinition/date-accuracy-indicator)| |
