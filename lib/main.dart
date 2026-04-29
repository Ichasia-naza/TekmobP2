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
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFF3E5F5),
      ),
      home: const ProfilePage(),
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
        title: const Text("Lilac Profile"),
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

          const Text(
            "Mahasiswa 💜",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hobi"),
                      Text("Design & Coding"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Status"),
                      Text("Learning Flutter"),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Image.network("https://picsum.photos/300", height: 150),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 183, 149, 189),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MoodPage()),
              );
            },
            child: const Text("Lihat Mood Hari Ini"),
          ),
        ],
      ),
    );
  }
}

// ================== STATEFUL (MOOD) ==================
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
        title: const Text("Mood Tracker"),
        backgroundColor: Colors.purple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Mood Level: $moodLevel",
              style: const TextStyle(fontSize: 22),
            ),

            Slider(
              value: moodLevel.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  moodLevel = value.toInt();
                });
              },
            ),

            const SizedBox(height: 20),

            Switch(
              value: isHappy,
              onChanged: (value) {
                setState(() {
                  isHappy = value;
                });
              },
            ),

            const SizedBox(height: 10),

            Icon(
              isHappy ? Icons.sentiment_satisfied : Icons.sentiment_dissatisfied,
              size: 50,
              color: Colors.purple,
            ),

            const SizedBox(height: 20),

            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),

            const Text("Saya merasa baik hari ini"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Mood tersimpan! 💜")),
                );
              },
              child: const Text("Simpan Mood"),
            ),
          ],
        ),
      ),
    );
  }
}