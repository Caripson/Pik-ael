# API Anslutningsdetaljer: ISS Tracker

Denna sida beskriver detaljerna för `ISSTracker.Contents`-funktionen som används för att hämta data om Internationella Rymdstationens (ISS) nuvarande position.

## Funktion: `ISSTracker.Contents()`

Denna funktion är kärnan i Power BI-anslutningen. När den anropas, utför den följande steg:

1.  **Hämtar data från API:**
    *   En HTTP GET-förfrågan skickas till `http://api.open-notify.org/iss-now.json`.
    *   Detta är ett öppet API som inte kräver någon autentisering.
2.  **Parsea JSON-svar:**
    *   API:et returnerar ett JSON-objekt. Funktionen extraherar `iss_position`-objektet, som innehåller latitud och longitud.
    *   Ett exempel på JSON-svar:
        ```json
        {
          "message": "success",
          "timestamp": UNIX_TIMESTAMP_HERE,
          "iss_position": {
            "longitude": "LONGITUDE_VALUE",
            "latitude": "LATITUDE_VALUE"
          }
        }
        ```
3.  **Transformerar data till en tabell:**
    *   `iss_position`-objektet (som är en Power Query `record`) konverteras till en tabell.
    *   Den resulterande tabellen har initialt kolumnerna "Name" (med värdena "longitude" och "latitude") och "Value" (med motsvarande positionsvärden).
4.  **Byter namn på kolumner:**
    *   För bättre läsbarhet och användarvänlighet i Power BI byts kolumnnamnen om:
        *   `Name` blir `Egenskap`
        *   `Value` blir `Värde`

## Resultatstruktur

Funktionen `ISSTracker.Contents()` returnerar en tabell med följande struktur:

| Egenskap  | Värde              |
|-----------|--------------------|
| latitude  | (ISS latitud)      |
| longitude | (ISS longitud)     |

Denna tabell kan sedan enkelt användas i Power BI för att visualisera ISS position.

## Felhantering

Den nuvarande implementeringen inkluderar grundläggande felhantering som tillhandahålls av `Web.Contents` (t.ex. om API:et inte är nåbart). Mer specifik felhantering (t.ex. om JSON-strukturen oväntat ändras) är inte explicit implementerad i denna initiala version.

## Beroenden

*   Tillgång till Internet för att nå `http://api.open-notify.org`.
*   Inga externa bibliotek utöver standard Power Query M-funktioner.
