import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' show max;

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        scaffoldBackgroundColor: Colors.green[50],
        cardTheme: CardTheme(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomePage(title: 'Surah'),
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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;
  Set<int> _enabledSurahs = {};
  Set<int> _suggestedSurahs = {};
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _enabledSurahs =
          _prefs.getStringList('enabled_surahs')?.map(int.parse).toSet() ?? {};
      _suggestedSurahs =
          _prefs.getStringList('suggested_surahs')?.map(int.parse).toSet() ??
              {};
    });
  }

  Future<void> _toggleSurah(int index) async {
    setState(() {
      if (_enabledSurahs.contains(index)) {
        _enabledSurahs.remove(index);
      } else {
        _enabledSurahs.add(index);
      }
    });
    await _prefs.setStringList(
        'enabled_surahs', _enabledSurahs.map((e) => e.toString()).toList());
  }

  Future<void> _saveSuggestedState() async {
    await _prefs.setStringList(
        'suggested_surahs', _suggestedSurahs.map((e) => e.toString()).toList());
  }

  List<int> getRandomSurahs({int count = 2}) {
    // Get all enabled surahs that haven't been suggested yet
    List<int> availableSurahs =
        _enabledSurahs.where((i) => !_suggestedSurahs.contains(i)).toList();

    // If all enabled surahs have been suggested, reset suggested list
    if (availableSurahs.isEmpty) {
      _suggestedSurahs.clear();
      availableSurahs = _enabledSurahs.toList();
      _saveSuggestedState();
    }

    List<int> result = [];

    // If we have at least one new surah available
    if (availableSurahs.isNotEmpty) {
      availableSurahs.shuffle();
      result.add(availableSurahs[0]);
      _suggestedSurahs.add(availableSurahs[0]);
    }

    // If we need one more and have more available
    if (count > 1) {
      if (availableSurahs.length > 1) {
        result.add(availableSurahs[1]);
        _suggestedSurahs.add(availableSurahs[1]);
      } else {
        // If no more new surahs available, pick randomly from previously suggested
        List<int> suggestedPool =
            _enabledSurahs.where((i) => i != result[0]).toList();
        if (suggestedPool.isNotEmpty) {
          suggestedPool.shuffle();
          result.add(suggestedPool[0]);
        }
      }
    }

    _saveSuggestedState();
    return result;
  }

  Future<void> _resetState() async {
    setState(() {
      _enabledSurahs.clear();
      _suggestedSurahs.clear();
    });
    await _prefs.setStringList('enabled_surahs', []);
    await _prefs.setStringList('suggested_surahs', []);
  }

  void _showRecommendationModal(BuildContext context) {
    List<int> randomSurahs = getRandomSurahs();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Suggested Surahs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              if (_enabledSurahs.isEmpty)
                const Text(
                  'No surahs have been enabled yet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                )
              else
                ...randomSurahs.map((index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600],
                        ),
                      ),
                      onTap: () => _toggleSurah(index),
                    )),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> getFilteredSurahs() {
    if (_searchQuery.isEmpty) {
      return surahs;
    }
    return surahs.where((surah) {
      final name = surah['name']!.toLowerCase().replaceAll('-', ' ');
      final query = _searchQuery.toLowerCase().replaceAll('-', ' ');
      return name.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSurahs = getFilteredSurahs();
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchQuery = '';
                    _searchController.clear();
                  });
                },
              )
            : null,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              )
            : Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
        ],
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showRecommendationModal(context),
        backgroundColor: Colors.green,
        child: const Icon(Icons.shuffle),
      ),
      body: ListView.builder(
        itemCount: filteredSurahs.length,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (context, index) {
          final surah = filteredSurahs[index];
          final surahIndex = surahs.indexOf(surah);
          final isEnabled = _enabledSurahs.contains(surahIndex);

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isEnabled ? Colors.green : Colors.grey,
                child: Text(
                  '${surahs.indexOf(surah) + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                surah['name']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isEnabled ? Colors.green : Colors.black87,
                ),
              ),
              subtitle: Text(
                surah['meaning']!,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              trailing: Icon(
                isEnabled ? Icons.check_circle : Icons.check_circle_outline,
                color: isEnabled ? Colors.green : Colors.grey,
              ),
              onTap: () => _toggleSurah(surahIndex),
            ),
          );
        },
      ),
    );
  }
}
