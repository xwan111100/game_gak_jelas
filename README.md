# 🎮 GameHub App

GameHub adalah aplikasi mobile sederhana yang dibangun menggunakan **Flutter** dan **Supabase**. Aplikasi ini dirancang sebagai proyek portofolio untuk menampilkan kemampuan pengembangan aplikasi mobile, autentikasi pengguna, dan integrasi backend modern.

---

## 🚀 Fitur Utama

* 🔐 **Autentikasi Pengguna** (Register & Login)
* 📧 **Email Confirmation** menggunakan Supabase Auth
* 🏠 **Halaman Home setelah Login**
* 🎨 **UI Modern** dengan Material Design (Dark Theme)
* ☁️ **Backend as a Service** menggunakan Supabase

---

## 🛠️ Teknologi yang Digunakan

* **Flutter** (Dart)
* **Supabase** (Authentication & Backend)
* **Material UI**
* **Git & GitHub** (Version Control)

---

## 📂 Struktur Folder

```
lib/
├── main.dart
├── models/
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   └── home/
│       └── home_screen.dart
├── services/
│   └── auth_service.dart
├── widgets/
```

---

## ⚙️ Cara Menjalankan Project

1. Clone repository:

```bash
git clone https://github.com/username/gamehub-app.git
```

2. Masuk ke folder project:

```bash
cd gamehub-app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Jalankan aplikasi:

```bash
flutter run
```

---

## 🔑 Konfigurasi Supabase

Pastikan Anda telah mengganti konfigurasi Supabase di `main.dart`:

```dart
await Supabase.initialize(
  url: 'SUPABASE_URL',
  anonKey: 'SUPABASE_ANON_KEY',
);
```

Dan aktifkan:

* Email Auth
* Email Confirmation

---

## 📸 Preview (Opsional)

*Tambahkan screenshot aplikasi di sini untuk meningkatkan nilai portofolio.*

---

## 🎯 Tujuan Project

* Sebagai **portofolio GitHub** untuk melamar kerja
* Melatih integrasi **Flutter + Supabase**
* Memahami alur autentikasi aplikasi mobile

---

## 👨‍💻 Developer

**X Wan**
Mahasiswa / Junior Mobile Developer

---

## 📄 Lisensi

Project ini bersifat **open-source** dan digunakan untuk pembelajaran.
