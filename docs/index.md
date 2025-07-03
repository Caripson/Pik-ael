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

## Nästa Steg

Nästa steg i utvecklingen är att implementera kärnlogiken för datahämtning i `src/ISSTracker.pq` och skriva motsvarande tester i `tests/test_ISSTracker.pq`.

---
*Detta är en initial version av dokumentationen och kommer att byggas ut allt eftersom projektet fortskrider.*
