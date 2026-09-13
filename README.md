# SIM-UH KIMIA & BANK SOAL - SMA PROGRESIF BUMI SHALAWAT (T.A. 2026/2027)

[![Google Apps Script](https://img.shields.io/badge/Google%20Apps%20Script-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://developers.google.com/apps-script)
[![Google Sheets](https://img.shields.io/badge/Google%20Sheets-34A853?style=for-the-badge&logo=googlesheets&logoColor=white)](https://sheets.new)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)
[![FullCalendar](https://img.shields.io/badge/FullCalendar-007ACC?style=for-the-badge&logo=calendar&logoColor=white)](https://fullcalendar.io/)

Aplikasi Web modern berbasis **Google Apps Script (GAS)** dan **Google Sheets** khusus untuk bapak/ibu guru kimia di **SMA Progresif Bumi Shalawat (Tahun Ajaran 2026/2027)** dalam menjadwalkan Ulangan Harian (UH) CBT, memeriksa status kesiapan soal pada Bank Soal Kimia (Kelas 10 s/d 12), serta melihat rekap agenda ujian dalam bentuk **Kalender Interaktif Cross-Device**.

Dilengkapi dengan sistem aturan jam pembelajaran (JP) khusus sekolah, dukungan jadwal ulangan bersamaan antarkelas, proteksi kebocoran soal (naskah soal hanya dapat diakses melalui admin/TQA), dan panel manajemen kelas fleksibel.

---

## 🌟 Fitur Utama

### 1. 📅 Form Penjadwalan Guru (Smart Schedule Form)
- **Logika Jam Pelajaran Otomatis**:
  - **Senin – Kamis**: Maksimal **8 JP** (JP 1–4: 07.00–09.40 @40m, Istirahat 20m, JP 5–7: 10.00–12.00 @40m, JP 8: 12.00–12.30 [30m]).
  - **Jumat**: Maksimal **4 JP** (07.00–09.40 WIB, @40m).
  - **Sabtu**: Maksimal **4 JP**, jam mulai dihitung dari **07.40 – 10.20 WIB** (@40m).
  - **Minggu**: Otomatis terdeteksi sebagai hari libur sekolah.
- **Jadwal Bertabrakan Diperbolehkan**: Dua guru atau lebih dapat menjadwalkan ulangan di hari dan jam yang sama untuk kelas masing-masing (CBT simultan).
- **Deteksi Ketersediaan Bank Soal Real-Time**: Ketika guru memilih materi, muncul kartu status kesiapan naskah soal (Tersedia / Belum Tersedia) beserta jumlah soal dan tautan naskah ujian.

### 2. 📆 Kalender Rekap Interaktif (FullCalendar v6)
- Menampilkan seluruh jadwal ulangan yang didaftarkan oleh seluruh guru kimia.
- Pembeda warna event berdasarkan jenjang kelas:
  - 🟢 **Kelas 10 (Fase E)**: Hijau Toska / Teal
  - 🔵 **Kelas 11 (Fase F)**: Biru
  - 🟣 **Kelas 12 (Fase F)**: Ungu
- Fitur filter interaktif: Filter berdasarkan Tingkat, Nama Kelas spesifik, atau Guru Pengampu.
- Klik event untuk melihat modal popup detail jadwal lengkap.

### 3. 🧪 Katalog Bank Soal Kimia (Kelas 10 – 12) & Proteksi Anti-Kebocoran
- Menyediakan materi pokok kimia lengkap jenjang SMA/MA (Kelas 10 Fase E, Kelas 11-12 Fase F).
- Guru dapat memantau status kesiapan soal (*Tersedia* / *Belum Tersedia*) secara real-time.
- **Proteksi Naskah Soal**: Tautan naskah soal tidak ditampilkan ke guru umum (muncul keterangan *"Hubungi TQA untuk mengakses soal"*). Hanya Admin/TQA yang berhak membuka dan mengelola naskah soal.
- Tombol aksi cepat *"Jadwalkan UH"* langsung mengarahkan guru ke formulir dengan materi terpilih otomatis.

### 4. 🛡️ Panel Administrator (Discreet Lock & Password Protected)
- **Akses Rahasia**: Tombol masuk admin tidak mencolok, melainkan tersembunyi berupa **ikon gembok kecil** di samping judul SIM-UH KIMIA pada header.
- **Password Terproteksi**: Menggunakan password default **`kimiasatuhati`** yang tidak pernah dimunculkan di layar antarmuka.
- **Kelola Bank Soal**: Tambah materi baru, edit data, ubah link naskah CBT, dan **1-klik switch status soal** (*Tersedia* &harr; *Belum Tersedia*).
- **Kelola Jenis Kelas Fleksibel**: Admin dapat menambah berbagai variasi kelas sekolah (Reguler, Tahfidz, Bilingual, Riset Unggulan, Lab CBT) agar muncul pada formulir guru.
- **Rekap & Cetak Jadwal**: Tabel seluruh jadwal ulangan dan fitur cetak/PDF siap cetak.
- **Ganti Password Admin**: Dapat diubah kapan saja langsung dari panel admin.

---

## 📂 Struktur Berkas Repositori

```text
penjadwalan-uh-kimia/
├── Kode.gs               # Backend REST API Google Apps Script (Tanpa perlu HTML di GAS!)
├── Code.js               # Duplikat Kode.gs untuk fleksibilitas editor lokal
├── index.html            # Frontend Utama Siap Online (GitHub Pages / Browser)
├── index_preview.html    # Versi mandiri untuk offline double-click preview
├── Index.html            # Template modular UI
├── Styles.html           # Modular CSS & Theme
├── Scripts.html          # Modular Logic JS (API Caller, Form, Kalender)
├── build_preview.ps1     # Skrip kompilasi otomatis ke index.html
├── Panduan_Instalasi.md  # Panduan deployment lengkap dan mudah
├── README.md             # Dokumentasi repositori GitHub
└── .gitignore            # File ignore standar Git
```

---

## 🚀 Panduan Singkat Deployment (2 Langkah Mudah)

### Langkah 1: Pasang Backend API di Google Apps Script (Tanpa File HTML!)
1. Buka [sheets.new](https://sheets.new) di browser Anda.
2. Di menu atas, klik **Ekstensi** &rarr; **Apps Script**.
3. Buka file `Kode.gs` (atau `Code.gs`) di proyek ini, salin seluruh isinya ke editor Apps Script.
   *(PENTING: Anda **tidak perlu** membuat file HTML di Apps Script!)*
4. Pilih fungsi `setupDatabase` di menu dropdown atas, lalu klik **Jalankan** (*Run*) dan izinkan akses. Spreadsheet Anda akan otomatis membuat 4 sheet lengkap dengan data awal.
5. Klik tombol biru **Terapkan** (*Deploy*) &rarr; **Penerapan baru** (*New deployment*) &rarr; Pilih jenis **Aplikasi web** (*Web app*).
   - Jalankan sebagai: **Saya** (*Me*)
   - Akses: **Siapa saja** (*Anyone*)
6. Klik **Terapkan** dan salin URL Web App yang berakhiran `/exec`.

### Langkah 2: Unggah ke GitHub & Aktifkan GitHub Pages
1. Buat repositori baru di [GitHub](https://github.com/new) dan unggah seluruh isi folder ini.
2. Buka menu **Settings** di repo GitHub Anda &rarr; klik **Pages**.
3. Pilih branch `main`, folder `/ (root)`, lalu klik **Save**.
4. Website Anda langsung online di URL: `https://<username>.github.io/<nama-repo>/`.
5. Buka website tersebut, klik tombol **"Hubungkan Spreadsheet"** di header atas, lalu tempelkan URL Web App Apps Script Anda. **Selesai!**

---

## 💻 Cara Menguji Secara Lokal (Offline Preview)

Anda dapat langsung mengklik dua kali file **`index.html`** atau **`index_preview.html`** untuk membukanya di browser secara langsung. Aplikasi dilengkapi mode simulasi data lokal sehingga dapat langsung diuji tanpa internet.

---

## 📤 Perintah Git untuk Push ke GitHub

```bash
cd "C:\Users\Tito\Desktop\penjadwalan-uh-kimia"
git init
git add .
git commit -m "feat: inisialisasi aplikasi SIM-UH Kimia SMA Progresif Bumi Shalawat (GitHub Pages + GAS API)"
git branch -M main
git remote add origin https://github.com/USERNAME-ANDA/penjadwalan-uh-kimia.git
git push -u origin main
```

---

## 📄 Lisensi
Proyek ini dibuat untuk mendukung kegiatan belajar mengajar dan MGMP Kimia. Bebas digunakan dan dikembangkan sesuai kebutuhan sekolah.
