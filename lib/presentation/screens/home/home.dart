import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:games_api/presentation/screens/favorite/favorite.dart';
import 'package:games_api/presentation/screens/search/search.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              _buildTabs(),
              const SizedBox(height: 80.0),
              _buildGameCardList(),
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

  Widget _buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTab('Populares', isSelected: true),
        _buildTab('Novedades'),
        _buildTab('Recomendados'),
      ],
    );
  }

  Widget _buildTab(String text, {bool isSelected = false}) {
    return Column(
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
    );
  }

  Widget _buildGameCardList() {
    return SizedBox(
      height: 396, // Especificar la altura de la lista
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCard('assets/imgOnboarding.png', 'Fortnite'),
          _buildCard('assets/imgOnboarding_two.png', 'Apex Legends'),
          _buildCard('assets/imgOnboarding_three.png', 'Valorant'),
        ],
      ),
    );
  }

  Widget _buildCard(String imagePath, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 292,
      height: 396,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(26.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
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