# IMPERIUM — finalizacja, budowanie APK i test na Androidzie

## Co znajduje się w paczce
- aplikacja Android (WebView, tryb poziomy, pełny ekran),
- klient gry i grafiki,
- serwer WebSocket Node.js,
- etapy 27–50,
- konfiguracja GitHub Actions do budowania `app-debug.apk`,
- Dockerfile i konfiguracja Railway dla serwera,
- health check HTTP `/health`.

## Ważne: aplikacja i serwer
IMPERIUM jest grą klient–serwer. Samo zainstalowanie APK nie uruchomi świata multiplayer. Najpierw trzeba uruchomić serwer i uzyskać jego publiczny adres WebSocket `wss://...`. W aplikacji w polu „Adres serwera” należy wpisać ten adres.

## A. Uruchomienie serwera w Railway
1. Utwórz repozytorium GitHub i wgraj całą zawartość tego ZIP-a (bez dodatkowego folderu nadrzędnego).
2. W Railway wybierz **New Project → Deploy from GitHub Repo** i wskaż repozytorium.
3. Railway wykryje `Dockerfile`. W ustawieniach usługi dodaj Volume i zamontuj go dokładnie pod `/data` — tam zapisywane są konta, postacie, gildie, domy, poczta i rynek.
4. Ustaw zmienną `PORT=8080` (jeśli platforma wymaga jawnego ustawienia). `DATA_DIR=/data` jest już w Dockerfile.
5. Po wdrożeniu sprawdź adres `https://TWOJA-DOMENA/health`. Oczekiwany wynik to JSON ze `status: ok`.
6. W aplikacji wpisz adres WebSocket `wss://TWOJA-DOMENA` (bez `https://`, bez ścieżki `/health`).

Nie udostępniaj serwera publicznie bez dodatkowego hardeningu (limity prób logowania, kopie zapasowe, monitoring, ochrona przed spamem i test obciążeniowy). Wolumen jest konieczny, żeby postacie i konta przetrwały restart/redeploy.

## B. Budowanie APK przez GitHub Actions
1. Wgraj cały projekt do GitHub.
2. Otwórz zakładkę **Actions**.
3. Wybierz workflow **Build IMPERIUM Android APK**.
4. Kliknij **Run workflow** i poczekaj na zielony status.
5. Otwórz zakończone uruchomienie workflow, a na dole w **Artifacts** pobierz `imperium-debug-apk`.
6. Rozpakuj pobrane archiwum — wewnątrz będzie `app-debug.apk`.

APK debug jest przeznaczony do instalacji testowej. Nie jest podpisanym wydaniem sklepowym. Do publikacji przygotuj osobny klucz podpisu i bezpieczne GitHub Secrets.

## C. Instalacja na telefonie
1. Przenieś `app-debug.apk` na telefon Android.
2. Otwórz plik i zezwól menedżerowi plików na instalowanie nieznanych aplikacji, jeśli Android o to poprosi.
3. Zainstaluj i uruchom **IMPERIUM**.
4. W polu serwera wpisz `wss://TWOJA-DOMENA`.
5. Wybierz „Rejestracja nowego konta”, utwórz login (3–20 znaków) i hasło (minimum 8 znaków), wybierz nick postaci oraz profesję.
6. Przy kolejnych uruchomieniach wybieraj „Logowanie”.

## D. Test odbiorczy na prawdziwym Androidzie
- [ ] aplikacja instaluje się i uruchamia w orientacji poziomej;
- [ ] klawiatura ekranowa pozwala wpisać adres, login i hasło;
- [ ] rejestracja nowego konta działa;
- [ ] wylogowanie/ponowne logowanie przywraca postać;
- [ ] ruch, walka, loot i czat działają;
- [ ] jedzenie, ekwipunek, bank i sklep działają;
- [ ] zadania, crafting, teleporty i regiony działają;
- [ ] Katakumby odblokowują się zgodnie z warunkami fabuły;
- [ ] rynek, towarzysze, tytuły i zadania dzienne działają;
- [ ] po restarcie serwera postać i konto pozostają zapisane;
- [ ] po utracie sieci aplikacja pokazuje rozłączenie i pozwala ponowić połączenie;
- [ ] test na co najmniej dwóch telefonach potwierdza synchronizację multiplayer.

## Status testów wykonanych w tym środowisku
- `node --check server/server.js` — sprawdzane lokalnie;
- `node --check app/src/main/assets/client.js` — sprawdzane lokalnie;
- kontrola XML manifestu i obecności plików — wykonana przy przygotowaniu paczki;
- budowanie APK — wymaga Android SDK/Gradle, których nie ma w tym środowisku;
- uruchomienie serwera — wymaga zależności `ws` (instalacja npm w tym środowisku nie zakończyła się);
- test na fizycznym telefonie — nie został wykonany, ponieważ nie mam dostępu do urządzenia.

Nie traktuj tej paczki jako certyfikowanej, gotowej produkcyjnej gry MMO. Po wykonaniu punktów A–D i naprawie ewentualnych błędów będzie można zatwierdzić wydanie testowe. Nie wpisuj prawdziwych haseł, których używasz w innych serwisach.
