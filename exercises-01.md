# Aufgaben

## Auswerten von Daten I

### Projektion

1. Wähle alle Einträge aus der Tabelle users aus.
2. Gib alle Benutzernamen (username) aus users aus.
3. Gib alle Benutzernamen (username) und echten Namen (name) aller Einträge aus users aus.
4. Gib die Wohnorte aller Mitglieder aus.

Expertenaufgabe: Gib alle Passwörter aus. Informiere dich [hier](https://de.wikipedia.org/wiki/Bcrypt), warum auch dein eigenes Passwort so komisch aussieht und warum das notwendig ist. 

#### ORDER BY

Um die Ergebnisse zu sortieren, kannst du an deine Anfrage den Befehl `ORDER BY` anfügen. `ASC` sorgt für eine ansteigende und `DESC` für eine absteigende Sortierung. [Hier](http://www.w3schools.com/sql/sql_orderby.asp) findest du eine ausführliche Erklärung.

1. Ordne die Mitglieder nach ihrem Benutzernamen in alphabetischer Reihenfolge.
2. Ordne die Mitglieder nach deren Größe. Das größte Mitglied soll die Liste anführen.
3. Kehre die Reihenfolge der Tabelle users um.

#### DISTINCT

Fügst du nach dem `SELECT` den Befehl `DISTINCT` ein, so wird jede Zeile nur einmal ausgegeben. Dies ist etwa praktisch, wenn du wissen möchtest, welche Arten von Büchern es gibt.

1. Gib jeden Wohnort nur einmal aus.
2. Gib jede Benutzerrolle nur einmal aus. Welche Benutzerrolle hat *admin*?

#### LIMIT

Wenn das Netzwerk sehr langsam ist dauert es eine Weile bis alle Mitglieder angezeigt werden. Um nur die ersten Einträge anzuzeigen, kannst du den `LIMIT` Befehl verwenden: 

```sql
SELECT username FROM users LIMIT 25
```

1. Zeige nur 3 Mitglieder an.
2. Zeige nur die 5 größten Mitglieder an.

#### MIN / MAX

Du suchst nur das Extreme? Dann hilft dir der `MAX` Befehl weiter:

```sql
SELECT MAX(centimeters) AS "Maximale Körpergröße:" FROM users
```

1. Zeige wie groß das kleinste  Mitglied ist.
2. Zeige wie alt als das älteste Mitglied ist.
3. Zeige an wann sich zuletzt ein Mitglied registriert hat.

#### COUNT

Mit `COUNT` kannst du die Einträge aus der Tabelle zählen: 

```sql
SELECT COUNT(*) AS "Registrierte Mitglieder" FROM users
```

1. Ermittle mithilfe des obigen Befehls, wie viele Mitglieder dein InstaHub hat.

#### GROUP BY

Wenn du nicht die gesamte Menge aller Mitglieder wissen möchtest, sondern die Anzahl etwas differenzierter haben möchtest, kannst du auch die Einträge bezogen auf eine gleiche Eigenschaft auszählen lassen:

```sql
SELECT city, COUNT(*) AS "Mitglieder je Stadt" FROM users GROUP BY city
```

1. Gib die Mitglieder je Stadt aus.
2. Prüfe, ob es Mitglieder gibt, die am gleichen Tag geboren wurden.

#### Übungen

1. Gib die Mitgliedernamen entgegen der alphabetischen Reihenfolge aus.
2. Gib die Namen der 3 Städte mit den meisten Mitgliedern aus.
3. Gib an, aus wie vielen Ländern die Mitglieder kommen.

#### Expertenaufgabe

Hilf mit den Unterricht zu gestalten und [reiche eigene Fragen ein](https://goo.gl/forms/xy29cLImYj4jrpFy1).

### Selektion (Auswahl)

*Hinweis: Einige Fragen lassen sich nicht unmittelbar als SQL-Satz umbauen. Schaue daher in der vollständigen Tabelle nach, wie die Informationen abgelegt sind.*

1. Wähle alle Einträge aus der Tabelle users aus, bei denen das Geschlecht (gender) weiblich (female) ist.
2. Wähle alle Mitglieder aus Deutschland aus.
3. Wähle alle Mitglieder aus, die in Leipzig wohnen.
4. Zeige nur *Emily Faber* an.
5. Wähle alle Mitglieder mit der Rolle *user* aus.
6. Ersetze in Aufgabe 5 `=` durch `!=`.
7. Notiere was `!=` bedeutet.

#### Größer und Kleiner

Neben dem bekannten `=` kannst du auch `<` und `>` verwenden, um Bereiche von Werten auszuwählen.

1. Gib alle Mitglieder aus, die unter 1,80 Meter groß sind.
2. Prüfe, ob es minderjährige Mitglieder gibt. (Beispiel `"2001-01-01"`)

#### Oder so ähnlich...

Nicht immer weiß man vollständig, was man sucht. Da hilft der `LIKE`-Befehl:

```sql
SELECT username FROM users WHERE username LIKE "ameli%"
```

1. Notiere dir anhand [dieser Erklärung](http://www.w3schools.com/Sql/sql_like.asp ), wie der `LIKE`-Befehl arbeitet.

2. Welche Mitglieder haben einen Benutzernamen mit einem a?
3. Von welchen Mitgliedern beginnt der Vorname mit einem B?
4. Welche Mitglieder haben keine Emailadresse bei *instahub.test*?

#### Übungen

1. Gib die Namen aller Berliner Mitglieder aus.
2. Wie viele Personen wohnen in München?
3. Gib die Nutzernamen aller Mitglieder an, die kleiner sind als du.
4. Gib die Stadtnamen aus, wo die meisten Mitglieder mit einem *a* im Namen wohnen.

#### Expertenaufgabe

Hilf mit den Unterricht zu gestalten und [reiche eigene Fragen ein](https://goo.gl/forms/xy29cLImYj4jrpFy1).

### Logische Operatoren

#### AND, OR, AND NOT

1. Erschließe dir anhand der nachfolgenden 3 Beispiele die Funktion der Operatoren `AND`, `OR`, `AND NOT`. Notiere dies.

```sql
SELECT username, city FROM users where city = "Berlin" AND name LIKE "Fabian%"
```
```sql
SELECT username, city FROM users where city = "Berlin" OR name LIKE "Fabian%"
```
```sql
SELECT username, city FROM users where city = "Berlin" AND NOT name LIKE "Fabian%"
```

2. Finde alle Berliner die *Marc* heißen.
3. Finde alle Leipziger Frauen.
4. Finde alle Linas und Lorenas. 
5. Sortiere alle Männer nach ihrer Körpergröße, welche mindestens 16 Jahre alt sind.
6. Zeige das Geburtsdatum und den Benutzernamen aller Frauen an, die kleiner als 1,60 Meter sind.
7. Wähle alle Felix aus, die nicht aus Berlin kommen. 

#### Expertenaufgabe

Hilf mit den Unterricht zu gestalten und [reiche eigene Fragen ein](https://goo.gl/forms/xy29cLImYj4jrpFy1).



#### Wechselwirkungen von Einschränkungen

Gesucht werden alle Berliner:

```sql
SELECT username, name FROM users where city = "Berlin" AND gender = "male" OR gender = "female"
```

1. Führe den Befehl aus und prüfe das Ergebnis, indem du die Abfrage ohne explizite Ausführung des Geschlechts erneut ausführst.

Wenn du mehr als 2 Bedingungen hast, ist es manchmal sinnvoll anzugeben, welche zuerst betrachtet werden müssen. Dazu kannst du Klammern verwenden:

```sql
SELECT username, name FROM users where city = "Berlin" AND (gender = "male" OR gender = "female")
```

2. Gib alle Männer aus Leipzig aus, die kleiner als 165 Zentimeter sind.
3. Die Bundeswehr sucht Rekruten. Gib die Namen aller Männer über 165cm und alle Frauen über 160cm aus.
4. Erna sucht eine Bekannte aus Berlin. Ihr Vorname war entweder *Bea* oder *Naomi*.