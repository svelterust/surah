import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surah',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(title: 'Surahs'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> surahs = [
    {'name': 'Al-Fatihah', 'meaning': 'The Opening'},
    {'name': 'Al-Baqarah', 'meaning': 'The Cow'},
    {'name': 'Al-Imran', 'meaning': 'The Family of Imran'},
    {'name': 'An-Nisa', 'meaning': 'The Women'},
    {'name': 'Al-Maidah', 'meaning': 'The Table Spread'},
    {'name': 'Al-Anam', 'meaning': 'The Cattle'},
    {'name': 'Al-Araf', 'meaning': 'The Heights'},
    {'name': 'Al-Anfal', 'meaning': 'The Spoils of War'},
    {'name': 'At-Tawbah', 'meaning': 'The Repentance'},
    {'name': 'Yunus', 'meaning': 'Jonah'},
    {'name': 'Hud', 'meaning': 'Hud'},
    {'name': 'Yusuf', 'meaning': 'Joseph'},
    {'name': 'Ar-Rad', 'meaning': 'The Thunder'},
    {'name': 'Ibrahim', 'meaning': 'Abraham'},
    {'name': 'Al-Hijr', 'meaning': 'The Rocky Tract'},
    {'name': 'An-Nahl', 'meaning': 'The Bee'},
    {'name': 'Al-Isra', 'meaning': 'The Night Journey'},
    {'name': 'Al-Kahf', 'meaning': 'The Cave'},
    {'name': 'Maryam', 'meaning': 'Mary'},
    {'name': 'Ta-Ha', 'meaning': 'Ta-Ha'},
    {'name': 'Al-Anbiya', 'meaning': 'The Prophets'},
    {'name': 'Al-Hajj', 'meaning': 'The Pilgrimage'},
    {'name': 'Al-Muminun', 'meaning': 'The Believers'},
    {'name': 'An-Nur', 'meaning': 'The Light'},
    {'name': 'Al-Furqan', 'meaning': 'The Criterion'},
    {'name': 'Ash-Shuara', 'meaning': 'The Poets'},
    {'name': 'An-Naml', 'meaning': 'The Ant'},
    {'name': 'Al-Qasas', 'meaning': 'The Stories'},
    {'name': 'Al-Ankabut', 'meaning': 'The Spider'},
    {'name': 'Ar-Rum', 'meaning': 'The Romans'},
    {'name': 'Luqman', 'meaning': 'Luqman'},
    {'name': 'As-Sajdah', 'meaning': 'The Prostration'},
    {'name': 'Al-Ahzab', 'meaning': 'The Combined Forces'},
    {'name': 'Saba', 'meaning': 'Sheba'},
    {'name': 'Fatir', 'meaning': 'The Originator'},
    {'name': 'Ya-Sin', 'meaning': 'Ya Sin'},
    {'name': 'As-Saffat', 'meaning': 'Those Ranged in Ranks'},
    {'name': 'Sad', 'meaning': 'The Letter Sad'},
    {'name': 'Az-Zumar', 'meaning': 'The Groups'},
    {'name': 'Ghafir', 'meaning': 'The Forgiver'},
    {'name': 'Fussilat', 'meaning': 'Explained in Detail'},
    {'name': 'Ash-Shura', 'meaning': 'The Consultation'},
    {'name': 'Az-Zukhruf', 'meaning': 'The Gold Adornments'},
    {'name': 'Ad-Dukhan', 'meaning': 'The Smoke'},
    {'name': 'Al-Jathiyah', 'meaning': 'The Kneeling'},
    {'name': 'Al-Ahqaf', 'meaning': 'The Wind-Curved Sandhills'},
    {'name': 'Muhammad', 'meaning': 'Muhammad'},
    {'name': 'Al-Fath', 'meaning': 'The Victory'},
    {'name': 'Al-Hujurat', 'meaning': 'The Rooms'},
    {'name': 'Qaf', 'meaning': 'The Letter Qaf'},
    {'name': 'Adh-Dhariyat', 'meaning': 'The Winnowing Winds'},
    {'name': 'At-Tur', 'meaning': 'The Mount'},
    {'name': 'An-Najm', 'meaning': 'The Star'},
    {'name': 'Al-Qamar', 'meaning': 'The Moon'},
    {'name': 'Ar-Rahman', 'meaning': 'The Most Gracious'},
    {'name': 'Al-Waqiah', 'meaning': 'The Inevitable'},
    {'name': 'Al-Hadid', 'meaning': 'The Iron'},
    {'name': 'Al-Mujadilah', 'meaning': 'The Pleading Woman'},
    {'name': 'Al-Hashr', 'meaning': 'The Exile'},
    {'name': 'Al-Mumtahanah', 'meaning': 'The Woman to be Examined'},
    {'name': 'As-Saff', 'meaning': 'The Ranks'},
    {'name': 'Al-Jumuah', 'meaning': 'Friday'},
    {'name': 'Al-Munafiqun', 'meaning': 'The Hypocrites'},
    {'name': 'At-Taghabun', 'meaning': 'Mutual Disillusion'},
    {'name': 'At-Talaq', 'meaning': 'Divorce'},
    {'name': 'At-Tahrim', 'meaning': 'The Prohibition'},
    {'name': 'Al-Mulk', 'meaning': 'The Sovereignty'},
    {'name': 'Al-Qalam', 'meaning': 'The Pen'},
    {'name': 'Al-Haqqah', 'meaning': 'The Reality'},
    {'name': 'Al-Maarij', 'meaning': 'The Ascending Stairways'},
    {'name': 'Nuh', 'meaning': 'Noah'},
    {'name': 'Al-Jinn', 'meaning': 'The Jinn'},
    {'name': 'Al-Muzzammil', 'meaning': 'The Enshrouded One'},
    {'name': 'Al-Muddaththir', 'meaning': 'The Cloaked One'},
    {'name': 'Al-Qiyamah', 'meaning': 'The Resurrection'},
    {'name': 'Al-Insan', 'meaning': 'Man'},
    {'name': 'Al-Mursalat', 'meaning': 'Those Sent Forth'},
    {'name': 'An-Naba', 'meaning': 'The Great News'},
    {'name': 'An-Naziat', 'meaning': 'Those Who Drag Forth'},
    {'name': 'Abasa', 'meaning': 'He Frowned'},
    {'name': 'At-Takwir', 'meaning': 'The Overthrowing'},
    {'name': 'Al-Infitar', 'meaning': 'The Cleaving'},
    {'name': 'Al-Mutaffifin', 'meaning': 'Defrauding'},
    {'name': 'Al-Inshiqaq', 'meaning': 'The Splitting Open'},
    {'name': 'Al-Buruj', 'meaning': 'The Constellations'},
    {'name': 'At-Tariq', 'meaning': 'The Night Comer'},
    {'name': 'Al-Ala', 'meaning': 'The Most High'},
    {'name': 'Al-Ghashiyah', 'meaning': 'The Overwhelming'},
    {'name': 'Al-Fajr', 'meaning': 'The Dawn'},
    {'name': 'Al-Balad', 'meaning': 'The City'},
    {'name': 'Ash-Shams', 'meaning': 'The Sun'},
    {'name': 'Al-Lail', 'meaning': 'The Night'},
    {'name': 'Ad-Duha', 'meaning': 'The Morning Hours'},
    {'name': 'Ash-Sharh', 'meaning': 'The Relief'},
    {'name': 'At-Tin', 'meaning': 'The Fig'},
    {'name': 'Al-Alaq', 'meaning': 'The Clot'},
    {'name': 'Al-Qadr', 'meaning': 'The Power'},
    {'name': 'Al-Bayyinah', 'meaning': 'The Clear Proof'},
    {'name': 'Az-Zalzalah', 'meaning': 'The Earthquake'},
    {'name': 'Al-Adiyat', 'meaning': 'The Charging Steeds'},
    {'name': 'Al-Qariah', 'meaning': 'The Calamity'},
    {'name': 'At-Takathur', 'meaning': 'The Rivalry in World Increase'},
    {'name': 'Al-Asr', 'meaning': 'The Time'},
    {'name': 'Al-Humazah', 'meaning': 'The Slanderer'},
    {'name': 'Al-Fil', 'meaning': 'The Elephant'},
    {'name': 'Quraish', 'meaning': 'Quraish'},
    {'name': 'Al-Maun', 'meaning': 'Small Kindnesses'},
    {'name': 'Al-Kawthar', 'meaning': 'Abundance'},
    {'name': 'Al-Kafirun', 'meaning': 'The Disbelievers'},
    {'name': 'An-Nasr', 'meaning': 'The Help'},
    {'name': 'Al-Masad', 'meaning': 'The Palm Fiber'},
    {'name': 'Al-Ikhlas', 'meaning': 'Sincerity'},
    {'name': 'Al-Falaq', 'meaning': 'The Daybreak'},
    {'name': 'An-Nas', 'meaning': 'Mankind'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: surahs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  surahs[index]['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  surahs[index]['meaning']!,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
