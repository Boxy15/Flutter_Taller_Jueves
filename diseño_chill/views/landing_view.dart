import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Nueva librería de iconos
import '../controllers/note_controller.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  bool isOpen = false; // Estado para abrir/cerrar la barra lateral

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Añadido AppBar como widget principal
        title: const Text('Landing View'),
        backgroundColor: Colors.teal, // Color cambiado a teal
      ),
      body: Row(
        children: [
          // Barra lateral
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isOpen ? 210 : 60,
            decoration: BoxDecoration(
              // color: Colors.white,
              border: Border(
                right: BorderSide(color: Colors.grey.shade300, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    icon: Icon(isOpen ? FontAwesomeIcons.arrowLeft : FontAwesomeIcons.bars), // Iconos cambiados
                    color: Colors.grey[800],
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });

                      NoteController().getNotes();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _buildMenuItem(
                  FontAwesomeIcons.book, // Icono cambiado
                  "Projects",
                ),
                _buildMenuItem(
                  FontAwesomeIcons.edit, // Icono cambiado
                  "Drafts",
                ),
                _buildMenuItem(
                  FontAwesomeIcons.shareAlt, // Icono cambiado
                  "Shared with me",
                ),
                const Spacer(),
                _buildMenuItem(
                  FontAwesomeIcons.cogs, // Icono cambiado
                  "Settings",
                ),
              ],
            ),
          ),
          // Contenido principal
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                //arriba a abajo
                mainAxisAlignment: MainAxisAlignment.start,
                //de izquierda a derecha
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Side Hustle',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal, // Color del texto cambiado
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        FontAwesomeIcons.chevronDown, // Icono cambiado
                        size: 30,
                        color: Colors.teal, // Color del icono cambiado
                      ),
                      Spacer(),
                      Icon(
                        FontAwesomeIcons.link, // Icono cambiado
                        size: 30,
                        color: Colors.teal, // Color del icono cambiado
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal, // Color del texto cambiado
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        FontAwesomeIcons.ellipsisH, // Icono cambiado
                        size: 30,
                        color: Colors.teal, // Color del icono cambiado
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los elementos del menú
  Widget _buildMenuItem(IconData icon, String title) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: isOpen ? 210 : 60,
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(icon, color: Colors.grey[800], size: 24),
              ),
              if (isOpen) ...[
                const SizedBox(width: 10), // Espacio entre icono y texto
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
