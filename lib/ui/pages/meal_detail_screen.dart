import 'package:flutter/material.dart';
import 'package:training_and_dieting_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {

  final Meal meal;

  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: Image.asset(
                  meal.imagePath ,
                  fit: BoxFit.cover,
                ),

              )
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      meal.mealTime.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    subtitle: Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${meal.kiloCaloriesBurnt} kcal",
                              style: const TextStyle(
                                color: Colors.grey,
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
                          children: <Widget>[
                            const Icon(
                                Icons.access_time,
                                color: Colors.grey,
                            ),
                            Text(
                              "${meal.timeTaken} mins",
                              style: const TextStyle(
                                color: Colors.grey,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "INGREDIENTS",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        for(int i=0 ; i<meal.ingredients.length ; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              meal.ingredients[i],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "PREPARATION",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 16,
                        bottom: 32,
                    ),
                    child: Text(
                      meal.preparation,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}

