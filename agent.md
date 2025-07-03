# Agent.md: Pik-ael Power BI Tools - ISS Tracker

## Aktuell Status (Efter Jules Agentkörning)

Kärnfunktionaliteten för ISS Tracker-anslutningen (datahämtning och transformation i `src/ISSTracker.pq`) är implementerad och har verifierats vara i gott skick. De nödvändiga förberedelserna för bygge, såsom ikonplatshållare, `build.sh`-skript, och `ISSTracker.proj`-fil, var redan på plats.

-   **Källkod (`src/ISSTracker.pq`):** Logik för att hämta och bearbeta ISS-data är komplett och korrekt. Inga ändringar behövdes i denna körning.
-   **Tester (`tests/test_ISSTracker.pq`):** Testfilen har justerats. Ett utdaterat test (`TestPlaceholderImplementation`) har tagits bort, och det primära testet (`TestActualDataStructure`) har förbättrats med tydligare kommentarer, mer robusta kontroller för kolumnnamn och nya kontroller för datatyper i de returnerade kolumnerna. Dessa tester fokuserar på att validera M-kodens syntax och den förväntade output-strukturen.
-   **Dokumentation (`docs/`):** `docs/index.md` har uppdaterats för att reflektera den aktuella projektstatusen och förtydliga teststrategin. `docs/api_connection.md` var redan korrekt.
-   **Förberedelser för bygge:**
    *   Ikonfiler (platshållare) i `resources/icons/` och deras referenser i `src/ISSTracker.pq` är korrekta.
    *   `build.sh` finns och innehåller instruktioner för byggprocessen.
    *   `ISSTracker.proj` finns.
    *   `README.md` innehåller redan en sektion om hur man bygger anslutningen.

## Taktiska Mål & Nästa Steg

Projektet är nu fullständigt förberett för att en utvecklare eller en annan AI-agent med tillgång till rätt miljö ska kunna bygga `.mez`-filen och utföra end-to-end validering.

Fokus ligger på att slutföra Fas 3 (BUILD_AND_DEPLOY) och Fas 4 (END_TO_END_VALIDATION) från `roadmap.json`.

## Viktiga Filer & Kontext

-   `README.md`: Övergripande projektprinciper och struktur. Innehåller bygg- och installationsinstruktioner.
-   `roadmap.json`: Detaljerad projektplan. Fas 3 och 4 är nästa huvudsteg.
-   `src/ISSTracker.pq`: Källkodsfil för anslutningen (verifierad och komplett).
-   `tests/test_ISSTracker.pq`: Testfil (justerad och förbättrad).
-   `docs/`: Katalog för MkDocs-dokumentation (uppdaterad).
-   `build.sh`: Skript som guidar byggprocessen (finns).
-   `ISSTracker.proj`: Projektfil för Power Query SDK (finns).
-   `resources/icons/`: Katalog med ikonplatshållare (finns).

## Instruktioner för nästa AI-agent (eller utvecklare)

Nästa steg är att **bygga, driftsätta och validera** anslutningen.

-   **Miljökrav:** För att slutföra Fas 3 och 4 i `roadmap.json` behöver du en miljö med:
    *   Microsoft Power BI Desktop.
    *   Visual Studio Code.
    *   Power Query SDK VS Code-tillägget installerat och konfigurerat.
-   **Byggprocess:**
    1.  Granska och eventuellt anpassa `build.sh`. Detta skript innehåller de kommandon som föreslås i `roadmap.json` för att bygga `.mez`-filen.
    2.  **VIKTIGT:** Ersätt platshållarikonerna i `resources/icons/` med faktiska PNG-filer i de specificerade storlekarna (16x16, 20x20, 24x24, 32x32, 40x40, 48x48, 64x64 pixlar) för att anslutningen ska visas korrekt i Power BI.
    3.  Kör byggkommandot från Power Query SDK (antingen manuellt i VS Code genom att högerklicka på `ISSTracker.proj` och välja "Build Connector Project", eller via `build.sh` om det anpassats för din miljö). Detta bör generera `ISSTracker.mez` i en `bin/`-katalog (t.ex. `bin/AnyCPU/Debug/ISSTracker.mez`).
    4.  Följ instruktionerna i `README.md` (sektionen "Användning") och `build.sh` (eller `roadmap.json` Fas 3.2) för att kopiera `.mez`-filen till din Power BI Desktop `Custom Connectors`-mapp. Kom ihåg att justera säkerhetsinställningarna i Power BI Desktop för att tillåta anpassade anslutningar.
-   **Validering:**
    1.  Starta om Power BI Desktop.
    2.  Utför stegen i `roadmap.json` Fas 4 (END_TO_END_VALIDATION) för att testa anslutningen inifrån Power BI Desktop. Detta innebär att du försöker hämta data med "ISS Position Tracker"-anslutningen och verifierar att datan laddas korrekt.

Det tidigare målet för "Jules"-agenten (att förbereda filer som `build.sh`, ikoner etc.) var redan uppfyllt. Denna körning har istället fokuserat på att verifiera och finjustera källkoden, testerna och dokumentationen för att säkerställa att projektet är i ett gott skick för de faktiska bygg- och valideringsstegen.
