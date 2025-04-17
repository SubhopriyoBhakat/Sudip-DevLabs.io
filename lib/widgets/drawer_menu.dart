import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/projects_section.dart';

import '../screens/portfolio_home.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    if (isMobile) {
      // Show as Drawer
      return Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Color.from(
                      red: 255, green: 255, blue: 255, alpha: 0.7
                  )
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(title: const Text('Home'), onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PortfolioHome()),
              );
            }),
            ListTile(title: const Text('Projects'), onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectsSection()),
              );
            }),
            ListTile(title: const Text('Tech Journal'), onTap: () {}),
            //ListTile(title: const Text('Contact'), onTap: () {}),
          ],
        ),
      );
    } else {
      // Show as Navbar buttons
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PortfolioHome()),
                );
              },
              child: const Text("Home", style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProjectsSection()),
                );
              },
              child: const Text("Projects", style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {

              },
              child: const Text("Tech Journal", style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {

              },
              child: const Text("Contact", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      );
    }
  }
}

