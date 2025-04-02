import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Pastikan ada 'const'
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(),
        primaryColor: Color(0xFF6A0DAD),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A0DAD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset('assets/logoo.png', width: 150, height: 150),
            ),
            SizedBox(height: 20),
            Text(
              'QuizIT',
              style: GoogleFonts.raleway(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuizIT", style: GoogleFonts.raleway()),
        backgroundColor: Color(0xFF6A0DAD),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset('assets/logoo.png', width: 150, height: 150),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFA500),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Mulai Quiz", style: GoogleFonts.raleway(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {"question": "Program Studi D4 Manajemen Informatika Vokasi di Universitas Negeri Surabaya berevolusi dari program studi apa?",
      "options": ["D3 Teknik Informatika", "D3 Manajemen Informatika", "D3 Rekayasa Perangkat Lunak", "D3 Sistem Informasi"],
      "answer": "D3 Manajemen Informatika"},

    {"question": "Apa saja bidang teknologi yang dipelajari dalam D4 Manajemen Informatika Vokasi?",
      "options": ["Akuntansi dan Manajemen Keuangan", "Pengembangan Aplikasi Desktop, Website, Mobile, Kecerdasan Buatan, dan Big Data", "Desain Grafis dan Multimedia", "Teknik Sipil dan Arsitektur"],
      "answer": "Pengembangan Aplikasi Desktop, Website, Mobile, Kecerdasan Buatan, dan Big Data"},

    {"question": "Salah satu fokus utama dalam kurikulum D4 Manajemen Informatika Vokasi adalah…",
      "options": ["Pemrograman dasar tanpa implementasi industri", "Arsitektur perangkat lunak yang modern dan efisien", "Desain komunikasi visual", "Pembuatan jaringan listrik"],
      "answer": "Arsitektur perangkat lunak yang modern dan efisien"},

    {"question": "Mahasiswa D4 Manajemen Informatika Vokasi dilatih untuk memahami dan mengimplementasikan…",
      "options": ["Teknik periklanan digital", "Arsitektur Microservice", "Manajemen sumber daya manusia", "Konstruksi bangunan"],
      "answer": "Arsitektur Microservice"},

    {"question": "Apa tujuan utama dari Program Studi D4 Manajemen Informatika Vokasi?",
      "options": ["Mencetak lulusan yang memiliki keahlian teknis serta soft skill untuk bersaing di dunia kerja", "Menghasilkan lulusan yang hanya fokus pada penelitian akademik", "Melatih mahasiswa menjadi teknisi listrik", "Menyiapkan mahasiswa menjadi dokter spesialis teknologi"],
      "answer": "Mencetak lulusan yang memiliki keahlian teknis serta soft skill untuk bersaing di dunia kerja"},

    {"question": "Lulusan dari Program Studi D4 Manajemen Informatika Vokasi dipersiapkan untuk berkarier sebagai…",
      "options": ["Arsitek dan desainer interior", "Software engineer, analis sistem, dan IT Preneur", "Ahli biologi dan dokter hewan", "Guru bahasa asing"],
      "answer": "Software engineer, analis sistem, dan IT Preneur"},

    {"question": "Salah satu aspek penting dalam pembelajaran di Program Studi D4 Manajemen Informatika Vokasi adalah…",
      "options": ["Mengembangkan perangkat lunak cerdas yang mampu beradaptasi dengan tren teknologi masa depan", "Mempelajari teknik pertanian dan perkebunan", "Meneliti sejarah peradaban kuno", "Fokus pada pembuatan konten media sosial"],
      "answer": "Mengembangkan perangkat lunak cerdas yang mampu beradaptasi dengan tren teknologi masa depan"},

    {"question": "Mengapa kurikulum D4 Manajemen Informatika Vokasi disesuaikan dengan perkembangan industri?",
      "options": ["Agar lulusan dapat memiliki keterampilan yang tidak relevan dengan dunia kerja", "Untuk memastikan mahasiswa memiliki kompetensi yang sesuai dengan kebutuhan industri dan bisnis saat ini", "Supaya mahasiswa lebih memahami sejarah teknologi kuno", "Agar mahasiswa lebih fokus pada bidang seni dan budaya"],
      "answer": "Untuk memastikan mahasiswa memiliki kompetensi yang sesuai dengan kebutuhan industri dan bisnis saat ini"},

    {"question": "Salah satu elemen penting dalam tridharma perguruan tinggi yang diterapkan di Program Studi D4 Manajemen Informatika Vokasi adalah…",
      "options": ["Pengajaran, penelitian, dan pengabdian masyarakat", "Pelatihan seni dan olahraga", "Studi tentang ilmu sosial dan politik", "Belajar tentang teori musik klasik"],
      "answer": "Pengajaran, penelitian, dan pengabdian masyarakat"},

    {"question": "Apa keunggulan utama lulusan D4 Manajemen Informatika Vokasi dibandingkan program lain?",
      "options": ["Hanya fokus pada teori tanpa praktik industri", "Memiliki keterampilan teknis yang kuat serta kemampuan soft skill untuk bersaing di era digital", "Lebih banyak mempelajari ilmu sosial dibandingkan teknologi", "Hanya bekerja di bidang administrasi perkantoran"],
      "answer": "Memiliki keterampilan teknis yang kuat serta kemampuan soft skill untuk bersaing di era digital"},
  ];

  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex]["answer"]) {
      score++;
    }
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(score: score, total: questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz"), backgroundColor: Color(0xFF6A0DAD)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Soal ${currentQuestionIndex + 1}/${questions.length}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              questions[currentQuestionIndex]["question"],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Column(
              children: questions[currentQuestionIndex]["options"].map<Widget>((option) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFA500),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () => checkAnswer(option),
                    child: Text(option, style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  ResultPage({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hasil Quiz"), backgroundColor: Color(0xFF6A0DAD)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Skor Anda: $score / $total",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF6A0DAD)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())),
              child: Text("Kembali ke Beranda"),
            )
          ],
        ),
      ),
    );
  }
}
