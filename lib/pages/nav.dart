import 'package:deepbyte_task_flutter/pages/flight_booking/flight_search_page.dart';
import 'package:deepbyte_task_flutter/pages/game/game.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(""),
          backgroundColor: Colors.deepPurple,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                      icon: const Icon(Icons.games),
                      style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GamePage()));
                      },
                      label: const Text("Game")),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton.icon(
                      icon: const Icon(Icons.flight),
                      style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FlightSearchPage()));
                      },
                      label: const Text("Book Flight"))
                ]),
          ),
        ),
      ),
    );
  }
}
