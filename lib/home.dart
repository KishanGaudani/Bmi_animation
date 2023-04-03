import 'package:flutter/material.dart';

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> with TickerProviderStateMixin {
  double MySlider = 90;
  double value = 0;
  int Weight = 30;
  int Age = 18;
  int TapWeight1 = 0;
  int TapWeight2 = 0;
  int TapAge1 = 0;
  int TapAge2 = 0;
  double Calculate1 = 0;
  String Calculate = "Calculate";

  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation sizeAnimationText;

  late Animation<Offset> femalePosition;
  late Animation<Offset> malePosition;
  late Animation<Offset> weightPosition;
  late Animation<Offset> agePosition;
  late Animation<Offset> heightPosition;

  bool isFemale = false;
  bool isMale = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    femalePosition = Tween<Offset>(
      begin: const Offset(-2, -2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.25,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );

    malePosition = Tween<Offset>(
      begin: const Offset(2, -2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.25,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );

    weightPosition = Tween<Offset>(
      begin: const Offset(-2, 2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.25,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );

    agePosition = Tween<Offset>(
      begin: const Offset(2, 2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.25,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );
    heightPosition = Tween<Offset>(
      begin: const Offset(0, -3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0,
          0.25,
          curve: Curves.bounceOut,
        ),
      ),
    );

    sizeAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );
    sizeAnimationText = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff090E21),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xff090E21),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, widget) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 30, right: 30, left: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideTransition(
                            position: femalePosition,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFemale = true;
                                  isMale = false;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: (isFemale == true)
                                      ? const Color(0xff3B3C4D)
                                      : const Color(0xff1D1E33),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.female,
                                      size: sizeAnimation.value,
                                      color: (isFemale == true)
                                          ? const Color(0xffEB1555)
                                          : Colors.white,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: (isFemale == true)
                                            ? const Color(0xffeb1555)
                                            : Colors.white,
                                        fontWeight: (isFemale == true)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: malePosition,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFemale = false;
                                  isMale = true;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: (isFemale == false)
                                        ? const Color(0xff3B3C4D)
                                        : const Color(0xff1D1E33),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.male,
                                        size: sizeAnimation.value,
                                        color: (isFemale == false)
                                            ? const Color(0xffEB1555)
                                            : Colors.white,
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: (isFemale == false)
                                              ? const Color(0xffeb1555)
                                              : Colors.white,
                                          fontWeight: (isFemale == false)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SlideTransition(
                      position: heightPosition,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.23,
                        decoration: BoxDecoration(
                          color: const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "HEIGHT",
                                  style: TextStyle(
                                    color: Color(0xff626476),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${MySlider.toInt()}",
                                  style: TextStyle(
                                    fontSize: sizeAnimationText.value,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Text(
                                  "cm",
                                  style: TextStyle(
                                    height: 4,
                                    color: Color(0xff626476),
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              value: MySlider.toDouble(),
                              onChanged: (val) {
                                setState(() {
                                  MySlider = val;
                                });
                              },
                              min: 90,
                              max: 270,
                              activeColor: const Color(0xffF5C1D1),
                              thumbColor: const Color(0xffEB1555),
                              inactiveColor: const Color(0xff555555),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideTransition(
                            position: weightPosition,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: const Color(0xff1D1E33),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Weight",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                  Text(
                                    "$Weight",
                                    style: TextStyle(
                                        fontSize: sizeAnimationText.value,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Weight--;
                                            TapWeight1 = 1;
                                            TapWeight2 = 0;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: (TapWeight1 == 1)
                                                ? const Color(0xff6E6F7A)
                                                : const Color(0xff4C4F5E),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Icon(
                                            Icons.horizontal_rule,
                                            color: (TapWeight1 == 1)
                                                ? const Color(0xffF67FA4)
                                                : const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Weight++;
                                            TapWeight1 = 0;
                                            TapWeight2 = 1;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: (TapWeight2 == 1)
                                                ? const Color(0xff6E6F7A)
                                                : const Color(0xff4C4F5E),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: (TapWeight2 == 1)
                                                ? const Color(0xffF67FA4)
                                                : const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: agePosition,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: const Color(0xff1D1E33),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Age",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                  Text(
                                    "$Age",
                                    style: TextStyle(
                                        fontSize: sizeAnimationText.value,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Age--;
                                            TapAge1 = 1;
                                            TapAge2 = 0;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: (TapAge1 == 1)
                                                ? const Color(0xff6E6F7A)
                                                : const Color(0xff4C4F5E),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Icon(
                                            Icons.horizontal_rule,
                                            color: (TapAge1 == 1)
                                                ? const Color(0xffF67FA4)
                                                : const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Age++;
                                            TapAge1 = 0;
                                            TapAge2 = 1;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: (TapAge2 == 1)
                                                ? const Color(0xff6E6F7A)
                                                : const Color(0xff4C4F5E),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: (TapAge2 == 1)
                                                ? const Color(0xffF67FA4)
                                                : const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.92,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              Calculate1 = (Weight / MySlider / MySlider) * 10000;
              if (Calculate1 <= 18.5) Calculate = "UnderWeight";
              if (Calculate1 >= 18.5 && Calculate1 <= 24.9) {
                Calculate = "Healthy";
              }
              if (Calculate1 >= 24.9 && Calculate1 <= 30) {
                Calculate = "OverWeight";
              }
              if (Calculate1 >= 30) Calculate = "Obese";
            });
          },
          child: Text(
            Calculate,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
