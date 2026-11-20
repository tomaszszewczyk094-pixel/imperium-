# IMPERIUM — uruchomienie GitHub Actions i Railway

## 1. GitHub — umieszczenie projektu

1. Utwórz repozytorium GitHub, np. `imperium-android`.
2. Rozpakuj paczkę projektu. Ważne: prześlij **zawartość katalogu projektu**, a nie katalog nadrzędny `imperium_final`.
3. W głównym katalogu repozytorium muszą być widoczne m.in. `settings.gradle`, `build.gradle`, `app/`, `server/` oraz `.github/workflows/build-apk.yml`.
4. W GitHub otwórz zakładkę **Actions**. Jeśli GitHub poprosi o zgodę na workflows, zaakceptuj ją.
5. Otwórz workflow **Build IMPERIUM Android APK** i wybierz **Run workflow**. Możesz też uruchomić go przez push do `main` lub `master`.
6. Po zakończeniu zadania otwórz run → **Artifacts** → `imperium-debug-apk` i pobierz ZIP z APK.
7. Rozpakuj pobrany artifact. Plik instalacyjny to `app-debug.apk`.

## 2. Railway — wdrożenie serwera

1. Zaloguj się do Railway i wybierz **New Project → Deploy from GitHub Repo**.
2. Wybierz to samo repozytorium.
3. W ustawieniach usługi ustaw katalog główny projektu na `/` (root repozytorium), tak aby Railway widział `Dockerfile`.
4. Wdróż usługę. Serwer nasłuchuje na `PORT` przekazanym przez Railway.
5. Dodaj Volume do usługi i zamontuj go pod `/data`. Serwer zapisuje tam konta, postacie, gildie, domy, pocztę i rynek. Bez trwałego wolumenu dane mogą zniknąć przy ponownym wdrożeniu.
6. Po wdrożeniu otwórz domenę Railway i sprawdź `/health`. Oczekiwany wynik JSON zawiera `status: "ok"` oraz `game: "IMPERIUM"`.
7. Skopiuj domenę HTTPS, np. `https://twoja-usluga.up.railway.app`, i zamień `https://` na `wss://`. Taki adres wpisz w polu serwera w grze.

## 3. Test po wdrożeniu

- Otwórz `https://TWOJA-DOMENA/health` — ma zwrócić HTTP 200.
- W aplikacji wpisz `wss://TWOJA-DOMENA`.
- Utwórz konto testowe i zaloguj się.
- Utwórz postać, przejdź się po mapie, zaatakuj potwora, wyloguj się i zaloguj ponownie.
- Sprawdź, czy postać i ekwipunek zachowały się po restarcie usługi.
- Do testu multiplayer użyj dwóch urządzeń lub dwóch oddzielnych instalacji.

## Bezpieczeństwo

Nie publikuj haseł, tokenów GitHub, kluczy API ani danych do konta w repozytorium lub czacie. Nie włączaj publicznego serwera dla graczy przed testami i sprawdzeniem kopii zapasowych. To wydanie jest prototypem; nie jest jeszcze audytowanym, produkcyjnym serwerem MMO.
