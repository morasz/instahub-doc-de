# Vertiefung Entity-Relationship-Modell 

## ER-Modelle besser verstehen

#### Aufgabe 10.1 ER-Diagramm beschreiben - Dienstwagen {-}

_Beschreiben_ Sie in eigenen Worten, was das folgende ER-Modell modelliert! 

![Mitarbeiter\*innen fahren Dienstwagen](assets/10-ER-Dienstwagen.png)

#### Aufgabe 10.2 ER-Diagramm interpretieren Mann und Frau {-}

_Beschreiben_ Sie in eigenen Worten, was das folgende ER-Modell modelliert. _Beurteilen_ Sie es! Berücksichtigen Sie dabei die deutsche Rechtsordnung und gesellschaftliche Erwartungen!

![Männer sind mit Frauen verheiratet](assets/10-ER-Mann-Frau.png)

##   Kardinalitäten verwenden

#### Aufgabe 10.3 Kardinalitäten festlegen{-}

_Notieren_ Sie in den folgenden ER-Diagrammen jeweils die Kardinalitäten!

![Männer sind Väter von Kindern](assets/10-ER-Kardinalitaet-Kind.png)

![Männer sind Geliebte von Frauen](assets/10-ER-Kardinalitaet-Geliebter.png)

![Personen sind Fans von Fußballvereinen](assets/10-ER-Kardinalitaet-Fussballverein.png)

![Personen sind bester Freunde von Personen](assets/10-ER-Kardinalitaet-Bester-Freund.png)

## Schlüssel

Alle Exemplare einer Entität müssen sich hinsichtlich ihrer Attribute unterscheiden. Es darf also keine zwei identischen Exemplare geben. 

Schlüssel sind Mengen von Attributen, die ein Exemplar einer Entität identifizieren, als eindeutig bestimmen.

Dabei werden die in der folgenden Abbildung ersichtlichen Schlüsselarten unterschieden:

![Schlüsselarten](assets/10-Schluessel.png)

Diese Schlüsselarten sehen wir uns an Hand eines Beispiels genauer an. Die folgende Abbildung zeigt einen Ausschnitt eines ERM für die Verwaltung einer Hochschule:

![ER-Modell einer Hochschulverwaltung (Ausschnitt)](assets/10-ERM-Student.png)

+ **Superschlüssel** (auch "Oberschlüssel") sind *alle* Attributmengen, die identifizierend sind, den\*die Studierende\*n also eindeutig bestimmen. Es gibt also fast immer mehrere Superschlüssel:

  + Da jedes Exemplar der Entität anders sein muss, ist die Menge aller Attribute schon mal ein (trivialer) Superschlüssel: {E-Mail, Vorname, Name, Geburtstag, Adresse, Sozialversicherungsnummer, Fach}
  + Streicht man das studierte Fach aus dem Superschlüssel, bleibt der Rest der Attribute identifizierend und damit Superschlüssel: {E-Mail, Vorname, Name, Geburtstag, Adresse, Sozialversicherungsnummer}
  + Auch die Adresse kann man aus dem Superschlüssel entfernen: {E-Mail, Vorname, Name, Geburtstag, Sozialversicherungsnummer}

+ Ein Superschlüssel, aus dem man kein Attribut mehr entfernen kann, ohne dass er kein Superschlüssel mehr wäre, heißt **Schlüsselkandidat**. In unserem Beispiel sind das:

  + {Vorname, Name, Geburtstag, Adresse}, wenn wir davon ausgehen, dass es bei großen Gebäuden unter derselben Adresse durchaus zwei Kevin Schulzes geben könne, die am selben Tag geboren wurden. Ein solcher Schlüssel, der aus mehreren Attributen zusammengesetzt ist, heißt **zusammengesetzer** Schlüssel.
  + {E-Mail-Adresse}, wenn wir davon ausgehen, dass jede\*r Studierende eine eigene E-Mail-Adresse verwendet.
  + {Sozialversicherungsnummer}, wenn wir davon ausgehen, dass jede\*r Studierende eine Sozialversicherungsnummer hat.

+ Aus der Menge der Schlüsselkandidaten sucht sicher der\*die Datenbankdesigner\*in einen aus, den er\*sie zum **Primärschlüssel** ernennt. Da man den Primärschlüssel auch mal eingeben muss, sind zusammengesetzte und lange Primärschlüssel meist ungünstig. Daher verwendet man häufig **künstliche Schlüssel**, bei denen das Attribut extra eingeführt wird, damit man ein identifizierendes Merkmal hat. Im deutschen Sozialversicherungssystem ist das die Sozialversicherungsnummer. In Hochschulen verwendet man oft eine so genannte *Matrikelnummer*, Unternehmen haben Kunden-, Lieferanten-, Rechnungs- und Materialnummern. 

  Im ERM wird der Primärschlüssel unterstrichen:

![ER-Modell einer Hochschule mit künstlichem Primärschlüssel](assets/10-ERM-Student-PK.png)

Im obigen Beispiel dient die gelbe Färbung des Attributes "Matrikelnummer" lediglich der Hervorhebung der Änderung. Das Datenbankdesign-Team hätte sich auch für  auch jeden der anderen Schlüsselkandidaten entscheiden können. Wobei der zusammengesetzte Schlüsse sehr umfangreich und damit unpraktisch gewesen wäre. Bei der E-Mail-Adresse dachte sich das Team, dass hier Tippfehler vorkommen werden und zur Sozialversicherungsnummer hatte das Immatrikulationsbüro gesagt, dass einige Studierenden vorher nicht in Deutschland gearbeitet haben und daher keine Sozialversicherungsnummer haben. 

Vielleich fragen Sie sich: "Wenn es Primärschlüssel gibt, gibt dann auch **Sekundärschlüssel**?". Die Antwort lautet "Ja". Sekundärschlüssel sind Attribute, die zum Suchen in der Datenbank verwendet werden. Sie sind nicht unabdingbar, aber für die Geschwindigkeit der Datenbank von hoher Bedeutung. Will man z. B. in einer Artikeldatenbank oft nach dem Gewicht der Artikel suchen, könnte man das Gewicht als Sekundärschlüssel deklarieren. Da es dabei "nur" um eine Verbesserung der Performanz geht, werden Sekundärschlüssel *nicht* im ERM notiert. Auch müssen sie Sekundärschlüssel in den meisten Datenbankmanagementsystemen nicht eindeutig sein. Sie sind also eigentlich keine Schlüssel. Der Begriff "Indizee" ist daher der bessere.

#### Aufgabe 10.4: Schlüssel in der Lohnbuchhaltung{-}

Für die Lohnbuchhaltung wurde das folgende ERM entworfen (Ausschnitt):

![Lohnbuchhaltung (Ausschnitt)](assets/10-ERM-Kunde.png)

1. *Ermitteln* Sie Oberschlüssel und Schlüsselkandidaten.
2. *Entscheiden* Sie sich *begründet* für einen der Schlüsselkandidaten als Primärschlüssel.

## ER-Modelle entwickeln

Die Umsetzung der in der realen Welt erkannten relevanten Objekte und Beziehungen in ein Datenbank-Schema erfolgt in mehreren Schritten:

1. **Bildung von Entities**: Wir müssen Einzelobjekte der realen Welt erkennen und zu Entitäten zusammenfassen. (Beispiel: Die Kollegen Fritz Maier und Paul Lehmann und viele weitere werden zur Entität „Angestellte“).

2. **Bestimmung der relevanten Attribute**: Wie jedes Modell ist auch ein ER-Modell (ERM) eine vereinfachte Abbildung der Wirklichkeit, daher werden nicht alle denkbaren Attribute in das ERM aufgenommen werden. (Beispiel: Die Hobbys eines Mitarbeiters sind im Betrieb in der Regel nicht relevant und werden nicht in das ERM aufgenommen.)

   In Aufgaben in diesem Skript wird oft gefordert, dass nur exemplarische Attribute angegeben werden. Dies dient dann der Arbeitsersparnis. Sie müssen dann bei einer Person nicht Name, Vorname, Geburtstag, Straße usw. angeben, sondern beschränken sich auf einige Beispielattribute.

3. **Bildung von Relationships**: Als nächstes müssen wir Einzelbeziehungen zwischen Objekten der realen Welt erkennen und sie zu Relationships zusammen fassen. 

   Beispiele: 

   + Der Angestellte Fritz Maier *ist Mitglied* des Qualitätszirkels. ⇒ Relationship 	„Angestellter ist Mitglied in Gremium“; 
   + Die Angestellte Paulinna 	Lehmann *leitet* das Projekt „Verbesserung des 	Betriebsklimas.“ ⇒ Relationship 	„Ist Projektleiter“). 

   Ergänzen Sie hier auch die Kardinalitäten!


### Aufgabe 10.5 Buchempfehlung {-}

Für eine Volkshochschule soll ein ER-Modell entwickelt werden, dass die folgenden Anforderungen erfüllt:

> Wir haben verschiedene Kurse. Jeder Kurs wird von ein bis zwei Dozenten\*innen geleitet.
>
> Die Dozenten\*innen geben für jeden ihrer Kurse maximal fünf empfohlene Bücher an.

_Entwickeln_ Sie das geforderte ER-Modell! (Tipp: Sie benötigen drei Entitäten und zwei Relationships.) Beschränken Sie sich bitte jeweils auf fünf exemplarische Attribute. 

### Aufgabe 10.6 Laufeventmanager {-}

Sie sind Mitarbeiter/in einer eines Softwarehauses und dort u.a. für Datenbanken zuständig. Ihr Unternehmen will ein Content-Management-System zur Verwaltung von Laufsportveranstaltungen entwickeln. Es liegt folgende Beschreibung vor:

> Es gibt verschiedene Laufveranstaltungen. Z. B. den Quentiner Stadtlauf des TSV Quentin. Derselbe Veranstalter bietet manchmal aber auch verschiedene Laufveranstaltungen an. So veranstaltet der TSV Quentin auch den Quentiner Adventslauf. 
>
> Bei vielen Laufveranstaltungen werden mehrere Distanzen angeboten, z. B. 3, 5 und 10 km, (Halb-)Marathon usw. Es gibt Läufer\*innen, die bei einer Veranstaltung mehrere Distanzen absolvieren.
>
> Für jede Distanz erhält jede\*r Läufer\*in eine Startnummer. Innerhalb der Veranstaltung ist diese Startnummer eindeutig. Die Läufer\*innen melden sich zuvor für bestimme Veranstaltungen und Distanzen an. Die Startnummern werden nicht sofort vergeben, sondern erst, wenn das Startgeld eingegangen ist und der Anmeldeschluss abgelaufen ist. 
>
> Die gelaufene Zeit wird gemessen und in die Datenbank eingetragen, um Urkunden und Bestenlisten erstellen zu können. Dabei muss unterschieden werden können, ob ein\*e Läufer\*in ins Ziel gekommen ist, gestartet aber nicht angekommen ist oder gar nicht erst gestartet ist.
>
> Dabei erfolgt die Auswertung getrennt nach Geschlechtern und Altersklassen. So gibt es z. B. eine Altersklasse "M90", in der alle männlichen Senioren zwischen 84 und 90 Jahren zusammengefasst sind. In der Altersklasse "W30" sind alle weiblichen Seniorinnen (die heißen wirklich so!) zwischen 26 und 30 Jahren  zusammengefasst. 

1. _Finden_ Sie die nötigen Entitäten für den Laufeventmanager! (Tipp: 5 Entitäten werden es schon sein müssen.)
2. _Bestimmen_ Sie relevante (exemplarische) Attribute!
3. _Verbinden_ Sie die Entitäten durch passende Relationships!

