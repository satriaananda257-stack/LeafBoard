# 🌿 Leafboard

> A platform built for a new way of working.

Leafboard adalah aplikasi manajemen tugas dan produktivitas berbasis Flutter, dirancang dengan tampilan yang bersih dan modern.

---

## 📱 Halaman yang Tersedia

| Halaman | Deskripsi |
|---|---|
| **Splash Screen** | Tampilan awal dengan branding Leafboard |
| **Login** | Halaman masuk akun dengan email & password |
| **Register** | Halaman daftar akun baru |
| **Home** | Dashboard utama dengan daftar tugas harian |
| **Inbox** | Daftar semua tugas dan aktivitas |
| **History** | Riwayat notifikasi dan aktivitas |
| **Profile** | Informasi profil pengguna |

---

## 🗂️ Struktur Project

```
next/
├── lib/
│   ├── main.dart                  # Entry point app
│   ├── pages/
│   │   ├── splashPage.dart        # Splash screen
│   │   ├── loginPage.dart         # Halaman login
│   │   ├── registerPage.dart      # Halaman register
│   │   ├── homePage.dart          # Home + bottom navigation
│   │   ├── inboxPage.dart         # Halaman inbox
│   │   ├── historyPage.dart       # Halaman history/notifikasi
│   │   └── profilePage.dart       # Halaman profil
│   └── services/
│       └── authService.dart       # Firebase Auth service
├── android/
│   └── app/
│       └── google-services.json   # ⚠️ Perlu ditambahkan manual
└── pubspec.yaml
```

---

## 🚀 Cara Menjalankan

### 1. Clone / buka project

```bash
cd next
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Setup Firebase (wajib untuk auth)

1. Buka [Firebase Console](https://console.firebase.google.com)
2. Buat project baru atau pilih project yang sudah ada
3. Tambahkan Android app dengan package name: `com.example.next`
4. Download `google-services.json`
5. Taruh file di: `android/app/google-services.json`
6. Di Firebase Console → **Authentication** → **Sign-in method** → aktifkan **Email/Password**

### 4. Jalankan app

```bash
flutter run
```

---

## 🔐 Autentikasi

App ini menggunakan **Firebase Authentication** dengan metode Email & Password.

| Aksi | Deskripsi |
|---|---|
| Register | Buat akun baru → otomatis masuk ke HomePage |
| Login | Masuk dengan akun yang sudah ada → HomePage |
| Logout | Tersedia dari halaman Profile |

### Error yang ditangani:
- Email tidak ditemukan
- Password salah
- Email sudah terdaftar
- Password terlalu lemah (min. 6 karakter)
- Format email tidak valid
- Terlalu banyak percobaan login
- Tidak ada koneksi internet

---

## 🎨 Design System

| Elemen | Nilai |
|---|---|
| Primary Color | `#5B6BF5` (Indigo) |
| Accent / Success | `#69F0AE` (Green) |
| Background | `#F5F5FA` |
| Text Primary | `#1A1A2E` |
| Text Secondary | `#9E9E9E` |
| Font | Roboto |

---

## 📦 Dependencies

```yaml
flutter:
  sdk: flutter
cupertino_icons: ^1.0.8
firebase_core: ^3.13.1
firebase_auth: ^5.5.3
```

---

## ⚠️ Catatan Penting

- File `google-services.json` **tidak disertakan** di repository karena berisi konfigurasi private Firebase.
- Tanpa file tersebut, app akan crash saat startup karena `Firebase.initializeApp()` gagal.
- Pastikan sudah menambahkan file tersebut sebelum menjalankan app.

---

## 👨‍💻 Developer

Dibuat sebagai project Flutter — **LeafBoard Day 10**
