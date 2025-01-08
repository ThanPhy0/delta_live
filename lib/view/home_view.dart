import 'package:delta_live/model/league_btn_style.dart';
import 'package:flutter/material.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController();
  late Future<List<dynamic>> _matches;
  String _selectedLeague = 'All'; // Default selected league

  @override
  void initState() {
    super.initState();
    _matches = _controller.fetchMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // elevation: 1,
        backgroundColor: Color(0xFF262B36),
        title: const Text('Delta Live'),
      ),
      backgroundColor: Color(0xFF262B36),
      body: FutureBuilder<List<dynamic>>(
        future: _matches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No matches available"));
          } else {
            final allMatches = snapshot.data!;
            final filteredMatches = _selectedLeague == 'All'
                ? allMatches
                : allMatches
                    .where((match) => match['league'] == _selectedLeague)
                    .toList();

            final leagues = [
              'All',
              ...{...allMatches.map((match) => match['league'])}
            ];
            return Column(
              children: [
                // Category Row
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: leagues.length,
                    itemBuilder: (context, index) {
                      final league = leagues[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedLeague = league;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedLeague == league
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            child: Container(
                              child: Image(
                                  image: AssetImage(LeagueBtnStyle()
                                      .setLeagueBackground(league))),
                            )),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Match List
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredMatches.length,
                    itemBuilder: (context, index) {
                      final match = filteredMatches[index];
                      return Card(
                        color: const Color(0xFF636363),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Home Team Column
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      match['home_flag'],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                        height:
                                            4), // Add spacing between image and text
                                    SizedBox(
                                      width:
                                          80, // Set a fixed width for consistent alignment
                                      child: Text(
                                        match['home_name'],
                                        textAlign: TextAlign
                                            .center, // Center-align the text
                                        overflow: TextOverflow
                                            .ellipsis, // Handle long text gracefully
                                        style: const TextStyle(
                                            fontSize: 12), // Adjust font size
                                      ),
                                    ),
                                  ],
                                ),

                                // Match Time Text
                                SizedBox(
                                    width: 60, // Fixed width for time
                                    child: Column(
                                      children: [
                                        Text(
                                          match['status'],
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          match['time'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          match['score'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),

                                // Away Team Column
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      match['away_flag'],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                        height:
                                            4), // Add spacing between image and text
                                    SizedBox(
                                      width:
                                          80, // Set a fixed width for consistent alignment
                                      child: Text(
                                        match['away_name'],
                                        textAlign: TextAlign
                                            .center, // Center-align the text
                                        overflow: TextOverflow
                                            .ellipsis, // Handle long text gracefully
                                        style: const TextStyle(
                                            fontSize: 12), // Adjust font size
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
