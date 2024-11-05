# manhaj_books

## 1. Stateless Widget vs. Stateful Widget
### What are Stateless and Stateful Widgets?
- **Stateless Widget**: A widget that does not maintain any state. It renders only once and cannot update itself during runtime. Ideal for static content that doesn’t change, such as text or images.
- **Stateful Widget**: A widget that can maintain and update its state over time. It is dynamic and can respond to user interaction or other runtime changes.

### Difference Between Stateless and Stateful Widgets
| Type               | Description                                                                                             | Use Cases                              |
|--------------------|---------------------------------------------------------------------------------------------------------|----------------------------------------|
| **Stateless**      | Does not change over time; the UI is immutable after being built.                                       | Static screens, icons, labels          |
| **Stateful**       | Can update its appearance dynamically; the UI can change in response to internal state or user actions. | Forms, animations, dynamic content     |

---

## 2. Widgets Used in This Project
### List of Widgets and Their Functions
- **Text**: Used to display simple text on the screen.
- **Container**: A versatile widget for adding padding, margins, borders, and colors.
- **Row and Column**: Used to arrange child widgets in horizontal or vertical alignments.
- **ListView**: Allows scrolling through a list of items.
- **Button Widgets (e.g., ElevatedButton)**: For interactive elements that users can click.

Each widget is carefully chosen to ensure an optimal user experience and functionality.

---

## 3. The `setState()` Function
### Purpose of `setState()`
The `setState()` function is used to update the UI by triggering a rebuild of the widget. When state changes, `setState()` ensures that the widget reflects the latest data or state.

### Variables Affected by `setState()`
Any variable used to maintain state within a **StatefulWidget** can be impacted by `setState()`. Common examples include counters, form data, or any data that can change during the widget's lifecycle.

---

## 4. Difference Between `const` and `final`
| Keyword  | Description                                                                                       |
|----------|---------------------------------------------------------------------------------------------------|
| **const** | Immutable at compile-time. Used for values that are known at compile time and do not change.      |
| **final** | Immutable after being set once. Used for values determined at runtime but should remain constant. |

**Example**:
```dart
const pi = 3.14; // Constant known at compile-time
final currentTime = DateTime.now(); // Set once at runtime, remains constant
```
## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

- saya membuat program Flutter baru sesuai tugas web pada saat sebelum UTS yaitu manhaj-books
dengan command flutter create manhaj_books

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