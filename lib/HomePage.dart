import 'package:flutter/material.dart';
import 'package:nauggets_assignment_app/ProfilePage.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 79, 179),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100, top: 55),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ', to sign',
                        style: TextStyle(fontSize: 30),
                      ),
                      TextSpan(text: '')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 175),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'in continue',
                              style: TextStyle(fontSize: 30)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 70,
                  child: TabBar(
                    unselectedLabelColor: Colors.white,
                    indicator: RectangularIndicator(
                        topLeftRadius: 4,
                        topRightRadius: 4,
                        bottomLeftRadius: 4,
                        bottomRightRadius: 4,
                        color: Color.fromARGB(57, 255, 255, 255)),
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Log in",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Tab(
                        // text: 'Sign Up',
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 40),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white, fontSize: 25),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                label: Text(
                                  'Phone number',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 45),
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                                label: Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 70,
                            ),
                          ),
                          onPressed: () async {
                            // var url =
                            //     Uri.parse('https://reqres.in/api/unknown');
                            // var response = await http.get(url);
                            // print('Response status: ${response.statusCode}');
                            // print('Response body: ${response.body}');
                            // var data = jsonDecode(response.body);
                            // String name = data['data'][0]['name'];
                            // print(data['data'][0]['name']);
                            // int balance = data['data'][0]['year'];
                            // print(data['data'][0]['year']);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                    // firstName: name,
                                    // acBalance: balance,
                                    ),
                              ),
                            );
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 17, 79, 179),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Forgot your password?",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 40),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white, fontSize: 25),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                label: Text(
                                  'Phone number',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 45),
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                                label: Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 70,
                            ),
                          ),
                          onPressed: () async {
                            // var url =
                            //     Uri.parse('https://reqres.in/api/unknown');
                            // var response = await http.get(url);
                            // print('Response status: ${response.statusCode}');
                            // print('Response body: ${response.body}');
                            // var data = jsonDecode(response.body);
                            // String name = data['data'][0]['name'];
                            // print(data['data'][0]['name']);
                            // int balance = data['data'][0]['year'];
                            // print(data['data'][0]['year']);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                    // firstName: name,
                                    // acBalance: balance,
                                    ),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 17, 79, 179),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Forgot your password?",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
