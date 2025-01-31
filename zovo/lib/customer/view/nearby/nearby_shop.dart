    import 'package:flutter/material.dart';
    import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zovo/customer/view/nearby/direction.dart';
import 'package:zovo/customer/view/nearby/menuitems.dart';
import 'package:zovo/shopowner/screen/presentation/mainscreen/collecting%20details/map.dart';

    class RestaurantListPage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Restaurants', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('shops').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final restaurant = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailPage(restaurant: restaurant),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              itemBuilder: (context, imageIndex) {
                                return Image.network(
                                  restaurant['shopImages'][imageIndex],
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurant['shopName'] ?? '',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow, size: 16),
                                    Text('${restaurant['rating'] ?? 0.0}'),
                                    SizedBox(width: 5),
                                    Text('(${restaurant['reviews'] ?? 0})'),
                                    Spacer(),
                                    Text(restaurant['distance'] ?? ''),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text('${restaurant['type'] ?? ''} · ${restaurant['price'] ?? ''}'),
                                SizedBox(height: 5),
                                Text(
                                  '${restaurant['openStatus'] ?? ''} · Closes ${restaurant['closingTime'] ?? ''}',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => directionscreen(storelatitude: restaurant['latitude'], storelongitude: restaurant['longitude'],storename:restaurant['shopName']),),);
                                },
                                child: Row(
                                  children: [Icon(Icons.directions), Text(' Directions')],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Menuitems(email: restaurant['email'],),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [Icon(Icons.menu_book), Text(' Menu')],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [Icon(Icons.share), Text(' Share')],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      }
    }

    class RestaurantDetailPage extends StatelessWidget {
      final Map<String, dynamic> restaurant;

      RestaurantDetailPage({required this.restaurant});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(restaurant['name'] ?? '', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (restaurant['images'] as List).length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        restaurant['images'][index],
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant['name'] ?? '',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('${restaurant['type'] ?? ''} · ${restaurant['price'] ?? ''}'),
                      SizedBox(height: 10),
                      Text(
                        '${restaurant['openStatus'] ?? ''} · Closes ${restaurant['closingTime'] ?? ''}',
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey),
                          Expanded(child: Text(restaurant['location'] ?? '')),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                            },
                            icon: Icon(Icons.directions),
                            label: Text('Directions'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.phone),
                            label: Text('Call'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.share),
                            label: Text('Share'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }