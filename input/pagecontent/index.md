### Use Case

Eine Hausarztpraxis erfasst die Arzneimittelallergien ihrer Patientinnen und Patienten
strukturiert und mit Codes aus der Schweizer Allergieliste. Kommt eine Patientin auf eine
Notfallstation, kann diese die Allergien zuverlässig auswerten, insbesondere wie gefährlich
sie sind und welche Reaktionen bekannt sind.

### Scope

Dieses IG umfasst ein Profil für Allergien gegen Arzneimittel auf Basis von
CH Core AllergyIntolerance sowie ein Beispiel. Nicht abgedeckt sind Allergien gegen
Nahrungsmittel, Umweltstoffe oder biologische Stoffe, Unverträglichkeiten ohne
allergischen Mechanismus sowie der Austausch der Daten (z. B. Dokumente oder Schnittstellen).

### Artefakte

* [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html): Profil für
  Arzneimittelallergien mit Pflichtangaben zu klinischem Status, Code, Kritikalität und
  erfassender Ärztin bzw. erfassendem Arzt.
* [Penicillinallergie Anna Muster](AllergyIntolerance-PenicillinAllergieAnna.html):
  Bestätigte Penicillinallergie mit hoher Kritikalität und Urtikaria als Reaktion.

### Abhängigkeiten

Dieses IG baut auf [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/) auf.

### Autor

Tobias Stuber

<p style="font-size:smaller">Erstellt im Lab des Moduls Data Standards in Healthcare, ZHAW, HS26. Kein offizieller Standard.</p>
