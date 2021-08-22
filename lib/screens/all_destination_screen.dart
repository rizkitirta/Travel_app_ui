import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/screens/destination_screen.dart';

class AllDestination extends StatefulWidget {
  // const AllDestination({ Key? key }) : super(key: key);

  @override
  _AllDestinationState createState() => _AllDestinationState();
}

class _AllDestinationState extends State<AllDestination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Destination"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: destinations.length,
        itemBuilder: (BuildContext context, int index) {
          Destination destination = destinations[index];
          return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationScreen(destination: destination,))),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 210,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: 15,
                          child: Container(
                            height: 120,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${destination.activities.length} Activities",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        letterSpacing: 1.2),
                                  ),
                                  Text(
                                    "${destination.description}",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0)
                              ]),
                          child: Stack(
                            children: [
                              Hero(
                                tag: destination.imageUrl,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      height: 180.0,
                                      width: double.infinity,
                                      image: AssetImage(destination.imageUrl),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          letterSpacing: 1.2, fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      children: [
                                        Icon(FontAwesomeIcons.locationArrow, size: 10, color: Colors.white,),
                                        SizedBox(width: 5,),
                                        Text("${destination.country}", style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );;
        },
      ),
    );
  }
}
