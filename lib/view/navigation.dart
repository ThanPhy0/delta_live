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
        decoration: BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: GNav(
            tabBorderRadius: 20,
            backgroundColor: Colors.transparent,
            gap: 5,
            iconSize: 25,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            tabs: [
              GButton(
                icon: Icons.live_tv,
                text: "Matches",
                textColor: Colors.red,
                iconColor: Colors.red,
                iconActiveColor: Colors.red,
                active: true,
              ),
              GButton(
                icon: Icons.account_circle,
                text: "Account",
                textColor: Colors.blueAccent,
                iconColor: Colors.blueAccent,
                iconActiveColor: Colors.blueAccent,
              ),
              GButton(
                icon: Icons.info,
                text: "About",
                textColor: Colors.yellowAccent,
                iconColor: Colors.yellowAccent,
                iconActiveColor: Colors.yellowAccent,
              )
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
