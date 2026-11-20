# IMPERIUM — raport kontroli projektu Android / etapy 27–50

## Poprawki w projekcie
- Podłączono polecenia nowych funkcji: karta postaci, zadanie dzienne, trening, tytuły, towarzysze, rynek, fabuła i mikstury.
- Dodano potwory do Zapomnianych Katakumb, w tym Króla Umarłych.
- Finał fabuły wymaga flagi pokonania konkretnego Króla Umarłych.
- Dodano nagrody materiałowe po pokonaniu Króla Umarłych.
- Poprawiono lokalne ścieżki CSS/JS dla Android WebView.
- Dodano natywną obsługę JavaScript `prompt`, `confirm` i `alert` w WebView.
- Dodano workflow GitHub Actions do budowania debug APK.

## Testy wykonane w tym środowisku
- `node --check server/server.js` — OK.
- `node --check app/src/main/assets/client.js` — OK.
- Parsowanie `AndroidManifest.xml` — OK.
- Kontrola referencji JS do elementów HTML — 61/61 identyfikatorów znalezionych.
- Kontrola lokalnych zasobów wskazanych w HTML — brak brakujących plików.
- Testy logiki serwera z atrapą WebSocket opisane w testach QA — rejestracja/logowanie, polecenia rozszerzeń, region Katakumb i warunek finału.

## Ograniczenia
- `npm install` nie zakończył się w tym środowisku z powodu przekroczenia limitu czasu; nie wykonano tu testu z rzeczywistym modułem `ws`.
- Nie wykonano pełnego testu sieciowego klient-serwer z dwoma rzeczywistymi urządzeniami.
- Nie ma Android SDK, emulatora ani fizycznego telefonu; nie zbudowano APK w tym środowisku.
- Workflow GitHub Actions buduje `app-debug.apk` po umieszczeniu projektu w repozytorium GitHub i uruchomieniu zadania.
- Debug APK nie jest wydaniem produkcyjnym. Publiczny serwer wymaga TLS/WSS, ochrony przed nadużyciami, kopii zapasowych i testów obciążeniowych.

## Wniosek
Kod przechodzi kontrole statyczne opisane powyżej, ale gotowość instalacyjna na konkretnym telefonie nie jest jeszcze potwierdzona. Wykonaj instrukcję `INSTALACJA_I_TESTY_ANDROID_PL.md`, zbuduj APK przez GitHub Actions i zaznacz testy dopiero po ich wykonaniu na urządzeniu.
