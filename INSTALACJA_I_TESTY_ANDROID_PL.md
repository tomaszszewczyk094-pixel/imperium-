# IMPERIUM — budowanie APK i test na telefonie

## 1. Co jest gotowe

Projekt Android ma moduł `app`, ekran gry w Android WebView, lokalne grafiki i skrypty, a także workflow GitHub Actions w `.github/workflows/build-apk.yml`, który buduje `app-debug.apk`.

Minimalna wersja Androida: 6.0 (API 23). Aplikacja działa w orientacji poziomej. Klient łączy się z osobnym serwerem WebSocket — serwer nie jest uruchamiany wewnątrz APK.

## 2. Uruchomienie serwera do testów w domu

1. Rozpakuj paczkę na komputerze.
2. Zainstaluj Node.js 18 lub nowszy.
3. Otwórz terminal w katalogu `server` i wykonaj:

   ```bash
   npm install
   npm start
   ```

4. Serwer domyślnie nasłuchuje na porcie `8080`.
5. Odczytaj lokalny adres IPv4 komputera, np. `192.168.1.20`. Zezwól na ruch przychodzący TCP na porcie 8080 w zaporze systemowej.
6. Telefon i komputer muszą być połączone z tą samą siecią Wi-Fi.
7. W aplikacji wpisz `ws://192.168.1.20:8080` (zastąp przykładowy adres adresem komputera).
8. Zarejestruj konto, utwórz postać i wejdź do gry.

**Bezpieczeństwo:** `ws://` i ustawienie `usesCleartextTraffic` są przeznaczone wyłącznie do lokalnych testów. Nie wystawiaj takiego serwera do publicznego Internetu. Do publicznej wersji potrzebny jest serwer z TLS/WSS (`wss://`), kopie zapasowe, ograniczanie prób logowania, walidacja i monitoring.

## 3. Zbudowanie pliku APK

W repozytorium GitHub umieść zawartość tego katalogu (tak, aby `.github/workflows/build-apk.yml` znajdował się w katalogu głównym repozytorium), a następnie:

1. Otwórz repozytorium na GitHub.
2. Wejdź w zakładkę **Actions**.
3. Wybierz workflow **Build IMPERIUM Android APK**.
4. Kliknij **Run workflow** i poczekaj na zakończenie zadania.
5. Otwórz zakończony przebieg i pobierz artefakt `imperium-debug-apk`.
6. Rozpakuj pobrany artefakt — znajduje się w nim `app-debug.apk`.

Workflow korzysta z JDK 17, Gradle 8.9, Android SDK Platform 35 i Build Tools 35.0.0. Jest to debug APK do testów, nie podpisany produkcyjny pakiet do publikacji w Google Play.

## 4. Instalacja na telefonie

1. Przenieś `app-debug.apk` na telefon (np. przez USB, Dysk lub komunikator).
2. Otwórz plik APK i zezwól na instalację z użytej aplikacji, jeśli Android o to poprosi.
3. Uruchom IMPERIUM, wpisz adres serwera i zaloguj się.
4. Ustaw telefon poziomo — gra jest przygotowana do orientacji landscape.

Jeżeli Android blokuje instalację, sprawdź, czy pobieranie zakończyło się poprawnie i czy zezwolono na instalację z tego źródła. Nie wyłączaj zabezpieczeń systemu na stałe.

## 5. Test funkcjonalny na prawdziwym Androidzie

Zalecana kolejność. Testy oznacz jako zaliczone dopiero po sprawdzeniu na urządzeniu:

- [ ] Aplikacja instaluje się i uruchamia bez zamknięcia.
- [ ] Ekran logowania wyświetla się w całości w poziomie.
- [ ] Można zarejestrować konto i utworzyć postać.
- [ ] Ponowne logowanie wczytuje tę samą postać i jej zapis.
- [ ] Przyciski kierunkowe oraz sterowanie klawiaturą poruszają postacią.
- [ ] Atak, czar, podnoszenie przedmiotów i ekwipunek działają.
- [ ] NPC, sklep, zadania, jedzenie i depozyt odpowiadają.
- [ ] Zmiana regionu i teleport działają; Katakumby są blokowane przed spełnieniem wymagań.
- [ ] Mikstury, trening, tytuły, towarzysze i zadania dzienne działają.
- [ ] Fabuła przechodzi kolejne rozdziały, a finał wymaga pokonania Króla Umarłych.
- [ ] Rynek, handel, gildie i drużyny przetestowano na dwóch osobnych kontach/urządzeniach.
- [ ] Po zamknięciu i ponownym uruchomieniu aplikacji postać zachowuje postęp.
- [ ] Po utracie Wi-Fi aplikacja pokazuje rozłączenie i można ponowić połączenie po powrocie sieci.

## 6. Co nie zostało potwierdzone

W tym środowisku nie ma Android SDK, emulatora ani fizycznego telefonu, dlatego nie można uczciwie potwierdzić instalacji, działania dotyku, wydajności ani zgodności na konkretnym modelu urządzenia. Nie został tu również wygenerowany binarny APK. Należy go zbudować przez opisany workflow i przeprowadzić testy z punktu 5 na docelowym telefonie.
