# [WEBINAR] Ngoding Online Bareng

<p align="center">
  <img src="banner.png" alt="Banner" width="25%" />
</p>

## 🧩 Prerequisite

Bagi yang ikut live coding saat webinar, pastikan kamu sudah menyiapkan hal-hal berikut:

- 🐦 **Flutter SDK & Android SDK**  
  Pastikan sudah terinstall dan bisa menjalankan project di **emulator** atau **real device**.
- 💻 **Text Editor**  
  Direkomendasikan menggunakan **Visual Studio Code (VS Code)**.
- 🔌 **Plugin VSCode yang diperlukan:**  
  - Flutter  
  - Pubspec Assist  
  - GetX Snippets  
  - Gemini Code Assist
- ⚙️ **Node.js (NPM)**  
  Pastikan Node.js sudah terinstall di sistem kamu.
- 🧩 **Step by step cara install Node. js, Flutter dan Android Studio**  
  - By Chat Gpt : https://chatgpt.com/share/68ed81a8-c230-8003-bb6e-2b38ef597346
  - Vided YT : https://youtu.be/okhQ2GWGRAI?si=oSNubS5DcKbsAxu3
- Package atau depedencies yang diperlukan
  ```bash
  firebase_core,cloud_firestore,flutter_form_builder,form_builder_validators,get,intl
  ```
- Konfigurasi firebase project (Global)
  ```bash 
  npm install -g firebase-tools 
  firebase login
  firebase init
  ```
- Konfigurasi FlutterFire Cli (Global)
  ```bash 
  dart pub global activate flutterfire_cli
  ```
- Konfigurasi FlutterFire Cli (Di setiap project baru)
  ```bash 
  flutterfire configure
  ```

## 🧾 Struktur Data (Models)

### 💰 Transaction Data
```json
{
  "id": "",
  "categoryID": "",
  "categoryName": "",
  "type": "",
  "amount": "",
  "createdAt": "2025-10-18 20:00:00"
}
```
### 💰 Category Data
```json
{
  "id": "",
  "name": "",
  "createdAt": "2025-10-18 20:00:00"
}
```