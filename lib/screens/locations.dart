// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';

class SavedLocationsPage extends StatefulWidget {
  const SavedLocationsPage({super.key});

  @override
  State<SavedLocationsPage> createState() =>
      _SavedLocationsPageState();
}

class _SavedLocationsPageState
    extends State<SavedLocationsPage> {

  final List<Map<String, dynamic>> locations = [];

  final labelController = TextEditingController();
  final addressController = TextEditingController();
  final apartmentController = TextEditingController();
  final floorController = TextEditingController();
  final buildingController = TextEditingController();
  final landmarkController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  bool isDefault = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadLocations();
  }

  Future<void> loadLocations() async {

    var response = await ApiService.getLocations();

    print("LOCATIONS RESPONSE: $response");

    if (response["success"] == true) {

      setState(() {

        locations.clear();

        locations.addAll(
          List<Map<String, dynamic>>.from(
            response["data"],
          ),
        );

      });

    }
  }

  Future<void> addLocation() async {

    if (labelController.text.isEmpty ||
        addressController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please fill required fields",
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    var response = await ApiService.addLocation(
      label: labelController.text.trim(),
      address: addressController.text.trim(),
      apartment: apartmentController.text.trim(),
      floor: floorController.text.trim(),
      building: buildingController.text.trim(),
      landmark: landmarkController.text.trim(),
      latitude:
          double.tryParse(latitudeController.text) ?? 0,
      longitude:
          double.tryParse(longitudeController.text) ?? 0,
      isDefault: isDefault,
    );

    setState(() {
      isLoading = false;
    });

    print("ADD LOCATION RESULT: $response");

    if (response["success"] == true) {

      await loadLocations();

      labelController.clear();
      addressController.clear();
      apartmentController.clear();
      floorController.clear();
      buildingController.clear();
      landmarkController.clear();
      latitudeController.clear();
      longitudeController.clear();

      isDefault = false;

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Location added successfully",
          ),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response["message"] ??
                "Failed to add location",
          ),
        ),
      );

    }
  }

  Future<void> deleteLocation(int index) async {

    final location = locations[index];

    var response = await ApiService.deleteLocation(
      location["id"],
    );

    if (response["success"] == true) {

      setState(() {
        locations.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Location deleted"),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response["message"] ?? "Delete failed",
          ),
        ),
      );

    }
  }

  void showAddLocationBottomSheet() {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {

        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom:
                MediaQuery.of(context)
                        .viewInsets
                        .bottom +
                    20,
          ),

          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  "Add New Location",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                buildTextField(
                  labelController,
                  "Label (Home, Work...)",
                ),

                buildTextField(
                  addressController,
                  "Address",
                ),

                buildTextField(
                  apartmentController,
                  "Apartment",
                ),

                buildTextField(
                  floorController,
                  "Floor",
                ),

                buildTextField(
                  buildingController,
                  "Building",
                ),

                buildTextField(
                  landmarkController,
                  "Landmark",
                ),

                buildTextField(
                  latitudeController,
                  "Latitude",
                ),

                buildTextField(
                  longitudeController,
                  "Longitude",
                ),

                SwitchListTile(
                  value: isDefault,
                  activeColor: Color.fromARGB(
                    255,
                    147,
                    24,
                    24,
                  ),
                  title: Text(
                    "Set as default",
                  ),
                  onChanged: (value) {

                    setState(() {
                      isDefault = value;
                    });

                  },
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(
                        255,
                        147,
                        24,
                        24,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),

                    onPressed:
                        isLoading
                            ? null
                            : addLocation,

                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Add Location",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String hint,
  ) {

    return Padding(
      padding: EdgeInsets.only(bottom: 15),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade100,

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(15),

            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Saved Locations"),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(
          255,
          147,
          24,
          24,
        ),

        onPressed: showAddLocationBottomSheet,

        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      body: locations.isEmpty

          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.location_off,
                    size: 90,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 15),

                  Text(
                    "No saved locations yet",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )

          : ListView.builder(

              padding: EdgeInsets.all(15),

              itemCount: locations.length,

              itemBuilder: (context, index) {

                final location = locations[index];

                return Container(

                  margin:
                      EdgeInsets.only(bottom: 15),

                  padding: EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(20),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      Container(
                        padding: EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Color.fromARGB(
                            25,
                            147,
                            24,
                            24,
                          ),

                          borderRadius:
                              BorderRadius.circular(15),
                        ),

                        child: Icon(
                          Icons.location_on,

                          color: Color.fromARGB(
                            255,
                            147,
                            24,
                            24,
                          ),
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Row(
                              children: [

                                Text(
                                  location["label"] ?? "",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                SizedBox(width: 10),

                                if (location["isDefault"] ==
                                    true)

                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.green,

                                      borderRadius:
                                          BorderRadius
                                              .circular(20),
                                    ),

                                    child: Text(
                                      "Default",

                                      style: TextStyle(
                                        color:
                                            Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            SizedBox(height: 8),

                            Text(
                              location["address"] ?? "",

                              style: TextStyle(
                                color:
                                    Colors.grey.shade700,
                              ),
                            ),

                            if ((location["landmark"] ??
                                    "") !=
                                "")

                              Padding(
                                padding:
                                    EdgeInsets.only(top: 5),

                                child: Text(
                                  "Landmark: ${location["landmark"]}",

                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),

                        onPressed: () {
                          deleteLocation(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}