# manhaj_books

## 1. Widget Stateless vs. Widget Stateful
### Apa Itu Widget Stateless dan Stateful?
- **Stateless Widget**: Widget yang tidak mempertahankan state apa pun. Widget ini hanya di-render sekali dan tidak dapat diperbarui selama runtime. Ideal untuk konten statis yang tidak berubah, seperti teks atau gambar.
- **Stateful Widget**: Widget yang dapat mempertahankan dan memperbarui state-nya seiring waktu. Widget ini dinamis dan dapat merespons interaksi pengguna atau perubahan lainnya selama runtime.

### Perbedaan Antara Stateless dan Stateful Widget
| Jenis               | Deskripsi                                                                                             | Contoh Penggunaan                      |
|---------------------|-------------------------------------------------------------------------------------------------------|----------------------------------------|
| **Stateless**       | Tidak berubah seiring waktu; UI bersifat tetap setelah dibangun.                                       | Layar statis, ikon, label              |
| **Stateful**        | Dapat memperbarui tampilannya secara dinamis; UI dapat berubah sesuai state internal atau aksi pengguna. | Formulir, animasi, konten dinamis      |

---

## 2. Widget yang Digunakan dalam Proyek Ini
### Daftar Widget dan Fungsinya
- **Text**: Digunakan untuk menampilkan teks sederhana di layar.
- **Container**: Widget serbaguna untuk menambahkan padding, margin, border, dan warna.
- **Row dan Column**: Digunakan untuk mengatur widget anak secara horizontal atau vertikal.
- **ListView**: Memungkinkan pengguna untuk menggulir daftar item.
- **Button Widgets (misalnya, ElevatedButton)**: Untuk elemen interaktif yang dapat diklik oleh pengguna.

Setiap widget dipilih dengan hati-hati untuk memastikan pengalaman pengguna yang optimal dan fungsionalitas yang baik.

---

## 3. Fungsi `setState()`
### Tujuan `setState()`
Fungsi `setState()` digunakan untuk memperbarui UI dengan memicu widget untuk di-render ulang. Ketika ada perubahan state, `setState()` memastikan bahwa widget mencerminkan data atau state terbaru.

### Variabel yang Dipengaruhi oleh `setState()`
Variabel apa pun yang digunakan untuk mempertahankan state dalam **StatefulWidget** dapat dipengaruhi oleh `setState()`. Contoh umum termasuk penghitung, data formulir, atau data apa pun yang dapat berubah selama siklus hidup widget.

---

## 4. Perbedaan Antara `const` dan `final`
| Kata Kunci | Deskripsi                                                                                         |
|------------|---------------------------------------------------------------------------------------------------|
| **const**  | Tetap di waktu kompilasi. Digunakan untuk nilai yang diketahui di waktu kompilasi dan tidak berubah.      |
| **final**  | Tetap setelah diatur sekali. Digunakan untuk nilai yang ditentukan di waktu runtime tetapi tetap konstan. |

**Contoh**:
```dart
const pi = 3.14; // Konstanta yang diketahui di waktu kompilasi
final currentTime = DateTime.now(); // Diatur sekali di waktu runtime, tetap konstan
```
## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

- saya membuat program Flutter baru sesuai tugas web pada saat sebelum UTS yaitu manhaj-books
dengan command :
```bash
flutter create manhaj_books
```

- mencoba menjalankan program manhaj_books di device android saya sendiri dengan mengaktifkan developer options pada android device dan memasang kabel yang menyatukan device android dengan laptop
- membuat widget berupa 3 button yaitu LihatDaftarProduk(beserta icon bawaan), TambahProduk(beserta icon bawaan), Logout(beserta icon bawaan), berikut adalah design beserta code dari ketiga button, yang sudah mengimplementasi fungsi showSnackbar:

![alt text](/README_pictures/button_3.png)


```dart
children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                showSnackbar(context, 'Kamu telah menekan tombol Lihat Daftar Produk', Icons.list);
              },
              icon: Icon(Icons.list),
              label: Text('Lihat Daftar Produk'),
              style: ElevatedButton.styleFrom(
                <!-- backgroundColor: Color(0xFFE8B86D), -->
                minimumSize: Size(200, 40),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                showSnackbar(context, 'Kamu telah menekan tombol Tambah Produk', Icons.add);
              },
              icon: Icon(Icons.add),
              label: Text('Tambah Produk'),
              style: ElevatedButton.styleFrom(
                <!-- backgroundColor: Color(0xFFCEDF9F), -->
                minimumSize: Size(200, 40),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                showSnackbar(context, 'Kamu telah menekan tombol Logout', Icons.logout);
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                <!-- backgroundColor: Color(0xFFFF8080), -->
                minimumSize: Size(200, 40),
              ),
            ),
          ],
```

- memberi warna pada masing-masing tombol seperti code diatas pada baris yang dicomment

- memunculkan snackbar dengan pesan berbeda pada tiap tombol, berikut adalah snackbar yang dipakai oleh masing-masing tombol:
```dart
void showSnackbar(BuildContext context, String message, IconData icon) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          // Icon(icon, color: Colors.white), // Ikon dalam snackbar
          SizedBox(width: 10), // Jarak antara ikon dan teks
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFE8B86D), // Warna latar belakang snackbar
      behavior: SnackBarBehavior.floating, // Agar snackbar melayang
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Radius agar terlihat lebih modern
      ),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.green,
        onPressed: () {
          // Tindakan ketika tombol OK pada Snackbar ditekan
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
```

- selesai menjawab semua checklist

# Tugas 8
### 1.) Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?

`const` di Flutter digunakan untuk menandai sebuah nilai atau widget sebagai konstanta yang tidak akan berubah selama runtime aplikasi. Penggunaan `const` dapat membantu meningkatkan efisiensi dan kinerja aplikasi karena objek yang ditandai sebagai `const` hanya akan diinisialisasi sekali dan tidak akan di-render ulang setiap kali aplikasi di-rebuild.

**Keuntungan menggunakan `const`:**
- Menghemat memori karena objek `const` hanya dibuat sekali.
- Meningkatkan performa aplikasi, terutama saat rebuild, karena widget `const` tidak perlu dibuat ulang.
  
**Kapan sebaiknya `const` digunakan:**
- Gunakan `const` pada widget atau nilai yang sudah pasti tidak akan berubah selama runtime.
- Contoh umum adalah teks statis atau gaya visual yang tidak dinamis.

**Kapan sebaiknya `const` tidak digunakan:**
- Hindari `const` pada widget atau variabel yang perlu diperbarui atau berubah selama runtime, seperti data dinamis dari API atau input pengguna.

### 2.) Jelaskan dan bandingkan penggunaan `Column` dan `Row` pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

`Column` dan `Row` adalah widget layout pada Flutter yang digunakan untuk menempatkan widget anak (child) dalam arah vertikal (`Column`) atau horizontal (`Row`).

- **Column**: Menyusun widget dalam arah vertikal (dari atas ke bawah). Berguna untuk layout seperti daftar, form, atau tampilan bertumpuk.
- **Row**: Menyusun widget dalam arah horizontal (dari kiri ke kanan). Cocok untuk layout baris, seperti tombol navigasi horizontal atau ikon bersebelahan.

**Contoh Implementasi:**

```dart
// Contoh Column dan row
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('teks pertama'),
    Text('teks kedua'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Button')
    ),
  ],
);

Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Icon(Icons.home),
    Icon(Icons.settings),
  ],
);
```
### 3.) Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Pada tugas ini, elemen input yang digunakan di halaman form adalah:
- **TextFormField**: Digunakan untuk input nama pelanggan, judul buku, dan deskripsi.
- **Slider**: Digunakan untuk memilih jumlah item (amount).

**Elemen input Flutter lainnya yang tidak digunakan pada tugas ini:**
- **Checkbox**: Digunakan untuk pilihan `true/false` atau `yes/no`, misalnya untuk memilih opsi yang dapat dinonaktifkan atau diaktifkan.
- **Radio Button**: Berguna untuk pilihan eksklusif di antara beberapa opsi, misalnya untuk memilih salah satu dari beberapa opsi kategori.
- **Switch**: Digunakan untuk pengaturan yang memiliki status on/off atau enabled/disabled.
- **DropdownButton**: Menampilkan daftar pilihan dalam format dropdown, cocok untuk pilihan yang memiliki banyak opsi namun hanya satu yang bisa dipilih.

Setiap elemen input ini memiliki kegunaan yang spesifik tergantung jenis data yang akan dimasukkan, dan dapat diterapkan sesuai kebutuhan aplikasi.

### 4.) Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Ya benar saya menggunakan Theme pada rpogram saya.Untuk menjaga konsistensi tampilan di seluruh aplikasi, tema (theme) diatur menggunakan `ThemeData` pada level aplikasi melalui `MaterialApp`. Tema ini berfungsi untuk mengatur warna, gaya teks, dan elemen lainnya secara konsisten di semua halaman aplikasi. 

Contoh penerapan tema dalam aplikasi ini sebagai berikut:

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xF1F3C2)),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'EagleLake',
      ),
    ),
  ),
);
```

### 5.) Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Pada Flutter, navigasi antar halaman dilakukan dengan menggunakan `Navigator` dan `MaterialPageRoute`. `Navigator` menyediakan metode `push` untuk berpindah ke halaman baru dan `pop` untuk kembali ke halaman sebelumnya, sehingga memungkinkan navigasi yang dinamis di antara halaman-halaman aplikasi.

Contoh implementasi navigasi dalam aplikasi ini adalah sebagai berikut:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const AddItemPage())
);
```
# **Tugas 9**

## **1.)Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?**

Membuat model untuk menangani data JSON sangat penting karena alasan berikut:
1. **Konsistensi Data**: Model memastikan bahwa struktur dan tipe data JSON tetap konsisten di seluruh aplikasi.
2. **Kemudahan Penggunaan**: Model mempermudah manipulasi data tanpa harus mem-parsing JSON secara manual setiap saat.
3. **Penanganan Error**: Dengan model, masalah seperti field yang hilang atau tipe data yang salah dapat terdeteksi lebih awal.

Jika model tidak digunakan, kemungkinan akan terjadi error seperti `NoSuchMethodError` atau kesalahan tipe data saat mencoba mengakses data JSON yang tidak terstruktur atau tidak konsisten.

## **2.)Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini**
---
## **Fungsi Library `http`**

Library `http` yang saya gunakan bertujuan untuk:
1. **Mengirim Permintaan (Request)**: Mendukung pengiriman request GET, POST, PUT, dan DELETE untuk berinteraksi dengan API.
2. **Menerima Respon**: Memberikan respon terstruktur, termasuk status code dan konten body.
3. **Penanganan Error**: Membantu menangani error yang terkait dengan jaringan seperti timeout atau unauthorized access.

---

## **3.)Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
## **Fungsi `CookieRequest`**

`CookieRequest` digunakan untuk mengelola request HTTP dalam aplikasi dengan kemampuan berikut:
1. **Manajemen Sesi**: Mempertahankan cookie sesi untuk autentikasi, memungkinkan status login tetap aktif.
2. **State yang Dibagikan**: Membagikan status autentikasi yang sama ke semua komponen di aplikasi.
3. **Permintaan Sederhana**: Secara otomatis menyertakan cookie sesi dalam setiap permintaan berikutnya.

Membagikan satu instance `CookieRequest` memastikan bahwa status autentikasi konsisten di seluruh aplikasi.

---

## **4.)Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.**
## **Alur Data: Dari Input hingga Ditampilkan**

1. **Input Pengguna**: Pengguna memasukkan data melalui form di aplikasi (misalnya, form reservasi).
2. **Validasi Data**: Data input divalidasi menggunakan mekanisme form Flutter.
3. **Permintaan API**: Data valid diserialisasi menjadi JSON dan dikirim ke backend Django menggunakan `CookieRequest`.
4. **Proses Backend**: Backend memproses permintaan, menyimpan data ke database, dan mengembalikan respon.
5. **Tampilan Data**: Aplikasi mengambil data dari backend (via GET request) dan memperbarui antarmuka pengguna (UI).

---

## **5.)Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**
## **Mekanisme Autentikasi**

1. **Login**:
   - Pengguna memasukkan kredensial.
   - Aplikasi mengirimkan kredensial ke backend Django melalui POST request.
   - Backend memverifikasi kredensial dan mengembalikan token sesi jika valid.
   - Aplikasi menyimpan token dan mengarahkan pengguna ke halaman utama.
   
2. **Registrasi**:
   - Pengguna mengisi form registrasi.
   - Aplikasi mengirimkan data ke backend untuk pembuatan akun pengguna.
   - Backend mengembalikan respon sukses atau gagal.

3. **Logout**:
   - Pengguna menekan tombol logout.
   - Aplikasi mengirim POST request ke endpoint logout.
   - Backend menghapus sesi, dan aplikasi mengarahkan pengguna ke halaman login.

---
## **6.)Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**
Berikut adalah langkah-langkah implementasi checklist berdasarkan file yang telah diberikan:

---

## **1. Implementasi Login**
File terkait: `login.dart`

### **Langkah-langkah**
1. **Buat Form Login**
   - Gunakan `TextFormField` untuk input username dan password.
   - Tambahkan validasi input untuk memastikan data tidak kosong.

2. **Kirim Data ke Backend**
   - Ambil data dari `TextEditingController`.
   - Gunakan metode `CookieRequest` untuk mengirim POST request ke endpoint login di Django.
   - Contoh pengiriman:
     ```dart
     final response = await request.login(
       "http://127.0.0.1:8000/auth/login/",
       {
         "username": _usernameController.text,
         "password": _passwordController.text,
       }
     );
     ```

3. **Tangani Respon**
   - Tampilkan pesan sukses atau error menggunakan `SnackBar`.
   - Jika sukses, arahkan pengguna ke halaman utama menggunakan `Navigator`.

---

## **2. Implementasi Registrasi**
File terkait: `register.dart`

### **Langkah-langkah**
1. **Buat Form Registrasi**
   - Tambahkan field untuk username, password, dan konfirmasi password.
   - Validasi:
     - Pastikan semua field tidak kosong.
     - Password dan konfirmasi password harus sama.

2. **Kirim Data ke Backend**
   - Kirim data dengan `CookieRequest.postJson` ke endpoint registrasi Django.
   - Contoh pengiriman:
     ```dart
     final response = await request.postJson(
       "http://127.0.0.1:8000/auth/register/",
       jsonEncode({
         "username": username,
         "password1": password1,
         "password2": password2,
       })
     );
     ```

3. **Tangani Respon**
   - Jika sukses, arahkan ke halaman login.
   - Tampilkan pesan notifikasi menggunakan `SnackBar`.

---

## **3. Halaman Utama dan Drawer**
File terkait: `left_drawer.dart`, `main.dart`

### **Langkah-langkah**
1. **Tambahkan `Drawer`**
   - Gunakan widget `Drawer` di `left_drawer.dart`.
   - Tambahkan item menu seperti "Tambah Item", "Lihat Pesanan", dan "Halaman Utama".
   - Gunakan `Navigator.push` atau `Navigator.pushReplacement` untuk berpindah halaman.

2. **Integrasikan Drawer ke Halaman Utama**
   - Masukkan widget `LeftDrawer` ke properti `drawer` di `Scaffold` pada halaman utama (`main.dart`).

---

## **4. Formulir Reservasi**
File terkait: `res_form.dart`

### **Langkah-langkah**
1. **Buat Formulir**
   - Tambahkan `TextFormField` untuk input nama pelanggan, judul buku, dan deskripsi.
   - Gunakan widget `Slider` untuk input jumlah.

2. **Validasi Input**
   - Pastikan semua field terisi.
   - Tambahkan validasi khusus, seperti nama tidak boleh mengandung angka.

3. **Tampilkan Dialog**
   - Setelah form berhasil divalidasi, tampilkan dialog yang menampilkan data input menggunakan `AlertDialog`.

---

## **5. Daftar Reservasi**
File terkait: `list_reservation.dart`

### **Langkah-langkah**
1. **Ambil Data dari Backend**
   - Gunakan `CookieRequest` untuk mengirim GET request ke endpoint Django.
   - Contoh pengambilan data:
     ```dart
     final response = await request.get("http://127.0.0.1:8000/api/reservations/");
     ```

2. **Tampilkan Data**
   - Gunakan widget seperti `ListView` untuk menampilkan daftar reservasi.
   - Format data menjadi kartu atau list item yang dapat diklik.

---

## **6. Logout**
File terkait: `res_card.dart`, `left_drawer.dart`

### **Langkah-langkah**
1. **Buat Fungsi Logout**
   - Tambahkan tombol logout di drawer atau halaman utama.
   - Gunakan `CookieRequest.logout` untuk menghapus sesi di backend.
   - Contoh implementasi:
     ```dart
     final response = await request.logout("http://127.0.0.1:8000/auth/logout/");
     ```

2. **Tangani Respon**
   - Tampilkan notifikasi logout menggunakan `SnackBar`.
   - Arahkan pengguna ke halaman login dengan `Navigator.pushReplacement`.

---