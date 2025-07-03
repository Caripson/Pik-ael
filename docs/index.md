# Välkommen till Pik-ael Power BI Tools - ISS Tracker

Detta projekt syftar till att utveckla en anpassad Power BI-anslutning för att spåra den Internationella Rymdstationens (ISS) aktuella position.

## Översikt

Anslutningen kommer att hämta data från det publika API:et [Open Notify - ISS Current Location](http://api.open-notify.org/iss-now.json).

Projektet följer strikta utvecklingsprinciper:

*   **Testdriven Utveckling (TDD):** All kod valideras med automatiska tester.
*   **Kontinuerlig Dokumentation:** Dokumentationen uppdateras löpande med MkDocs.
*   **Reproducerbar Miljö:** Beroenden och setup hanteras via `requirements.txt` och `setup.sh`.
*   **AI-samverkan:** `agent.md` och `roadmap.json` styr och informerar AI-assisterad utveckling.

## Komma Igång

Se `README.md` i projektets rot för instruktioner om hur du sätter upp miljön och bygger projektet.

## Status och Nästa Steg

Kärnlogiken för datahämtning i `src/ISSTracker.pq` är implementerad. Den hämtar ISS position från Open Notify API och transformerar datan till ett tabellformat.

Motsvarande tester finns i `tests/test_ISSTracker.pq`. Dessa tester är skrivna i M och fokuserar på att validera den returnerade datastrukturen och grundläggande datatyper från `ISSTracker.Contents()`-funktionen. Syftet med testerna är att säkerställa att anslutningens output överensstämmer med förväntningarna, vilket är en viktig del av TDD-processen, även om testerna i denna miljö utvärderas konceptuellt snarare än genom automatisk körning.

Nästa steg i projektet involverar att bygga `.mez`-filen med Power Query SDK och utföra end-to-end validering i Power BI Desktop, vilket beskrivs i `README.md` och `roadmap.json`.

---
*Dokumentationen uppdateras kontinuerligt i takt med projektets framsteg.*
