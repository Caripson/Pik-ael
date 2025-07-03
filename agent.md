# Agent.md: Pik-ael Power BI Tools - ISS Tracker

## Aktuell Status

## Aktuell Status

Kärnfunktionaliteten för ISS Tracker-anslutningen (datahämtning och transformation i `src/ISSTracker.pq`) är implementerad och dokumenterad (`docs/api_connection.md`). Ändringarna har committats till grenen `feat/iss-tracker-core`.

-   **Källkod:** `src/ISSTracker.pq` innehåller logik för att hämta och bearbeta ISS-data.
-   **Tester:** `tests/test_ISSTracker.pq` innehåller konceptuella tester.
-   **Dokumentation:** Uppdaterad med anslutningsdetaljer.

## Taktiska Mål & Nästa Steg

Fokus ligger nu på att **förbereda projektet för bygge och driftsättning** så att en annan agent (eller mänsklig utvecklare) med tillgång till Power Query SDK kan slutföra Fas 3 (BUILD_AND_DEPLOY) och Fas 4 (END_TO_END_VALIDATION) från `roadmap.json`.

1.  **Hantera ikonfilsreferenser:**
    *   Skapa platshållare för de PNG-ikonfiler som refereras i `src/ISSTracker.pq` i en ny katalog `resources/icons/`.
    *   Uppdatera sökvägarna i `src/ISSTracker.pq` till dessa platshållare.
2.  **Skapa ett `build.sh` skript:**
    *   Innehåller kommenterade kommandon och instruktioner för att bygga `.mez`-filen med Power Query SDK, enligt `roadmap.json`.
3.  **Skapa en `.proj`-fils platshållare:**
    *   Skapa en minimal `ISSTracker.proj` fil, då `roadmap.json` refererar till den för bygget.
4.  **Uppdatera `README.md`:**
    *   Lägg till en sektion "Bygga Anslutningen" med instruktioner.
    *   Notera behovet av faktiska ikoner.

## Viktiga Filer & Kontext

-   `README.md`: Övergripande projektprinciper och struktur.
-   `roadmap.json`: Detaljerad projektplan. Fas 3 och 4 är nästa huvudsteg.
-   `src/ISSTracker.pq`: Källkodsfil för anslutningen.
-   `tests/test_ISSTracker.pq`: Testfil.
-   `docs/`: Katalog för MkDocs-dokumentation.
-   `build.sh` (ska skapas): Skript för att guida byggprocessen.
-   `ISSTracker.proj` (ska skapas): Platshållare för projektfil.
-   `resources/icons/` (ska skapas): Katalog för ikonfiler.

## Instruktioner för nästa AI-agent (eller utvecklare)

-   **Miljökrav:** För att slutföra Fas 3 och 4 i `roadmap.json` behöver du en miljö med:
    *   Microsoft Power BI Desktop.
    *   Visual Studio Code.
    *   Power Query SDK VS Code-tillägget installerat och konfigurerat.
-   **Byggprocess:**
    1.  Granska och eventuellt anpassa `build.sh`. Detta skript innehåller de kommandon som föreslås i `roadmap.json` för att bygga `.mez`-filen.
    2.  Ersätt platshållarikonerna i `resources/icons/` med faktiska PNG-filer (16x16, 20x20, 24x24, 32x32, 40x40, 48x48, 64x64 pixlar).
    3.  Kör byggkommandot från Power Query SDK (antingen manuellt i VS Code eller via `build.sh` om det anpassats för din miljö). Detta bör generera `ISSTracker.mez` i en `bin/`-katalog.
    4.  Följ instruktionerna i `build.sh` (och `roadmap.json` Fas 3.2) för att kopiera `.mez`-filen till din Power BI Desktop `Custom Connectors`-mapp.
-   **Validering:**
    1.  Utför stegen i `roadmap.json` Fas 4 (END_TO_END_VALIDATION) för att testa anslutningen inifrån Power BI Desktop.
-   **Den nuvarande (Jules) agentens uppgift:** Är att slutföra förberedelserna ovan (skapa ikonplatshållare, `build.sh`, `ISSTracker.proj` platshållare, och uppdatera `README.md`).
