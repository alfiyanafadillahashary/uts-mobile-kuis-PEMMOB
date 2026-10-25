import '../models/question.dart';

// Data dummy lokal (tanpa database)
const List<Question> questions = [
  Question(
    text: 'Bahasa pemrograman yang digunakan Flutter adalah...',
    options: ['Java', 'Kotlin', 'Dart', 'Swift'],
    answerIndex: 2,
  ),
  Question(
    text: 'Widget yang tampilannya tidak berubah setelah dibuat disebut...',
    options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'RenderWidget'],
    answerIndex: 1,
  ),
  Question(
    text: 'Method yang dipanggil untuk memperbarui UI pada StatefulWidget adalah...',
    options: ['update()', 'refresh()', 'setState()', 'rebuild()'],
    answerIndex: 2,
  ),
  Question(
    text: 'Widget untuk menyusun anak secara vertikal adalah...',
    options: ['Row', 'Column', 'Stack', 'Wrap'],
    answerIndex: 1,
  ),
  Question(
    text: 'File yang digunakan untuk mendaftarkan aset dan font di Flutter adalah...',
    options: ['main.dart', 'pubspec.yaml', 'build.gradle', 'README.md'],
    answerIndex: 1,
  ),
  Question(
    text: 'Class yang dipakai Provider agar UI diberi tahu saat data berubah adalah...',
    options: ['ChangeNotifier', 'StreamBuilder', 'FutureBuilder', 'Navigator'],
    answerIndex: 0,
  ),
  Question(
    text: 'MediaQuery digunakan untuk...',
    options: [
      'Mengambil data dari API',
      'Mengetahui ukuran layar',
      'Mengganti tema',
      'Berpindah halaman'
    ],
    answerIndex: 1,
  ),
  Question(
    text: 'Perintah untuk berpindah ke halaman baru adalah...',
    options: ['Navigator.push()', 'Navigator.start()', 'Router.go()', 'Page.open()'],
    answerIndex: 0,
  ),
];
