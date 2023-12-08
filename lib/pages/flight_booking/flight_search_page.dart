import 'package:deepbyte_task_flutter/models/airport_info.dart';
import 'package:deepbyte_task_flutter/pages/flight_booking/flight_list.dart';
import 'package:deepbyte_task_flutter/pages/flight_booking/info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({super.key});

  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  List<AirportsNamesModel> airportsData = [];
  AirportsNamesModel? takeOffAirpor;
  AirportsNamesModel? landAirport;

  @override
  void initState() {
    super.initState();
    airportsData =
        airportsRawData.map((e) => AirportsNamesModel.fromJson(e)).toList();
    takeOffAirpor = airportsData[0];
    landAirport = airportsData[1];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          elevation: 1,
          title: const Text("Flight Search"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.home)),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () {
                  _showAirPortsList(
                      context: context, routeType: "flight_takeoff");
                },
                child: buildAirportSelector(
                    takeOffAirpor ?? airportsData[0], Icons.flight_takeoff),
              ),
              Container(height: 1, color: Colors.black26),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () {
                  _showAirPortsList(context: context, routeType: "flight_land");
                },
                child: buildAirportSelector(
                    landAirport ?? airportsData[1], Icons.flight_land),
              ),
              Container(height: 1, color: Colors.black26),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {},
                      child: buildDateSelector('DEPARTURE', DateTime.now()),
                    ),
                  ),
                  Expanded(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                        label: const Text(
                          "Add Return",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        )),
                  ),
                ],
              ),
              Container(height: 1, color: Colors.black26),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {},
                      child: buildTravellersView(),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'CABIN CLASS',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                'ECONOMY\nCLASS',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    child: Text(
                      'SEARCH',
                      style: GoogleFonts.overpass(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlightList(
                                    searchMap: {
                                      "takeOffAirpor":
                                          takeOffAirpor!.airportShortName,
                                      "landAirport":
                                          landAirport!.airportShortName,
                                      "date": "08 Jan 2020"
                                    },
                                  )));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTravellersView() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'TRAVELLERS',
              style: GoogleFonts.overpass(fontSize: 18, color: Colors.grey),
            ),
            Text(
              '01',
              style: GoogleFonts.overpass(fontSize: 25),
            )
          ],
        ),
      ],
    );
  }

  Widget buildDateSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.overpass(fontSize: 18, color: Colors.grey),
        ),
        Row(
          children: <Widget>[
            Text(
              dateTime.day.toString().padLeft(2, '0'),
              style: GoogleFonts.overpass(fontSize: 48),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Jan 2020',
                  style: GoogleFonts.overpass(fontSize: 16),
                ),
                Text(
                  'Friday',
                  style: GoogleFonts.overpass(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAirportSelector(AirportsNamesModel airportInfo, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 60,
              child: Text(
                airportInfo.airportCode,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black54),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  airportInfo.airportShortName,
                  style: const TextStyle(fontSize: 24, color: Colors.black87),
                ),
                Text(
                  airportInfo.airportLongName,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
        Icon(icon),
      ],
    );
  }

  void _showAirPortsList(
      {required BuildContext context, required String routeType}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                    readOnly: true,
                    // controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search City/Airport',
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      suffixIcon: Icon(routeType == "flight_takeoff"
                          ? Icons.flight_takeoff
                          : Icons.flight_land),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )),
              ),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  // controller: controller,
                  itemCount: airportsData.length,
                  separatorBuilder: (_, index) {
                    return Container(height: 1, color: Colors.black26);
                  },
                  itemBuilder: (_, index) {
                    return ListTile(
                        leading: SizedBox(
                          width: 60,
                          child: Text(
                            airportsData[index].airportCode,
                            style: GoogleFonts.overpass(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black54),
                          ),
                        ),
                        title: Text(airportsData[index].airportShortName),
                        subtitle: Text(airportsData[index].airportLongName),
                        trailing: Icon(routeType == "flight_takeoff"
                            ? Icons.flight_takeoff
                            : Icons.flight_land),
                        onTap: () {
                          if (routeType == "flight_takeoff") {
                            takeOffAirpor = airportsData[index];
                          } else {
                            landAirport = airportsData[index];
                          }
                          setState(() {});
                          Navigator.pop(context);
                        });
                  },
                ),
              ),
            ],
          );
        });
  }
}
