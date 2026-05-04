import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lilac Mood App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFF3E5F5),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const MainPage(), // Menggunakan MainPage sebagai root
    );
  }
}

// ================== MAIN PAGE (WITH TABS) ==================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan
  final List<Widget> _pages = [
    const ProfilePage(),
    const StudentListSection(), // Halaman tugas Praktikum 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Mahasiswa"),
        ],
      ),
    );
  }
}

// ================== STATELESS (PROFILE) ==================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lilac Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[300],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.purple,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Text(
            "Nazacia Widian",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text("Mahasiswa 💜", textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Hobi"), Text("Design & Coding")],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Status"), Text("Learning Flutter")],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://picsum.photos/300", height: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 183, 149, 189),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MoodPage()),
              );
            },
            icon: const Icon(Icons.emoji_emotions),
            label: const Text("Lihat Mood Hari Ini"),
          ),
        ],
      ),
    );
  }
}

// ================== PRAKTIKUM 3: STUDENT LIST ==================
class StudentListSection extends StatelessWidget {
  const StudentListSection({super.key});

  final List<Map<String, String>> students = const [
    {"nama": "Helen Noy", "nim": "220101", "prodi": "Informatika"},
    {"nama": "Farah Amaliya", "nim": "220102", "prodi": "Sistem Informasi"},
    {"nama": "Citra Gita", "nim": "220103", "prodi": "Teknik Elektro"},
    {"nama": "Fathir Firmansyah", "nim": "220104", "prodi": "Informatika"},
    {"nama": "Famuh", "nim": "220105", "prodi": "Teknik Mesin"},
    {"nama": "Hafizan Zaky", "nim": "220106", "prodi": "Sistem Informasi"},
    {"nama": "Laura Olivia", "nim": "220107", "prodi": "Informatika"},
    {"nama": "Mokessa Della", "nim": "220108", "prodi": "Sistem Informasi"},
    {"nama": "Nabila Takiyah", "nim": "220109", "prodi": "Teknik Sipil"},
    {"nama": "Roni Parulian", "nim": "220110", "prodi": "Informatika"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Mahasiswa", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[300],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text("Data Mahasiswa", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Icon(Icons.filter_list, color: Colors.purple),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple[100],
                          child: Text(students[index]['nama']![0], style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(students[index]['nama']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("NIM: ${students[index]['nim']}", style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Text(students[index]['prodi']!, style: const TextStyle(color: Colors.purple, fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ================== STATEFUL (MOOD TRACKER) ==================
class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  int moodLevel = 5;
  bool isHappy = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Tracker", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Mood Level: $moodLevel", style: const TextStyle(fontSize: 22)),
            Slider(
              value: moodLevel.toDouble(),
              min: 0, max: 10, divisions: 10,
              onChanged: (value) => setState(() => moodLevel = value.toInt()),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Lagi happy?"),
                Switch(
                  value: isHappy,
                  onChanged: (value) => setState(() => isHappy = value),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Icon(
              isHappy ? Icons.sentiment_satisfied_alt : Icons.sentiment_dissatisfied,
              size: 80, color: Colors.purple,
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text("Saya merasa baik hari ini"),
              value: isChecked,
              onChanged: (value) => setState(() => isChecked = value!),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Mood tersimpan! 💜")),
                  );
                },
                child: const Text("Simpan Mood"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}