import 'package:delta_live/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  final List<Widget> view = [
    HomeView(),
    Center(
      child: Text("Fav"),
    ),
    Center(
      child: Text("Fav"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view[selectedIndex],
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: GNav(
            tabBackgroundColor: Colors.grey,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(icon: Icons.favorite, text: "Home"),
              GButton(icon: Icons.settings, text: "Home")
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
