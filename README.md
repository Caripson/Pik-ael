# Pik-ael Power BI Tools

Välkommen till Pik-ael! Detta repository är dedikerat till att bygga robusta och intelligenta verktyg för Microsoft Power BI. Vårt första projekt är en anpassad anslutning för att spåra den Internationella Rymdstationen (ISS).

Projektet utvecklas strikt enligt TDD-principer med kontinuerlig dokumentation och är designat för AI-assisterad utveckling via en `agent.md`-specifikation och en `roadmap.json`-fil.

---

## Kärnprinciper & Arbetsflöde

Detta projekt följer en uppsättning strikta regler för att säkerställa hög kodkvalitet, reproducerbarhet och effektivt samarbete mellan mänskliga utvecklare och AI-agenter. **Alla bidrag måste följa dessa principer.**

### 1. Testdriven Utveckling (TDD)
All funktionell kod måste verifieras genom automatiserade tester. Arbetsflödet är som följer:
1.  **Skriv ett misslyckat test:** Identifiera en ny funktion eller buggfix och skriv ett test som verifierar den. Detta test måste initialt misslyckas.
2.  **Skriv koden:** Skriv den minimala mängd kod som krävs för att testet ska lyckas.
3.  **Refaktorera:** Städa upp och förbättra koden med bibehållen funktionalitet (alla tester måste fortfarande passera).

Ingen produktionskod får läggas till i `main`-branchen utan motsvarande tester.

### 2. Kontinuerlig Dokumentation med MkDocs
Dokumentation är inte en eftertanke, utan en integrerad del av utvecklingsprocessen.
- **Krav:** Varje `commit` som introducerar en förändring (ny funktion, refaktorering, beroendejustering) måste åtföljas av en uppdatering i `docs/`-katalogen.
- **Verktyg:** Vi använder [MkDocs](https://www.mkdocs.org/) för att generera en statisk webbplats från Markdown-filerna i `docs/`.
- **Innehåll:** Dokumentera arkitekturbeslut, funktionalitet, och hur man använder nya funktioner.

### 3. Strikt Miljöhantering
Utvecklingsmiljön måste vara 100% reproducerbar.
- **`setup.sh` / `requirements.txt`:** All extern mjukvara, bibliotek och beroenden som krävs för att bygga, testa och köra projektet ska definieras i ett `setup.sh`-skript (för verktyg) eller en `requirements.txt`-fil (för Python-bibliotek etc.).
- **Uppdateringsplikt:** Om ett nytt bibliotek läggs till eller en version ändras, **måste** dessa filer uppdateras och inkluderas i samma `commit` som koden som kräver förändringen.

### 4. AI-samverkan via `agent.md`
För att underlätta för AI-agenter att förstå, analysera och bidra till projektet, underhåller vi en `agent.md`-fil.
- **Syfte:** Denna fil innehåller en maskinläsbar specifikation av projektets **nuvarande status, taktiska mål och nästa omedelbara uppgifter**. Den fungerar som en primär kontextkälla för AI-agenter.
- **Underhåll:** Om `agent.md` inte finns eller är utdaterad, är den första uppgiften för en AI-agent att skapa eller uppdatera filen baserat på en analys av `roadmap.json` och den existerande kodbasen.

### 5. Maskinläsbar Roadmap (`roadmap.json`)
Projektets strategiska plan definieras i en strukturerad `roadmap.json`-fil.
- **Syfte:** Filen specificerar hela projektets livscykel i ett JSON-format. Den definierar faser, mål, steg, artefakter och valideringskriterier. Detta är den auktoritativa källan för "vad" som ska byggas.
- **Användning:** AI-agenter använder denna fil för att exekvera den övergripande planen, medan mänskliga utvecklare använder den för att få en klar och entydig överblick över projektets scope och status.
- **Underhåll:** Roadmappen uppdateras vid större strategiska förändringar i projektets mål eller fasindelning.

## Projektstruktur (Rekommenderad)

En snabb överblick över viktiga filer och kataloger i projektet.

/
├── .vscode/          # Inställningar för VS Code
├── docs/             # Dokumentation för MkDocs
├── src/              # Källkod för anslutningen (t.ex. ISSTracker.pq)
├── tests/            # Automatiserade tester
├── agent.md          # Taktiska instruktioner och status för AI-agenter
├── roadmap.json      # Strategisk, maskinläsbar projektplan
├── requirements.txt  # Python-beroenden
├── setup.sh          # Skript för att sätta upp miljön
└── README.md         # Denna fil


## Komma igång

1.  **Klona repositoryt:**
    ```bash
    git clone [https://github.com/Caripson/Pik-ael.git](https://github.com/Caripson/Pik-ael.git)
    cd Pik-ael
    ```

2.  **Sätt upp miljön:**
    Kör setup-skriptet för att installera alla nödvändiga verktyg och beroenden.
    ```bash
    ./setup.sh
    ```

3.  **Kör testerna (Konceptuellt för M-kod):**
    Verifiera att allt är korrekt installerat. För M-koden i `src/` och `tests/`, sker testning och validering typiskt inuti Visual Studio Code med Power Query SDK-tillägget. Se `tests/test_ISSTracker.pq` för testdefinitioner.

## Bygga Anslutningen (`.mez`-filen)

För att bygga `.mez`-filen för anslutningen behöver du ha följande installerat och konfigurerat:
-   Visual Studio Code
-   Power Query SDK VS Code-tillägget

Projektet innehåller ett hjälpskript `build.sh` som guidar dig genom stegen, men den faktiska byggnationen sker via Power Query SDK-funktionerna i VS Code.

1.  **Förbered Ikoner:**
    *   Projektet refererar till ett antal ikonfiler i `resources/icons/` (t.ex. `ISSTracker16.png`, `ISSTracker32.png`, etc.). Platshållarfiler har skapats.
    *   **Du måste ersätta dessa platshållare med faktiska PNG-ikonfiler** i de specificerade storlekarna (16x16, 20x20, 24x24, 32x32, 40x40, 48x48, 64x64 pixlar) för att anslutningen ska visas korrekt i Power BI.

2.  **Byggprocess med Power Query SDK:**
    *   Öppna projektmappen i Visual Studio Code.
    *   Power Query SDK-tillägget bör känna igen projektet (via `ISSTracker.proj` och `.pq`-filerna).
    *   Högerklicka på `ISSTracker.proj`-filen (eller en `.pq`-fil) i VS Code Explorer och välj "Build Connector Project" (eller motsvarande kommando från SDK:n).
    *   Detta kommer att kompilera koden och paketera den i en `.mez`-fil. Filen skapas vanligtvis i `bin/AnyCPU/Debug/ISSTracker.mez`.
    *   Du kan också följa de mer detaljerade instruktionerna och kommandona som beskrivs i `build.sh`.

## Användning (Installation av `.mez`-filen)

När `.mez`-filen är byggd, installera den genom att:
1.  Kopiera den genererade `ISSTracker.mez` (t.ex. från `bin/AnyCPU/Debug/ISSTracker.mez`) till din Power BI Desktop Custom Connectors-mapp. Denna mapp finns vanligtvis här:
    *   `[Mina Dokument]\Power BI Desktop\Custom Connectors`
    *   (Windows: `C:\Users\[DittAnvändarnamn]\Documents\Power BI Desktop\Custom Connectors`)
    *   Om mappen `Custom Connectors` inte finns, skapa den.
2.  **Justera Säkerhetsinställningar i Power BI Desktop:**
    *   Öppna Power BI Desktop.
    *   Gå till `Arkiv > Alternativ och inställningar > Alternativ`.
    *   Under `Globalt`, välj `Säkerhet`.
    *   Under `Data Extensions` (Datatillägg), välj alternativet **"(Rekommenderas inte) Tillåt alla tillägg att läsas in utan validering eller varning"**. Detta krävs för att ladda in anpassade anslutningar som inte är certifierade av Microsoft.
    *   Klicka `OK`.
3.  **Starta om Power BI Desktop.**
    *   Detta är nödvändigt för att Power BI ska kunna identifiera nya anpassade anslutningar.
4.  Hitta och använd anslutningen:
    *   Klicka på "Hämta data" från menyfliken Hem.
    *   Sök efter "ISS Position Tracker" (eller det namn som anges i `ISSTracker.pq` under `Publish`).
    *   Följ anvisningarna för att ansluta.
