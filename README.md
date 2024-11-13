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
