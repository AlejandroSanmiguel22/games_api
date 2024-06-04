import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:games_api/presentation/screens/favorite/favorite.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  List<Map<String, String>> games = [
    {'name': 'Fortnite', 'image': 'assets/imgOnboarding.png'},
    {'name': 'Apex Legends', 'image': 'assets/imgOnboarding_two.png'},
    {'name': 'Valorant', 'image': 'assets/imgOnboarding_three.png'},
    // Agrega más juegos según sea necesario
  ];

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
              _buildSearchBar(),
              const SizedBox(height: 25.0),
              _buildImages(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Explora',
      style: GoogleFonts.dmSans(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (value) {
        setState(() {
          searchText = value.toLowerCase();
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF333333),
        hintText: 'Buscar',
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildImages() {
    List<Map<String, String>> filteredGames = games.where((game) =>
        game['name']!.toLowerCase().contains(searchText)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: filteredGames.map((game) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Image.asset(
                game['image']!,
                width: 50,
                height: 50,
              ),
              SizedBox(width: 10),
              Text(
                game['name']!,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      }).toList(),
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
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritePage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        }
      },
    );
  }
}
