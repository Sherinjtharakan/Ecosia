// ignore_for_file: file_names

import 'package:ecosia/shared/navigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserTask extends StatefulWidget {
  const UserTask({Key? key}) : super(key: key);

  @override
  State<UserTask> createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Task",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          const Opacity(
            opacity: 0.7,
            child: Image(
              image: NetworkImage(
                  "https://images.pexels.com/photos/2382325/pexels-photo-2382325.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ),
          ),
          CarouselSlider(
            items: [
              Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/1208688/screenshots/4083955/running.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: const Text("Running"),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/47/03/09/4703093a70ba47001bf2c86319aae091.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: const Text("Walking"),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/9d/37/f2/9d37f28579591c547cca47239bad1f2c.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text("Cycling"),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: const Text("Cycling"),
                  ),
                ],
              ),
            ],
            options: CarouselOptions(
              height: 400,
              // enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              // autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
              // viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
