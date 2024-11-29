import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Nueva librería de iconos

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), // Cambiado de deepPurple a teal
        useMaterial3: true,
        textTheme: GoogleFonts.anaheimTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar( 
          title: const Text('Flutter Demo Modified'),
        ),
        body: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                button(FontAwesomeIcons.book, 'Projects', () {}),
                button(FontAwesomeIcons.drawPolygon, 'Draft', () {}),
                button(FontAwesomeIcons.shareAlt, 'Shared with me', () {}),
                const Spacer(),
                button(FontAwesomeIcons.cog, 'Settings', () {}),
                button(FontAwesomeIcons.users, 'Invite members', () {}),
                button(FontAwesomeIcons.plus, 'New Draft', () {}),
                button(FontAwesomeIcons.plusCircle, 'New Project', () {}),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Side Hustle',
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        FontAwesomeIcons.chevronDown,
                        size: 35,
                      ),
                      SizedBox(width: 800),
                      Icon(FontAwesomeIcons.link),
                      SizedBox(width: 20),
                      Text('Share'),
                      SizedBox(width: 20),
                      Icon(FontAwesomeIcons.ellipsisV),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      nota(),
                      const SizedBox(width: 40),
                      nota(),
                      const SizedBox(width: 40),
                      nota(),
                      const SizedBox(width: 40),
                      nota(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  nota() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[50], 
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      height: 300,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.blue, 
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              const Text('Titulo x'),
            ],
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec odio nec nisl sodales fermentum. Nullam nec nisl sodales, fermentum nisl nec, fermentum nisl. Nullam nec nisl sodales, fermentum nisl nec, fermentum nisl.'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell button(IconData icon, String text, Function onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
        print(text);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}
