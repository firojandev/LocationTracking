import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:log_my_location/common/app_constants.dart';
import 'package:log_my_location/main.dart';
import 'package:log_my_location/modules/home/ItemModel.dart';
import 'package:log_my_location/modules/home/item_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0,50,0,0),
              child: TextButton(
                onPressed: () async {
                  _getCurrentPosition();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                  //  width: 350,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Track Now',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: itemBuilder()),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ItemModel>> itemBuilder() {
    return FutureBuilder<List<ItemModel>>(
      future: items(),
      builder: (BuildContext context, AsyncSnapshot<List<ItemModel>> snapshot) {
        if (snapshot.hasData) {
          return ItemContainer(itemsList: snapshot.data!);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<ItemModel>> items() async {
    List<ItemModel> savedItemsList =
        logObjectBox.getItems(AppConstants.itemFeed);
    return savedItemsList;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      // String address =
      //     '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      String address =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}';

      DateTime dt = DateTime.now();

      ItemModel itemModel = new ItemModel(
          position.latitude, position.latitude, address, dt,dt.day,dt.month,dt.year);
      logObjectBox.saveItem(itemModel);
      setState(() {

      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
