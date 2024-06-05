import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:games_api/presentation/screens/favorite/favorite.dart';
import 'package:games_api/presentation/screens/search/search.dart';
import 'package:games_api/presentation/screens/home/home.dart';

class AboutScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  const AboutScreen({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: SafeArea(
        child: SingleChildScrollView(
          // Add this to make the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGameImage(),
                const SizedBox(height: 25.0),
                _buildHeader(),
                const SizedBox(height: 0.2),
                _buildGenero(),
                const SizedBox(height: 2.0),
                _buildPlataformas(),
                const SizedBox(height: 25.0),
                _buildName(),
                const SizedBox(height: 6.0),
                _buildGameInfo(),
                const SizedBox(height: 125.0),
                _buildButton(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildGameImage() {
    return AspectRatio(
      aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
      child: Image.asset(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildGenero() {
    return Text(
      'Shooter',
      style: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildPlataformas() {
  return Row(
    children: [
      Text(
        '2024',
        style: GoogleFonts.dmSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(width: 1), // Ajustar el espacio entre el año y los logos
      _buildLogo('assets/psLogo.png'),
      SizedBox(width: 1), // Ajustar el espacio entre los logos
      _buildLogo('assets/xboxLogo.png'),
      SizedBox(width: 1), // Ajustar el espacio entre los logos
      _buildLogo('assets/microsoftLogo.png'),
    ],
  );
}

Widget _buildLogo(String imagePath) {
  return Image.asset(
    imagePath,
    width: 50, // Ajustar el tamaño de los logos
    height: 50, // Ajustar el tamaño de los logos
  );
}

  Widget _buildName() {
    return Text(
      'Descripción',
      style: GoogleFonts.dmSans(
        fontSize: 22,
        color: Colors.white,
      ),
    );
  }

  Widget _buildGameInfo() {
    return Text(
      'Información sobre $title...',
      style: GoogleFonts.dmSans(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Center(
      // Center the button
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(75, 135, 255, 1),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
        ),
        child: Text(
          'Juega Ahora',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: const Color(0xF8FFFFFF),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
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
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        }
      },
    );
  }
}
