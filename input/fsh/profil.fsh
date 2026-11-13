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
// Schritt 5: Euer Profil
//
// Die Kopfzeilen sind schon ausgefüllt. Für jede Anforderung aus dem
// Aufgabenblatt steht unten eine auskommentierte Zeile mit dem Element.
// Entfernt die // und ersetzt TODO_Regel durch die Regel, die ihr
// gewählt habt. Eine Anforderung kann auch mehrere Zeilen brauchen.
//
// Wichtig: Hier stehen Regeln für alle Allergien, z. B. "criticality MS".
// Einen Wert setzt ihr im Profil nur, wenn er für jede Allergie immer
// gilt (Wert fixieren). Werte, die nur für eine bestimmte Patientin
// gelten, z. B. criticality #high, gehören ins Beispiel (beispiele.fsh).
//
// Regeltypen:
//   Kardinalität   * element 1..1
//   Must Support   * element MS
//   Binding        * element from $ValueSet (required)
//   Typ            * element[x] only dateTime
//                  * element only Reference(CHCorePractitioner)
//   Wert           * element = #code
//
// Nach jeder Änderung lokal prüfen:  sushi build .
// =====================================================================

Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// Anforderung 1: nur Allergien gegen Arzneimittel
// "nur für Arzneimittel" -> genau eine Kategorie, Wert fixiert
* category 1..1 MS
* category = #medication

// Anforderung 2: klinischer Status
// "muss immer angegeben sein" -> Kardinalität 1..1 (Pflicht) und MS
* clinicalStatus 1..1 MS

// Anforderung 3: Codes aus der Schweizer Allergieliste ($ch-allergy-vs)
// "fehlt ein passender Code, trotzdem erfassen" -> extensible statt required
// (CH Core hat preferred, extensible ist stärker und damit erlaubt)
* code 1..1 MS
* code from $ch-allergy-vs (extensible)

// Anforderung 4: Kritikalität (wie gefährlich die Allergie ist)
// "für die Notfallstation wichtig" -> Pflicht und MS
* criticality 1..1 MS

// Anforderung 5: Beginn der Allergie
// "als Datum, manchmal nur das Alter" -> nur dateTime oder Age
* onset[x] MS
* onset[x] only dateTime or Age

// Anforderung 6: wer die Allergie erfasst hat
// "von einer Ärztin oder einem Arzt" -> Referenz einschränken
* recorder 1..1 MS
* recorder only Reference(CHCorePractitioner or CHCorePractitionerRole)

// Anforderung 7: Reaktionen (die Symptome einer Reaktion stehen in reaction.manifestation)
// "wenn bekannt" -> optional lassen, aber MS
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

// Invariante (steht schon in invarianten.fsh)
* obeys dg-allergy-1
