# Agent.md: Pik-ael Power BI Tools - ISS Tracker

## Aktuell Status

Projektet har slutfört den **initiala setup-fasen**. Grundläggande katalogstruktur, initiala filer, och dokumentationsmiljö (`mkdocs.yml`, `docs/index.md`) är på plats.

-   **Kataloger:** `src/`, `tests/`, `docs/`
-   **Källkod:** `src/ISSTracker.pq` (initial platshållare)
-   **Tester:** `tests/test_ISSTracker.pq` (initial platshållare)
-   **Beroenden:** `requirements.txt` (med `mkdocs`), `setup.sh`
-   **Dokumentation:** Grundläggande MkDocs-struktur är redo.
-   **Agent.md:** Denna fil är uppdaterad.

## Taktiska Mål & Nästa Steg

Fokus ligger nu på att implementera kärnfunktionaliteten för ISS-anslutningen enligt **Testdriven Utveckling (TDD)** och `roadmap.json` (Fas 2).

1.  **Skriv ett misslyckat test (TDD Steg 1):**
    *   I `tests/test_ISSTracker.pq`, definiera ett testfall för `ISSTracker.Contents()`.
    *   Testet ska initialt verifiera att den nuvarande platshållardatan returneras, och sedan anpassas för att förvänta sig den faktiska datastrukturen från API:et (två rader: latitud och longitud).
2.  **Implementera datalogiken (TDD Steg 2):**
    *   Modifiera `src/ISSTracker.pq` för att implementera logiken från `roadmap.json` (fas 2, steg 2.1):
        *   Hämta data från `http://api.open-notify.org/iss-now.json`.
        *   Parsea JSON och transformera till en tabell med kolumnerna "Egenskap" och "Värde".
3.  **Kör tester och refaktorera (TDD Steg 3):**
    *   Säkerställ att testet från steg 1 passerar.
    *   Refaktorera koden för tydlighet och underhållbarhet.
4.  **Uppdatera dokumentationen:**
    *   Skapa `docs/api_connection.md` för att beskriva anslutningens funktion, API-källa och datastruktur.
    *   Uppdatera `mkdocs.yml` och eventuellt `docs/index.md`.
5.  **Förbered för bygge och validering:**
    *   När ovanstående är klart är nästa steg enligt `roadmap.json` att bygga `.mez`-filen (Fas 3) och validera (Fas 4). Detta kommer att kräva användning av Power Query SDK-verktyg, troligtvis i VS Code.

## Viktiga Filer & Kontext

-   `README.md`: Övergripande projektprinciper och struktur.
-   `roadmap.json`: Detaljerad, maskinläsbar projektplan. **Använd M-koden från steg 2.1 i denna fil för implementeringen.**
-   `src/ISSTracker.pq`: Källkodsfil för anslutningen.
-   `tests/test_ISSTracker.pq`: Testfil.
-   `docs/`: Katalog för MkDocs-dokumentation.

## Instruktioner för AI-agent

-   **Följ TDD-principerna strikt.**
-   **Använd M-koden från `roadmap.json` (fas 2, steg 2.1, `parameters.content`) som grund för implementeringen i `src/ISSTracker.pq`.**
-   Uppdatera dokumentationen i `docs/` löpande med varje signifikant förändring.
-   Se till att `requirements.txt` och `setup.sh` hålls uppdaterade om nya beroenden introduceras (inte förväntat i denna fas).
-   Den nuvarande uppgiften är att skriva det misslyckade testet.
