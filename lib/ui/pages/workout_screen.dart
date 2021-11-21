import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_and_dieting_app/model/upper_body_workout.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final day =  DateFormat.EEEE().format(DateTime.now());
    final date = DateFormat.d().format(DateTime.now());
    final month = DateFormat.MMMM().format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "$day, $date $month",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  "UPPER BODY",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                            Icons.access_time,
                            color: Colors.white38
                        ),
                        Text(
                          "60 min",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                            Icons.shutter_speed,
                            color: Colors.white38
                        ),
                        Text(
                          "Easy",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              for(int i = 0 ; i < upperBody.length ; i++)
                Column(
                  children: <Widget>[
                    for(int j = 0 ; j < upperBody[i].length ; j++)
                      ListTile(
                        leading: Container(
                          decoration: const BoxDecoration(
                            borderRadius:BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Color(0xFF5B4D9D),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            upperBody[i][j].imagePath,
                            width: 45,
                            height: 45,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          upperBody[i][j].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          upperBody[i][j].instruction,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
