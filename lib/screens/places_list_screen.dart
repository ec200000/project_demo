import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';
import './place_detail_screen.dart';

class PlacesListScreen extends StatefulWidget {
  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  GoogleMapController controller;
  static LatLng _initialPosition;

  @override
  void initState() {
    _getUserLocation();
    super.initState();
  }
  void _getUserLocation() async {
    final locData = await Location().getLocation();
    setState(() {
      _initialPosition = LatLng(locData.latitude, locData.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 170,
                            child: ListView.builder(
                                itemCount: greatPlaces.items.length,
                                itemBuilder: (ctx, i) => ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: FileImage(
                                          greatPlaces.items[i].image,
                                        ),
                                      ),
                                      title: Text(greatPlaces.items[i].title),
                                      subtitle:
                                          Text(greatPlaces.items[i].location.address),
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          PlaceDetailScreen.routeName,
                                          arguments: greatPlaces.items[i].id,
                                        );
                                      },
                                    ),
                              ),
                          ),
                          Container(
                            height: 170,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: _initialPosition ,
                                zoom: 9,
                              ),
                              markers:
                                greatPlaces.items.map((e) => Marker(
                                    position: LatLng(e.location.latitude, e.location.longitude),
                                    markerId: MarkerId(e.title),
                                    icon: BitmapDescriptor.defaultMarkerWithHue(
                                        e.title == 'moo' ? BitmapDescriptor.hueYellow : BitmapDescriptor.hueCyan
                                    ))).toSet()
                              ,
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
      ),
    );
  }
}
