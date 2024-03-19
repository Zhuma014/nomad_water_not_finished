// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../providers/cookies_provider.dart';

class Userslist extends StatefulWidget {
  const Userslist({Key? key}) : super(key: key);

  @override
  State<Userslist> createState() => _UserslistState();
}

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String phone;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
    );
  }
}

class _UserslistState extends State<Userslist> {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final cookies =
        Provider.of<CookiesProvider>(context, listen: false).cookies;

    final url = Uri.parse('http://192.168.56.1:8080/api/user');
    final headers = {'Content-Type': 'application/json', "Cookie": "$cookies"};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // Decode the response JSON
      final jsonData = json.decode(response.body);
      final filteredUsers =
          jsonData.where((userJson) => userJson['role'] == 'ROLE_USER');

      // Create User objects and add them to the list
      setState(() {
        // Update the users list
        users.clear();
        for (var userJson in filteredUsers) {
          final user = User.fromJson({
            'id': userJson['id'],
            'firstname': userJson['firstname'] ?? '',
            'lastname': userJson['lastname'] ?? '',
            'phone': userJson['phone'] ?? '',
          });
          users.add(user);
        }
      });
    } else {
      print(response.statusCode);
      // Handle error case
      print('Failed to fetch users');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];

          return Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.only(top: 11, bottom: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "ID: ${user.id}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 2, 54, 70),
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Text(
                          "${user.firstname} ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 2, 54, 70),
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "${user.lastname}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 2, 54, 70),
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 4, bottom: 10),
                      child: Text("${user.phone}")),
                ],
              ),
            ),
          );
        });
  }
}
