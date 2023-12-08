import 'package:deepbyte_task_flutter/models/flight_info.dart';
import 'package:flutter/material.dart';

class FlightDetails extends StatefulWidget {
  final FlightsModel flightData;
  const FlightDetails({super.key, required this.flightData});

  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple,
            elevation: 1,
            title: const Text("Flight Details")),
        bottomSheet: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey),
              )),
          height: 70,
          child: Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                "₹${widget.flightData.price}",
                style: const TextStyle(fontSize: 25),
              ))),
              Expanded(
                flex: 2,
                child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple),
                    onPressed: () {},
                    child: const Text(
                      "Book",
                      style: TextStyle(fontSize: 25),
                    )),
              )
            ],
          ),
        ),
        body: Card(
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: [
                  const Icon(
                    Icons.flight_sharp,
                    color: Colors.deepPurple,
                    size: 50,
                  ),
                  Text(
                    widget.flightData.fightAirwayName,
                    style: const TextStyle(fontSize: 30),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.pin_drop),
                  Text(
                    "${widget.flightData.fromStop} - ${widget.flightData.toStop}",
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.time_to_leave_sharp),
                  Text(
                    "${widget.flightData.fromTime} - ${widget.flightData.toTime}",
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.punch_clock),
                  Text(
                    widget.flightData.totalhours,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.stop),
                  Text(
                    widget.flightData.stops,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
