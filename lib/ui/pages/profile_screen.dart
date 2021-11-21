import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:training_and_dieting_app/model/meal.dart';
import 'package:training_and_dieting_app/ui/pages/meal_detail_screen.dart';
import 'package:training_and_dieting_app/ui/pages/workout_screen.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final day =  DateFormat.EEEE().format(DateTime.now());
    final date = DateFormat.d().format(DateTime.now());
    final month = DateFormat.MMMM().format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          iconSize: 40,
          selectedIconTheme: const IconThemeData(
            color: Color(0xFF200087),
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black12,
          ),
          items: const [
           BottomNavigationBarItem(
             icon: Padding(
               padding: EdgeInsets.only(top: 4.0),
               child: Icon(
                 Icons.home,
                ),
             ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Icon(
                      Icons.search,
               ),
                  ),
                ),
               label: 'Search',
              ),
            BottomNavigationBarItem(
             icon: Padding(
               padding: EdgeInsets.only(top: 4.0),
               child: Icon(
                 Icons.person,
               ),
             ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body:Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height*0.38,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 32,
                  right: 16,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "$day, $date $month",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: const Text(
                          "Hello, Rampal",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(
                          child: Image.asset("assets/user.jpg"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        _RadialProgress(
                          width: width * 0.35,
                          height: width * 0.4,
                          progress:0.7,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _IngredientProgress(
                              ingredient: "Protein",
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: width * 0.3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _IngredientProgress(
                              ingredient: "Carbs",
                              progress: 0.7,
                              progressColor: Colors.red,
                              leftAmount: 252,
                              width: width * 0.3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _IngredientProgress(
                              ingredient: "Fat",
                              progress: 0.2,
                              progressColor: Colors.yellow,
                              leftAmount: 61,
                              width: width * 0.3,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height*0.39,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey,
              height: height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(
                        bottom: 1,
                        left: 32,
                        right: 16,
                      ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "MEAL FOR TODAY",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 30,
                          ),
                          for(int i = 0 ; i < meals.length ; i++)
                            _MealCard(
                              meal: meals[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 500),
                      closedColor: const Color(0xFFE9E9E9),
                      closedBuilder: (
                          BuildContext _,
                          VoidCallback openContainer
                      )
                      {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 8,
                              bottom: 0,
                              right: 12,
                              left: 12,
                            ),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF200087),
                                    Color(0xFF20008C),
                                  ],
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 0,                   //here left is 16
                                  ),
                                  child: Center(
                                    child: Text(
                                      "YOUR NEXT WORKOUT",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top:0,
                                    left: 0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Upper Body",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 55,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius:BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/chest.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius:BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/back.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius:BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/biceps.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      openBuilder: (
                          BuildContext context,
                          VoidCallback _,
                      )
                      {
                        return const WorkoutScreen();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {

  final String ingredient;
  final double leftAmount;
  final double progress ;
  final Color progressColor;
  final double width;

  const _IngredientProgress({Key? key,
        required this.progressColor, required this.ingredient, required this.leftAmount, required this.progress ,
    required this.width
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase() ,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        )
      ],
    );
  }
}


class _RadialProgress extends StatelessWidget {
  final double height , width , progress;

  const _RadialProgress({Key? key,required this.height,
    required this.width,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "1731",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF200087)
                    ),
                  ),
                  TextSpan(
                    text: "\n",
                  ),
                  TextSpan(
                    text: "   kcal left",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF200087)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter{

  late final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..strokeWidth = 10
        ..color = const Color(0xFF200087)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
    Offset center = Offset(
        size.width/2,
      size.height/2,
    );
    double relativeProgress = 360 * progress;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width/2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class _MealCard extends StatelessWidget {
  //const _MealCard({Key? key}) : super(key: key);

  final Meal meal;

  const _MealCard({key ,required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                  closedElevation: 0,
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (
                    BuildContext context,
                    VoidCallback _,
                    )
                {
                  return MealDetailScreen(meal: meal,);
                },
                closedBuilder: (
                    BuildContext context,
                    VoidCallback openContainer,
                )
                {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Image.asset(
                        meal.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                        // fit: BoxFit.fitHeight,
                      ),
                    ),
                  );
                }
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        meal.mealTime,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${meal.kiloCaloriesBurnt} kcal",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                              Icons.access_time,
                              size: 15,
                              color: Colors.black12,
                            ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                              "${meal.timeTaken} min",
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
