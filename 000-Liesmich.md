---
title: Technisch-Didaktisches Liesmich für das InstaHub-Skript
lang: de
numbersections: true
author: Reinhard Nitzsche
VersionODT: 0.2 (21.01.2020)
version: 0.2 (21.01.2020)
---

# Ziel

- Aus den MD-Dateien werden einsatzbereite ODT-, PDF- und EPUB-Dateien erstellt.
- EPUB kann als Moodle-Buch in Moodleimportiert werden
- Die vielfältigen Dateiformate bieten Raum für Differenzierungen und individuelle Entscheidungen der Lehrkraft.

# Ordner im Stammverzeichnis

- Abbildungen: Abbildungen, die im Skript und in Moodle verwendet werden in der Rohfassung bzw. im Quellformat
- Assets: Abbildungen, die in den MD-Dateien referenziert werden. Diese sind so skaliert, dass sie in EPUB, ODT und PDF einigermaßen vernünftig aussehen
- EPUB, ODT und PDF: In diese Ordner werden die konvertierten Dateien geschrieben. Der Inhalt wird also ohne Rückfrage überschrieben!
- Video: Screencasts zur Ergänzung  des Skriptes

# Dateien im Stammverzeichnis

- *.md: Die einzelnen Kapitel des Buches. Folgende Ausnahmen:

  - 000-Liesmich.md: Diese Datei
  - 00-Meta.md: Meta-Angaben, die in jede EPUB- und die Einzel-ODT-Dateien geschrieben werden sollen. Das YAML-Feld VersionODT soll denselben Wert wie das Feld date in 00-Titel.md enthalten. Es wird in der Fußzeile der ODT-Dateien als Feld eingefügt.
  - 00-Titel.md: Meta-Angaben, die in die Komplett-Dateien, aber nicht in die ODT-Dateien geschrieben werden sollen.

- instahub.css: CSS-Informationen, die in EPUB eingebettet werden, von vielen Readern aber offenbar nicht interpretiert werden.

- instahub.xml: Meta-Daten für EPUB. Ob die neben den YAML-Angaben noch nötig sind, habe ich nicht getestet. Kofler schreibt das aber so. (Vgl. Kofler: Markdown & Pandoc, 2. Auflage)

- InstaHubCover.png: Das Titelbild für das EBook

- instahubTemplate.odt: Die Vorlage, nach der die ODT-Dateien geschrieben werden. Laut Pandoc ist das kein Template, aber es funktioniert fast wie eines. Die Datei darf offenbar keine Bilder enthalten. Übernommen werden Seiteneinstellungen inkl. der Inhalte der Kopf- und Fußzeilen.

  Sie ist derzeit so eingerichtet, dass zwei A4-Seiten auf eine A4-Seite kopiert werden könnnen.

- makeall.bat: Eine Batch-Datei, die alle EPUB-, ODT- und PDF-Dateien erstellt.

  