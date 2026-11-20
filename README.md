# IMPERIUM

Projekt gry fantasy multiplayer **IMPERIUM**. Repozytorium zawiera paczkę źródłową projektu Android oraz konfigurację automatycznego budowania APK.

## Zawartość repozytorium

- `IMPERIUM_GITHUB_RAILWAY_READY.zip` — archiwum projektu źródłowego (ok. 4,8 MB).
- `.github/workflows/build-apk.yml` — GitHub Actions: rozpakowuje archiwum, odnajduje projekt Gradle i buduje testowy APK.
- `FINALIZACJA_ANDROID_PL.md` — instrukcja budowania i testowania aplikacji.
- `GITHUB_RAILWAY_START_PL.md` — instrukcja wdrożenia serwera.
- `QA_REPORT_PL.md` — raport kontroli i znane ograniczenia.

## Budowanie aplikacji Android

1. Otwórz kartę **Actions**.
2. Wybierz **Build Android APK**.
3. Kliknij **Run workflow** i uruchom zadanie dla gałęzi `main`.
4. Po zakończeniu pobierz artefakt **IMPERIUM-Android-APK**.
5. Rozpakuj pobrany ZIP — plik instalacyjny to `app-debug.apk`.

Workflow buduje projekt znajdujący się w archiwum. Jeśli kompilacja nie powiedzie się, otwórz logi zadania Actions — wskażą brakujący plik lub błąd Gradle.

## Serwer multiplayer

Konfiguracja Railway jest przygotowana w repozytorium, ale wdrożenie serwera nie jest jeszcze potwierdzone. Aktualnie katalog `server/` nie znajduje się w głównym drzewie repozytorium, a Dockerfile oczekuje w nim `server/package.json` i `server/server.js`. Przed wdrożeniem backendu trzeba rozpakować/umieścić te pliki w repozytorium i skonfigurować trwały wolumen `/data`.

## Ważne

To wydanie jest prototypem/testowym buildem, a nie certyfikowaną produkcyjną grą MMO. Nie publikuj sekretów, haseł ani tokenów w repozytorium. APK debug nie jest podpisanym wydaniem sklepowym.
