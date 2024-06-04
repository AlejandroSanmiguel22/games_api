import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:games_api/presentation/screens/home/home.dart';
import 'package:games_api/presentation/screens/search/search.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedTabIndex = 0;

  final Map<String, List<Map<String, String>>> _imagesByTab = {
    'Aventura': [
      {'name': 'Aventura Game 1', 'image': 'assets/imgOnboarding.png'},
      {'name': 'Aventura Game 2', 'image': 'assets/imgOnboarding.png'},
    ],
    'Shooter': [
      {'name': 'Shooter Game 1', 'image': 'assets/imgOnboarding_two.png'},
      {'name': 'Shooter Game 2', 'image': 'assets/imgOnboarding_two.png'},
    ],
    'Terror': [
      {'name': 'Horror Game 1', 'image': 'assets/imgOnboarding_three.png'},
      {'name': 'Horror Game 2', 'image': 'assets/imgOnboarding_three.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 25.0),
              Expanded(child: _buildImages()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Favoritos',
      style: GoogleFonts.dmSans(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTab(String text, {required int index}) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            text,
            style: GoogleFonts.dmSans(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              height: 2.0,
              width: 40.0,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }

  Widget _buildImages() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _imagesByTab.keys.map((tab) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tab,
                style: GoogleFonts.dmSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _imagesByTab[tab]!.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          _imagesByTab[tab]![index]['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0,
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            _imagesByTab[tab]![index]['name']!,
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20.0),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: const Color(0xFF1F1F1F),
      color: const Color(0xFF333333),
      buttonBackgroundColor: Colors.blue,
      height: 60,
      items: const <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.favorite, size: 30, color: Colors.white),
        Icon(Icons.message, size: 30, color: Colors.white),
        Icon(Icons.local_cafe, size: 30, color: Colors.white),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoritePage()),
          );
        }else if(index == 2){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        }
      },
    );
  }
}
