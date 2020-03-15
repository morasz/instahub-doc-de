@REM Projekt "Skript für InstaHub"
@REM Make-File für die Erstellung von EPUB- und ODT-Dateien aus MD-Dateien
@REM NIT 09.07.19
@CLS            
@ECHO ***
@ECHO *** Generiere EPUB...
@ECHO ***
@REM Alle Dateien manuell in der richtigen Reihenfolge einbinden. Exporttyp angeben. 
@REM Metadaten aus XML-Datei einbinden. Deckblatt und CSS einbinden.
@REM Nummerierte Überschriften
@REM Ausgabedatei angeben.
pandoc "00-TITLE.md" "00-META.md" "01-Vorwort.md" "02-Einstimmung.md" "03-Erste-Schritte.md" "04-Suchmaske.md" "05-Einfache-SQL-Abfragen.md"  "06-SQL-Abfragen-mit-einer-Tabelle.md"  "07-Daten-aendern.md" "08-Passwoerter-speichern.md" "09-Tabellen-erstellen.md" "10-ERM.md" "11-JOIN.md" "12-komplexe-SQL-Abfragen.md" "13-komplexe-CRUD-Befehle.md" "14-Big-Data.md" "15-Datenschutz.md" "16-Normalisierung.md" "17-ERM2Tabelle.md" "18-ERM-entwickeln.md" "19-Top-10.md" "20-SQL-CheatSheet.md" -t epub3 --epub-metadata instahub.xml --epub-cover-image instahubcover.png --css instahub.css --number-sections -o .\EPUB\instahub.epub 

@ECHO.
@ECHO ***
@ECHO *** Generiere gesamtes ODT ...
@ECHO ***
@REM Alle Dateien manuell in der richtigen Reihenfolge einbinden. Exporttyp angeben. 
@REM Referenzdatei angeben, laut pandoc ist das kein Template. Ich nenne es aber so.
@REM Nummerierte Überschriften
@REM Inhaltsverzeichnis einfügen
@REM Ausgabedatei angeben.
pandoc "00-TITLE.md" "00-META.md" "01-Vorwort.md" "02-Einstimmung.md" "03-Erste-Schritte.md" "04-Suchmaske.md" "05-Einfache-SQL-Abfragen.md"  "06-SQL-Abfragen-mit-einer-Tabelle.md"  "07-Daten-aendern.md" "08-Passwoerter-speichern.md" "09-Tabellen-erstellen.md" "10-ERM.md" "11-JOIN.md" "12-komplexe-SQL-Abfragen.md" "13-komplexe-CRUD-Befehle.md" "14-Big-Data.md" "15-Datenschutz.md" "16-Normalisierung.md" "17-ERM2Tabelle.md" "18-ERM-entwickeln.md" "19-Top-10.md"  "20-SQL-CheatSheet.md" --reference-doc instahubtemplate.odt --number-sections --toc -t ODT -o .\ODT\instahub.odt

@ECHO.
@ECHO ***
@ECHO *** Generiere je Kapitel einzelnes ODT ...
@ECHO ***
FOR %%I IN (*.md) DO pandoc  "00-META.md" "%%I"  --reference-doc instahubtemplate.odt -t ODT -o ".\ODT\%%~nI.odt"

@ECHO.
@ECHO ***
@ECHO *** Generiere je Kapitel einzelnes PDF via Libre Offfice ...
@ECHO ***
@REM Libre Office konvertiert alle Dateien in PDF, k.A. wozu --headless da ist. Geht sonst nicht
FOR %%I IN (ODT\*.odt) DO "C:\Program Files\LibreOffice\program\soffice"  --headless --convert-to pdf:writer_pdf_Export --outdir .\PDF "%%I"
@PAUSE
