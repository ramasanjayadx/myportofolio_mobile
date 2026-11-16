
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