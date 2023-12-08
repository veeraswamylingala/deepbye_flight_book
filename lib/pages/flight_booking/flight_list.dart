import 'package:deepbyte_task_flutter/models/flight_info.dart';
import 'package:deepbyte_task_flutter/pages/flight_booking/flight_details.dart';
import 'package:deepbyte_task_flutter/pages/flight_booking/info.dart';
import 'package:flutter/material.dart';

class FlightList extends StatefulWidget {
  final Map searchMap;
  const FlightList({super.key, required this.searchMap});

  @override
  State<FlightList> createState() => _FlightListState();
}

class _FlightListState extends State<FlightList> {
  List<FlightsModel> flightsData = [];
  @override
  void initState() {
    super.initState();
    flightsData = flightsList.map((e) => FlightsModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          elevation: 1,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.searchMap['takeOffAirpor'] +
                  " -> " +
                  widget.searchMap['landAirport']),
              Text(
                widget.searchMap['date'],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          actions: const [],
        ),
        body: ListView.builder(
          // controller: controller,
          itemCount: flightsData.length,
          itemBuilder: (_, index) {
            return Card(
              elevation: 5.0,
              child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                          width: 60,
                          child: Icon(
                            Icons.flight,
                            color: Colors.red,
                          )),
                      Text(
                        flightsData[index].fightAirwayName,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  title: Text(
                    "${flightsData[index].fromTime} - ${flightsData[index].toTime}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w300),
                  ),
                  subtitle: Row(
                    children: [
                      Text(flightsData[index].totalhours),
                      const Text(" | "),
                      Text(flightsData[index].stops),
                    ],
                  ),
                  trailing: Text(
                    "₹${flightsData[index].price}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlightDetails(
                                  flightData: flightsData[index],
                                )));
                  }),
            );
          },
        ),
      ),
    );
  }
}
