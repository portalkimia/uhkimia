# Panduan Lengkap Pemasangan (Deployment) Aplikasi Web SIM-UH Kimia & Bank Soal
### SMA Progresif Bumi Shalawat — Tahun Ajaran 2026/2027

Aplikasi ini menggunakan arsitektur modern:
- **Backend**: **Google Apps Script (GAS)** & **Google Sheets** sebagai REST API database otomatis (**HANYA 1 file: `Kode.gs`** — Anda **TIDAK PERLU** membuat file HTML di Google Apps Script!).
- **Frontend**: **GitHub Pages** (atau static web hosting) untuk antarmuka web responsif cross-device (`index.html`).

---

## DAFTAR BERKAS DALAM PROYEK

| Nama Berkas | Lokasi Penggunaan | Keterangan |
| :--- | :--- | :--- |
| **`Kode.gs`** *(atau `Code.js`)* | **Google Apps Script** | Salin isinya ke editor Apps Script. Berfungsi sebagai REST API backend dan membuat 4 sheet otomatis. |
| **`index.html`** | **GitHub / GitHub Pages** | Halaman utama web siap online di GitHub Pages atau dibuka lokal di laptop. |
| **`index_preview.html`** | **Browser Laptop (Offline)** | File cadangan mandiri untuk preview offline. |
| **`Styles.html` & `Scripts.html`** | **Modular Source** | Sumber kode CSS dan JavaScript terpisah untuk mempermudah kustomisasi. |
| **`build_preview.ps1`** | **Laptop (PowerShell)** | Skrip satu-klik untuk kompilasi ulang jika Anda mengubah kode modular. |
| **`README.md`** | **GitHub** | Dokumentasi repositori GitHub. |

---

## LANGKAH-LANGKAH DEPLOYMENT (SANGAT MUDAH & CEPAT)

### BAGIAN 1: SETUP BACKEND (GOOGLE APPS SCRIPT)
*(Hanya perlu 1 file, tanpa membuat file HTML di Apps Script)*

#### Langkah 1: Buka Google Spreadsheet
1. Buka browser dan kunjungi [sheets.new](https://sheets.new) di akun Google sekolah/pribadi Anda.
2. Beri nama spreadsheet Anda, misalnya:  
   `Database SIM-UH Kimia & Bank Soal - SMA Progresif Bumi Shalawat`

#### Langkah 2: Buka Apps Script Editor
1. Pada menu Spreadsheet di atas, klik menu **Ekstensi** (Extensions) &rarr; pilih **Apps Script**.
2. Tab baru editor Google Apps Script akan terbuka.
3. Beri nama proyek di kiri atas: `SIM-UH-Kimia-API`.

#### Langkah 3: Tempel Kode Backend (`Kode.gs`)
1. Pada daftar file di panel kiri editor Apps Script, buka file `Code.gs` (atau `Kode.gs`).
2. Hapus seluruh isi default, lalu **salin & tempel seluruh isi dari file `Kode.gs` (atau `Code.js`)** dari folder proyek ini.
3. Klik tombol **Simpan** (ikon disket) atau tekan `Ctrl + S`.
> [!NOTE]
> **PENTING**: Anda **TIDAK PERLU** membuat file HTML apa pun di Google Apps Script. `Kode.gs` murni bertindak sebagai REST API JSON untuk Google Sheets.

#### Langkah 4: Inisialisasi Database Otomatis (`setupDatabase`)
1. Di bilah menu atas editor Apps Script, pilih fungsi **`setupDatabase`** pada menu dropdown (di samping tombol *Debug*).
2. Klik tombol **Jalankan** (*Run*).
3. Google akan meminta izin akses (*Authorization Required*):
   - Klik **Tinjau Izin** (*Review Permissions*) &rarr; Pilih akun Google Anda.
   - Klik tautan **Lanjutan** (*Advanced*) di kiri bawah &rarr; Klik **Buka SIM-UH-Kimia-API (tidak aman)**.
   - Klik **Izinkan** (*Allow*).
4. Tunggu 5 detik hingga muncul pesan *"Eksekusi selesai"*.
5. Buka kembali tab Google Spreadsheet Anda: 4 sheet (`Jadwal_UH`, `Bank_Soal`, `Master_Kelas`, `Konfigurasi`) otomatis terbuat dan terisi data awal!

#### Langkah 5: Deploy sebagai Aplikasi Web (Web App)
1. Di pojok kanan atas Apps Script, klik tombol biru **Terapkan** (*Deploy*) &rarr; pilih **Penerapan baru** (*New deployment*).
2. Klik ikon gerigi jenis penerapan &rarr; pilih **Aplikasi web** (*Web app*).
3. Atur konfigurasi:
   - **Deskripsi**: `API SIM-UH Kimia SMA Progresif Bumi Shalawat`
   - **Jalankan sebagai** (*Execute as*): **Saya** (*Me / email Anda*)
   - **Yang memiliki akses** (*Who has access*): **Siapa saja** (*Anyone*)  
     *(Wajib memilih "Siapa saja" agar Web di GitHub dapat berkomunikasi dengan API)*.
4. Klik **Terapkan** (*Deploy*).
5. **Salin URL Aplikasi Web** yang berakhiran `/exec` (misal: `https://script.google.com/macros/s/AKfycb.../exec`).

---

### BAGIAN 2: DEPLOY FRONTEND KE GITHUB PAGES

#### Langkah 1: Unggah ke Repositori GitHub
1. Buat repositori baru di akun GitHub Anda (misal bernama: `penjadwalan-uh-kimia`).
2. Unggah seluruh file di folder `penjadwalan-uh-kimia` (terutama file **`index.html`**).
   *(Bisa menggunakan Git command line atau drag & drop langsung di website GitHub)*.

#### Langkah 2: Aktifkan GitHub Pages
1. Di repositori GitHub Anda, buka menu **Settings** (Pengaturan).
2. Di menu samping kiri, klik **Pages**.
3. Pada bagian **Branch**, pilih branch `main` (atau `master`), folder pilih `/ (root)`, lalu klik tombol **Save**.
4. Tunggu 1–2 menit, GitHub Pages akan memberikan URL website Anda, contoh:  
   `https://<username-anda>.github.io/penjadwalan-uh-kimia/`

#### Langkah 3: Sambungkan Web ke Google Sheets (Satu Kali Klik)
1. Buka URL GitHub Pages Anda di browser (atau buka file `index.html` langsung).
2. Di bagian header atas atau footer bawah, klik tombol **"Hubungkan Spreadsheet"** (atau ikon database).
3. Tempelkan URL Web App Apps Script (yang berakhiran `/exec` dari Bagian 1) ke dalam kolom input.
4. Klik tombol **Uji & Sambungkan**.
5. Sistem akan memverifikasi koneksi dan menampilkan notifikasi sukses:  
   🎉 *"Terhubung ke Spreadsheet! Data tersinkronisasi otomatis."*
6. **Selesai!** Website kini 100% online, dapat diakses guru lewat smartphone maupun laptop, dan setiap pengisian formulir atau perubahan bank soal langsung tercatat di Google Sheets sekolah.

---

## FITUR UTAMA & PANDUAN PENGGUNAAN

### 1. Form Penjadwalan Guru (User View)
- **Logika Jam Pelajaran Otomatis**:
  - **Senin – Kamis**: Tersedia pilihan hingga **8 JP**. JP 1–4 (07.00–09.40, @40m), istirahat 20 menit (09.40–10.00), JP 5–7 (10.00–12.00, @40m), dan JP 8 khusus 30 menit (12.00–12.30).
  - **Jumat**: Otomatis hanya tersedia pilihan hingga **4 JP** (07.00–09.40 WIB).
  - **Sabtu**: Otomatis hanya tersedia pilihan hingga **4 JP**, dengan jam mulai dihitung dari **07.40 – 10.20 WIB** (@40m).
  - **Minggu**: Sistem mendeteksi hari libur dan mengingatkan guru untuk memilih hari belajar aktif.
- **Indikator Ketersediaan Bank Soal & Keamanan Naskah**:
  - Saat guru memilih materi, langsung muncul kartu status:
    - **Hijau**: *"Soal TERSEDIA di Bank Soal (25 Butir Soal, CBT PG)"* disertai keterangan aman *"Hubungi TQA untuk mengakses soal"* (tautan naskah soal diproteksi demi meminimalkan potensi kebocoran ujian).
    - **Kuning**: *"Soal BELUM TERSEDIA di Bank Soal"* (memberitahukan guru bahwa soal sedang dipersiapkan tim TQA/admin).
- **Jadwal Bertabrakan Diperbolehkan**:
  - Jika dua guru menjadwalkan ulangan di hari dan jam yang sama untuk kelas masing-masing, sistem **tidak memblokir** karena ulangan CBT berjalan mandiri per kelas.

### 2. Kalender Rekap Interaktif (Calendar View)
- Tampilan berbasis **FullCalendar** yang intuitif.
- Warna event dibedakan menurut jenjang kelas:
  - **Teal / Hijau Toska**: Kelas 10 (Fase E)
  - **Biru**: Kelas 11 (Fase F)
  - **Ungu**: Kelas 12 (Fase F)
- Event pada jam yang sama tertata rapi berdampingan.
- Filter cepat: Filter berdasarkan Tingkat, Nama Kelas spesifik, atau Guru Pengampu.
- Klik pada salah satu event untuk melihat modal popup detail lengkap jadwal.

### 3. Bank Soal Kimia (Kelas 10 s/d 12)
- Guru dapat mencari topik materi dengan kolom pencarian.
- Filter berdasarkan Kelas (10, 11, 12), Semester (Ganjil/Genap), dan Status Soal.
- Tombol cepat **"Jadwalkan UH"** pada setiap kartu materi untuk langsung mengisi materi ke form penjadwalan.

### 4. Panel Admin (Kelola Bank Soal, Kelas & Jadwal)
- Akses dilindungi Password Admin melalui **ikon gembok kecil** di samping judul SIM-UH KIMIA pada header (rahasia, tidak ada tombol teks mencolok). **Password Default: `kimiasatuhati`** (Password tidak dimunculkan di layar web demi keamanan, sehingga hanya admin/TQA yang memegang password ini yang dapat masuk).
- **Kelola Bank Soal**:
  - Menambah materi baru.
  - Mengubah status ketersediaan soal dengan **1-klik switch** (Tersedia &harr; Belum Tersedia).
  - Mengisi link Google Form/CBT, jumlah soal, kunci jawaban, dan catatan.
- **Kelola Jenis Kelas (Fleksibel)**:
  - Menambahkan jenis kelas baru dengan mudah (contoh: Reguler, Tahfidz, Bilingual, Riset Unggulan, Lab CBT).
  - Menghapus kelas yang sudah tidak aktif.
  - Kelas baru otomatis langsung tersedia di formulir guru.
- **Kelola Jadwal & Cetak Rekap**:
  - Melihat seluruh jadwal yang masuk dalam bentuk tabel.
  - Menghapus atau membatalkan jadwal ulangan jika ada perubahan agenda sekolah.
  - Tombol **Cetak / PDF Rekap** untuk mencetak jadwal ulangan harian.
- **Ganti PIN Admin**:
  - Admin dapat memperbarui PIN kapan saja langsung melalui aplikasi.
