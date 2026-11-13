/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// =====================================================================
// Schritt 6: Beispiel
//
// Erstellt ein gültiges Beispiel zu eurem Profil. Patientin, Ärztin und
// Praxis gibt es schon (basis-beispiele.fsh). Entfernt die // und ersetzt
// die TODOs. Das Beispiel muss alle Regeln aus eurem Profil erfüllen,
// auch die Invariante: Ist die Allergie bestätigt (confirmed), braucht
// sie eine Reaktion.
// =====================================================================

Instance: PenicillinAllergieAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Penicillinallergie Anna Muster"
Description: "Bestätigte Penicillinallergie mit Urtikaria, erfasst von Dr. Keller in der Hausarztpraxis."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#confirmed
* code = $sct#91936005 "Allergy to penicillin (finding)"
* criticality = #high
* onsetAge = 30 'a' "Jahre"
* recorder = Reference(DrSaraKeller)
* reaction.manifestation = $sct#126485001 "Urticaria (disorder)"

Instance: HansruediBuenzli
InstanceOf: CHCorePatient
Usage: #example
Title: "Hansruedi Bünzli"
Description: "Beispielpatient nach CH Core Patient."
* name.family = "Bünzli"
* name.given = "Hansruedi"
* gender = #male
* birthDate = "1958-09-03"
* address.line = "Schrebergartenweg 7"
* address.city = "Uster"
* address.postalCode = "8610"
* address.country = "CH"

Instance: BenzylpenicillinAllergieHansruedi
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Verdacht auf Benzylpenicillinallergie Hansruedi Bünzli"
Description: "Unbestätigte Benzylpenicillinallergie ohne dokumentierte Reaktion. Zeigt, dass die Invariante nur bestätigte Allergien betrifft."
* patient = Reference(HansruediBuenzli)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#unconfirmed
* code = $sct#294499007 "Allergy to benzylpenicillin (finding)"
* criticality = #unable-to-assess
* onsetDateTime = "2019-06"
* recorder = Reference(DrSaraKellerPraxisAmPark)
