import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Image? profileImage;
  String BirthTitle = 'Select your birthday';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c1c1c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'profile',
          style: TextStyle(
            fontSize: 25,
            color: Colors.grey.shade300,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 30,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade700,
                radius: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: profileImage == null
                      ? const Text(
                          'sd',
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        )
                      : profileImage,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      profileImage = Image.file(File(image.path));
                    });
                  }
                },
                child: Text(
                  'Change Profile Picture',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'sans',
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () async {
                    final datetime = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2022),
                      firstDate: DateTime(1977, 1, 1),
                      lastDate: DateTime.now(),
                    );
                    if (datetime != null) {
                      setState(() {
                        BirthTitle =
                        '${datetime.year}/ ${datetime.month}/ ${datetime.day}';
                      });
                      print('sdg');
                    }
                  },
                  child: Card(
                      color: const Color(0XFF2D2D2D),
                      elevation: 50,
                      child: Center(
                        child: Text(
                          BirthTitle,
                          style: const TextStyle(
                            fontFamily: 'sans',
                            fontSize: 30,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    label: const Text('Name'),
                    labelStyle: TextStyle(
                      fontFamily: 'sans',
                      color: Colors.grey.shade300,
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  cursorColor: Colors.grey.shade400,
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20,
                      fontFamily: 'sans',
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.grey.shade300,
                  decoration: InputDecoration(
                    label: const Text(
                      'Email',
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontFamily: 'sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12.0)),
                    prefixIcon: Icon(
                      Icons.email,
                      size: 40,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20,
                      fontFamily: 'sans',
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.grey.shade300,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    label: const Text(
                      'User Name',
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sans',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon: Icon(
                      Icons.abc_outlined,
                      color: Colors.grey.shade300,
                      size: 40,
                    ),
                  ),
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20,
                      fontFamily: 'sans',
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                    width: 500,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontFamily: 'sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
