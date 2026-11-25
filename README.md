# MyPortfolio Mobile

Aplikasi mobile multiplatform berbasis Flutter untuk portofolio pribadi (PBP Gasal 2026/2027).

**Identitas Pengembang:**
- Nama: Rama Sanjaya
- NPM: 2506604421
- Kelas: PBP B

---

## Deskripsi Proyek

`myportofolio_mobile` adalah aplikasi klien mobile untuk ekosistem portofolio pribadi `myportofolio`. Aplikasi ini menampilkan informasi profil pengembang serta menu navigasi aksi interaktif menggunakan desain Material 3.

### Fitur Saat Ini
- Halaman utama (`lib/screens/menu.dart`) dengan `Scaffold`, `AppBar`, dan `LeftDrawer`.
- Kartu informasi profil (`InfoCard`) yang menampilkan NPM, Nama, dan Kelas secara responsif.
- Kartu tombol aksi (`ItemCard` di `lib/widgets/project_card.dart`) dengan warna latar berbeda dan navigasi `Navigator.push()` ke halaman formulir.
- Halaman formulir Tambah Proyek (`lib/screens/project_form.dart`) dan Tambah Pengalaman (`lib/screens/experience_form.dart`) dengan validasi input, `showDatePicker()`, serta dialog ringkasan data.
- Menu navigasi samping (`LeftDrawer` di `lib/widgets/left_drawer.dart`) dengan opsi `Home`, `Add Project`, dan `Add Experience`.

---

## Instruksi Setup & Menjalankan Proyek

### Prasyarat
- Flutter SDK (Channel stable)
- Dart SDK (sudah terbundel dalam Flutter SDK)
- Google Chrome atau Android Emulator / Perangkat Fisik

### Langkah Instalasi
1. Clone repositori ini:
   ```bash
   git clone https://github.com/ramasanjayadx/myportofolio_mobile.git
   cd myportofolio_mobile
   ```
2. Unduh dependensi proyek:
   ```bash
   flutter pub get
   ```
3. Pastikan tidak ada isu analisis statis:
   ```bash
   flutter analyze
   ```
4. Jalankan aplikasi (disarankan via Chrome untuk pengujian cepat):
   ```bash
   flutter run -d chrome
   ```

---

## Progres Mingguan

- **Minggu 1 (Tutorial 08 - Basic Flutter):** Inisialisasi proyek `myportofolio_mobile`, pemisahan `lib/menu.dart` dari `lib/main.dart`, konfigurasi tema Material 3 (`Colors.indigo` & `Colors.amber`), serta implementasi `InfoCard` dan `ItemCard`.
- **Minggu 2 (Tugas 7 - Basic Flutter):** Mengganti data identitas menjadi data pribadi, menambahkan atribut `color` pada model `ItemHomepage` untuk membedakan warna tiap tombol aksi, serta mendokumentasikan jawaban reflektif di `README.md`.
- **Minggu 3 (Tutorial 09 - Navigation, Layouts, Forms, & Input Elements):** Migrasi impor ke `material_ui`, penambahan `LeftDrawer`, pembuatan halaman `ProjectFormPage` dengan validasi dan `AlertDialog`, navigasi `ItemCard`, serta refactoring direktori ke `lib/screens/` dan `lib/widgets/`.
- **Minggu 4 (Tugas 8 - Navigation, Layouts, Forms, & Input Elements):** Pembuatan halaman `ExperienceFormPage` (`lib/screens/experience_form.dart`) dengan input teks, dropdown, `showDatePicker()`, validasi lengkap (kosong/spasi, panjang karakter, dan urutan tanggal), penambahan kartu aksi `"Tambah Pengalaman"` dan opsi drawer `"Add Experience"`, serta dokumentasi jawaban reflektif Tugas 8.

---

## AI Disclosure

### Tools yang Digunakan
- **Antigravity (Asisten AI berbasis Gemini):** Digunakan sebagai pendamping pengkodean di IDE untuk membaca panduan tugas dan menyusun kerangka dokumentasi.
- **Gemini AI:** Digunakan sebagai alat bantu selama pengerjaan tugas.

### Strategi Prompting
- **Review Before Edit:** Meminta AI menjelaskan terlebih dahulu bagian mana saja yang harus diubah berdasarkan dokumen PDF tugas sebelum mengizinkannya menyunting berkas proyek.
- **Minimal & Clean Code:** Menginstruksikan AI agar tetap mengikuti struktur kode tutorial dan mengurangi komentar yang tidak perlu.
- **Iterative Refinement:** Meminta penyederhanaan format teks pada draf jawaban agar sesuai dengan preferensi penulisan di `README.md`.

### Bagian Spesifik yang Dibantu
- Penyesuaian `lib/menu.dart` untuk menambahkan properti `final Color color` pada `ItemHomepage` dan menghubungkannya ke `ItemCard` (Tugas 7).
- Pembuatan halaman `lib/screens/experience_form.dart` beserta validasi panjang teks, spasi kosong, dan urutan tanggal dengan `showDatePicker()` (Tugas 8).
- Penambahan navigasi kartu aksi di `lib/screens/menu.dart` & `lib/widgets/project_card.dart` serta opsi `"Add Experience"` di `lib/widgets/left_drawer.dart` (Tugas 8).
- Penyusunan poin-poin awal jawaban pertanyaan reflektif dan panduan perintah Git bertahap.

### Analisis Kritis Keterbatasan AI & Perbaikan Manual
- **Konteks Data Pribadi:** AI tidak mengetahui identitas pribadi (NPM, kelas, dan preferensi penamaan) maupun konteks riwayat tugas web sebelumnya secara otomatis, sehingga data tersebut harus diisikan dan diverifikasi secara manual.
- **Gaya Penulisan & Komentar:** Pada respons awal, AI cenderung menyertakan komentar kode yang terlalu panjang dan format markdown (bold/italic/backtick) yang terlalu ramai pada jawaban reflektif. Perbaikan dilakukan dengan mengarahkan ulang format agar lebih ringkas dan melakukan penyuntingan manual pada `README.md`.
- **Eksekusi Git & Pengujian:** Seluruh proses `git commit` bertahap, `git push` ke GitHub, serta pengecekan tampilan langsung di peramban/emulator dijalankan dan diverifikasi secara manual oleh pengembang.

### Ringkasan Log Prompting
- 1. Tugas 7 : https://share.gemini.google/BYJeh9dH3nZj
- 2. Tugas 8 : https://share.gemini.google/oiwTNpNZVC28

---
### Tugas 7

1. **Apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-widget?**
    Widget tree adalah semacam struktur hierarki yang berbentuk seperti pohon yang merepresentasikan susunan seluruh komponen antarmuka (UI) di dalam aplikasi Flutter. Hubungan parent-child bekerja melalui aliran batasan ukuran (constraints) dan pewarisan konteks yaitu parent mengirimkan batasan ukuran ke child, child menentukan ukurannya sesuai batasan tersebut, lalu parent mengatur posisi child di layar serta meneruskan konfigurasi seperti tema.

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**
    - MyApp: Custom StatelessWidget yang menjadi titik awal aplikasi.
    - MaterialApp: Root widget yang menyediakan konfigurasi Material Design, judul aplikasi, tema, dan halaman utama.
    - MyHomePage: Custom StatelessWidget yang menampilkan halaman menu utama.
    - Scaffold: Kerangka dasar tata letak halaman Material Design (AppBar, body, dan dukungan SnackBar).
    - AppBar: Bilah judul di bagian atas halaman.
    - Text: Menampilkan teks di layar beserta pengaturannya.
    - Padding: Memberikan jarak ruang kosong di sekeliling widget anaknya.
    - Column: Menyusun widget anak secara vertikal.
    - Row: Menyusun widget anak secara horizontal (untuk mensejajarkan 3 InfoCard).
    - SizedBox: Memberikan jarak kosong dengan ukuran tetap antar-widget.
    - Center: Memosisikan widget anaknya di tengah area yang tersedia.
    - GridView.count: Menampilkan daftar widget anak dalam tata letak kisi (3 kolom).
    - InfoCard: Custom StatelessWidget untuk menampilkan kartu identitas pemilik (NPM, Name, Class).
    - Card: Kontainer bergaya kartu Material dengan sudut membulat dan bayangan (elevation).
    - Container: Pembungkus serbaguna untuk mengatur lebar, padding, dan tata letak.
    - ItemCard: Custom StatelessWidget untuk menampilkan kartu tombol aksi beserta ikon dan labelnya.
    - Material: Memberikan permukaan visual Material Design seperti warna latar dan sudut melengkung.
    - InkWell: Memberikan respons sentuhan (onTap) beserta efek riak (ripple effect).
    - Icon: Menampilkan ikon grafis dari pustaka Material Icons.
    - SnackBar: Menampilkan pesan notifikasi sementara di bagian bawah layar melalui ScaffoldMessenger.

3. **Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai *root widget* pada aplikasi Flutter!**
   MaterialApp berfungsi sebagai pembungkus tingkat atas yang menyediakan konfigurasi dasar aplikasi bergaya Material Design, seperti pengaturan tema global (ThemeData dan ColorScheme), navigasi antarhalaman (Navigator), lokalisasi, serta akses ke ScaffoldMessenger dan MediaQuery. Widget ini digunakan sebagai root widget karena hampir seluruh widget UI bawaan Flutter (seperti Scaffold, AppBar, Card, dan SnackBar) bergantung pada tema dan konteks Material yang disediakan oleh MaterialApp.

4. **Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?**
   StatelessWidget adalah widget statis yang tidak memiliki state internal yang berubah setelah dibangun; tampilannya hanya bergantung pada data awal dari konstruktor. Sebaliknya, StatefulWidget memiliki objek State yang dapat menyimpan data dinamis dan memperbarui tampilan melalui setState() saat aplikasi berjalan.
   StatelessWidget dipilih untuk antarmuka yang tetap dan tidak berubah secara lokal (seperti MyHomePage, InfoCard, dan ItemCard), sedangkan StatefulWidget dipilih jika UI perlu berubah secara dinamis akibat interaksi pengguna atau data asinkron (seperti input form, counter, atau data dari API).

5. **Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?**
   BuildContext adalah objek alamat yang bisa menunjukkan lokasi spesifik suatu widget di dalam widget tree. BuildContext penting karena memungkinkan sebuah widget mengakses informasi dari widget leluhur (ancestor) di atasnya. Di dalam metode build pada proyek ini, context digunakan pada pemanggilan Theme.of(context) untuk mengambil warna tema, MediaQuery.of(context) untuk membaca lebar layar, dan ScaffoldMessenger.of(context) untuk menampilkan SnackBar.

6. **Jelaskan konsep *hot reload* di Flutter dan apa perbedaannya dengan *hot restart*! Kapan kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan *hot restart* atau *full restart*?**
   Hot reload memasukkan perubahan kode Dart langsung ke Dart VM yang sedang berjalan dan membangun ulang widget tree dengan cepat tanpa mereset state aplikasi. Sedangkan hot restart mengompilasi ulang kode Dart dan memulai ulang aplikasi dari fungsi main(), sehingga seluruh state direset ke awal.
   Hot reload tidak bisa diandalkan dan harus diganti dengan hot restart saat mengubah variabel global, properti static, fungsi main(), mengubah StatelessWidget menjadi StatefulWidget (atau sebaliknya), serta mengubah initState(). Sementara itu, full restart diperlukan saat menambah package/aset baru di pubspec.yaml atau mengubah kode native Android/iOS.

---
### Tugas 8

1. **Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi `Home` di drawer membawa pengguna kembali ke halaman utama.**
* Navigator.push() menambahkan route baru di atas stack navigasi sehingga halaman sebelumnya tetap tersimpan di bawahnya dan pengguna dapat kembali dengan tombol Back. Sedangkan Navigator.pushReplacement() menggantikan route yang sedang aktif di puncak stack dengan route baru tanpa menumpuk halaman lama. Navigator.pop() menghapus route paling atas dari stack untuk kembali ke route sebelumnya.
* Untuk membuka formulir dari kartu aksi, digunakan Navigator.push() agar pengguna bisa kembali lagi ke halaman utama dengan tombol Back. Sementara itu, opsi Home di LeftDrawer menggunakan Navigator.pushReplacement() ke MyHomePage() untuk menggantikan halaman formulir yang sedang dibuka dengan halaman utama.

2. **Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**
* Scaffold menyediakan template yang menempatkan AppBar di bagian atas, drawer di sisi kiri, dan konten utama pada body sehingga setiap halaman memiliki posisi bilah judul dan akses menu navigasi yang seragam dengan menggunakan komponen LeftDrawer.
* Contoh penggunaan warna tema portofolio di lebih dari satu halaman adalah `Theme.of(context).colorScheme.primary` (yang berasal dari `seedColor: Colors.indigo` pada `ThemeData` di `lib/main.dart`) yang dipakai pada `backgroundColor` milik `AppBar` di halaman utama (`lib/screens/menu.dart`) maupun pada `AppBar` dan `ElevatedButton` di halaman formulir pengalaman (`lib/screens/experience_form.dart`).

3. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**
* Tata letak Form yang membungkus SingleChildScrollView dan Column dipilih agar seluruh kolom input tersusun rapi secara vertikal dari atas ke bawah sekaligus dapat digulir saat melebihi tinggi layar.
* Widget pengatur jarak memberi ruang napas di sekeliling setiap input dan tombol agar elemen tidak saling menempel dan nyaman disentuh. Sementara itu, widget penggulir mencegah error overflow saat ruang layar sempit (seperti layar selebar ponsel) atau ketika papan ketik muncul menutupi sebagian layar, sehingga seluruh input dan tombol simpan tetap dapat dijangkau dengan menggulir layar.

4. **Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol `Simpan` ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**
* GlobalKey<FormState> menjadi penghubung untuk mengakses dan mengendalikan state Form dari luar widget Form. Ketika tombol Simpan ditekan, `_formKey.currentState!.validate()` memicu fungsi `validator` pada setiap field di dalam form. Jika ada `validator` yang mengembalikan string pesan error, validasi gagal dan pesan kesalahan langsung ditampilkan di bawah kolom terkait.
* Contoh nilai yang ditolak oleh validasi adalah input yang hanya berisi spasi atau pemilihan tanggal selesai yang lebih awal daripada mulai. Memilih jenis input atau tipe papan ketik saja belum cukup karena hanya membantu kemudahan pengetikan atau membatasi karakter awal, tetapi tidak dapat menjamin aturan bisnis seperti isian wajib tidak kosong, batas panjang teks, maupun hubungan logis antar-field seperti urutan tanggal.

---
### Tugas 8