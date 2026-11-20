# IMPERIUM — Android Edition

Projekt źródłowy aplikacji Android Studio. Klient działa w aplikacji Android (WebView, orientacja pozioma), a tryb wieloosobowy korzysta z osobnego serwera WebSocket. Nazwa gry i aplikacji wyświetlana użytkownikowi to **IMPERIUM**.

## Budowanie APK
1. Otwórz folder projektu w Android Studio.
2. Zainstaluj wymagany Android SDK i poczekaj na synchronizację Gradle.
3. Wybierz Build → Build Bundle(s) / APK(s) → Build APK(s).
4. Debug APK znajdziesz w `app/build/outputs/apk/debug/app-debug.apk`.

## Serwer
W folderze `server` uruchom `npm install`, a następnie `npm start`. Telefon musi mieć dostęp do serwera przez sieć. W aplikacji wpisz adres serwera WebSocket. Do publicznego wdrożenia wymagane są TLS/WSS, ograniczanie prób logowania, kopie zapasowe i dalsze zabezpieczenia.

## Zawartość etapów 22–26
- Etap 22: domy graczy i własność nieruchomości.
- Etap 23: handel gracz–gracz z potwierdzeniem odbiorcy.
- Etap 24: boss Władca Otchłani i nagrody.
- Etap 25: wilki, szkielety i demony.
- Etap 26: zadania Wilcza plaga i Mroczna krypta.

## Status
To prototyp źródłowy. Sprawdzono składnię JavaScript i integralność ZIP. Nie wykonano pełnego testu rozgrywki ani kompilacji APK. Serwer wymaga `npm install` przed uruchomieniem. Grafika jest autorska i nawiązuje do old-schoolowych MMORPG; nie zawiera oryginalnych zasobów Tibii.


ETAPY 27–35 — IMPERIUM

Etap 27: Wierzchowce: kucyk, wilczy rumak i leśny jeleń. Zakup za GP, lista posiadanych, zakładanie i zsiadanie. Wierzchowiec nieznacznie przyspiesza poruszanie.

Etap 28: Osiągnięcia: odznaki za poziomy, majątek, ukończone zadania i pokonanie bossa.

Etap 29: Ranking postaci: serwer sortuje zapisane i aktywne postacie według poziomu oraz doświadczenia.

Etap 30: Trening magii: do pięciu poziomów szkolenia, koszt w GP i stopniowy wzrost mocy zaklęć.

Etap 31: Eventy: uruchomienie najazdu, dołączanie uczestników i przyznanie nagród po zakończeniu wydarzenia.

Etap 32: Poczta postaci: wysyłanie krótkich wiadomości do istniejących postaci, odczyt ostatnich wiadomości i czyszczenie skrzynki.

Etap 33: Nagrody dzienne: jedna nagroda na dzień UTC, rosnąca seria logowań, złoto i doświadczenie.

Etap 34: Bestiariusz: automatyczne zliczanie pokonanych potworów i podgląd statystyk postaci.

Etap 35: Teleporty: szybka podróż do regionów town, forest i cave za opłatą 100 GP.

Uruchomienie serwera: przejdź do katalogu server i wykonaj npm install, a następnie npm start.
Pełna kompilacja Android APK wymaga Android Studio i skonfigurowanego Android SDK.
Ważne: projekt jest prototypem; przed publicznym serwerem należy dodać TLS/WSS, limity zapytań, kopie zapasowe i testy bezpieczeństwa.


## Etapy 36–50 — rozszerzenie gry
- 36: karta postaci i statystyki.
- 37: mikstury zdrowia i many oraz rozbudowane rzemiosło.
- 38: zadania dzienne.
- 39: tytuły bohatera.
- 40: trening walki, obrony i magii.
- 41: zwierzęta towarzyszące z bonusami bojowymi.
- 42: rynek graczy z zapisanymi ofertami.
- 43: Zapomniane Katakumby i Król Umarłych.
- 44: nowe receptury i przedmioty.
- 45–48: trzy rozdziały fabuły oraz nagroda za uratowanie Imperium.
- 49–50: zawartość po finale i zakończenie głównego wątku.

### Nowe przyciski
POSTAĆ, ZADANIE DNIA, TRENING, TYTUŁY, TOWARZYSZ, RYNEK, FABUŁA i MIKSTURA.
U Kupca Jana można kupować mikstury. Przedmioty i składniki można wykorzystywać w rozszerzonym rzemiośle.
Katakumby wymagają poziomu 12 oraz przejścia rozdziału II. Główny finał wymaga pokonania Króla Umarłych.

### Ważne ograniczenia
To rozszerzona wersja prototypu gry, a nie certyfikowana produkcja MMO. Rynek, eventy i waluta wymagają dalszych testów przy wielu jednoczesnych graczach. Przed uruchomieniem publicznym skonfiguruj WSS/TLS, kopie zapasowe, walidację i limity zapytań. Wykonaj `npm install` w katalogu `server`.

## Kontrola i budowanie APK
Wersja po poprawkach zawiera obsługę nowych poleceń serwera (mikstury, karta postaci, zadania dzienne, trening, tytuły, towarzysze, rynek i finał fabuły), potwory w Katakumbach oraz obsługę okien JavaScript `prompt/confirm/alert` w WebView. Ścieżki CSS i JS są względne, aby działały z `file:///android_asset/index.html`.

### Budowanie lokalne
Wymagane: JDK 17, Gradle 8.9 oraz Android SDK Platform 35 i Build Tools 35.0.0.
```bash
gradle --no-daemon assembleDebug
```
APK debug: `app/build/outputs/apk/debug/app-debug.apk`.

### Budowanie przez GitHub Actions
W repozytorium znajduje się workflow `.github/workflows/build-apk.yml`. Po wypchnięciu projektu do repozytorium GitHub lub ręcznym uruchomieniu workflow `Build IMPERIUM Android APK`, artefakt `imperium-debug-apk` będzie dostępny do pobrania w zakładce Actions.
