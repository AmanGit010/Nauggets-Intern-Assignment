import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:nauggets_assignment_app/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? stringResponse;
Map? mapResponse;

class ProfilePage extends StatefulWidget {
  // String firstName;
  // int acBalance;
  ProfilePage({
    super.key,
    // required this.firstName, required this.acBalance
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
    stringResponse = response.body;
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;

        mapResponse = json.decode(response.body);
      });
    }
  }

  String name = '';
  String balance = '';

  Future<dynamic> fetchData() async {
    var url = Uri.parse('https://reqres.in/api/unknown');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    // var data = jsonEncode(http.get(url));

    // String desc = data["1"]["content"]["heading"];
    // print("Response: ${response.body}");
    if (response.statusCode == 200) {
      setState(() {
        name = data['data'][1]['name'];
        balance = data['data'][1]['year'].toString();
        print(name);
        print(balance);
      });
      // return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    fetchData();
    // apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 79, 179),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => homePage(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.menu,
              size: 35,
            ),
          ),
        ],
      ),
      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/graph.jpg',
              scale: 12,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money_outlined,
            ),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_outline,
              ),
              label: 'Security'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 17, 79, 179),
        onTap: _onItemTapped,
        selectedFontSize: 17,
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 17, 79, 179)),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: CircleAvatar(
                // backgroundImage: AssetImage("images/profile.jpeg"),
                backgroundColor: Colors.green,
                radius: 50,
                // foregroundImage: AssetImage('images/graph.jpg'),
                child: Image.asset(
                  'images/profile.png',
                  // scale: 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 140),
              child: Container(
                child: Stack(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 79, 179),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Row(
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 145, left: 45),
              child: Row(
                children: [
                  Text(
                    "Balance",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  Text(
                    balance,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220, left: 80),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 223, 223, 223),
                    radius: 30,
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: Color.fromARGB(255, 17, 79, 179),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220, left: 170),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 223, 223, 223),
                    radius: 30,
                    child: Icon(
                      Icons.search,
                      size: 40,
                      color: Color.fromARGB(255, 17, 79, 179),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220, left: 260),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 223, 223, 223),
                    radius: 30,
                    child: Icon(
                      Icons.auto_graph_sharp,
                      size: 40,
                      color: Color.fromARGB(255, 17, 79, 179),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 310, left: 35, right: 35, bottom: 40),
              child: FractionallySizedBox(
                heightFactor: 1.0,
                widthFactor: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color.fromARGB(226, 76, 175, 79)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 260, right: 15, bottom: 185, top: 17),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(55, 0, 0, 0)),
                      child: Center(
                        child: Text(
                          "CARD",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
