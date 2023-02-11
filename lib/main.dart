import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const BMI(),
    ),
  );
}


class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  String gender = "";
  double height = 0;
  double weight = 0;
  int age = 2;
  double convertMeter = 0;
  double calculateBMI = 0;
  String finalAns = "";
  final Duration initialDelay = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff090E21),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            DelayedDisplay(
              delay: Duration(seconds: initialDelay.inSeconds + 1),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            gender = "Female";
                          });
                        },
                        child: Container(
                            height: 160,
                            width: W,
                            decoration: BoxDecoration(
                              color: const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: gender == "Female"
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.female_rounded,
                                    color: Colors.white, size: 100),
                                Text("Female", style: TextStyle(fontSize: 16),),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            gender = "Male";
                          });
                        },
                        child: Container(
                            height: 160,
                            width: W,
                            decoration: BoxDecoration(
                              color: const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: gender == "Male"
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.male_rounded,
                                    color: Colors.white, size: 100),
                                Text("Male", style: TextStyle(fontSize: 16),),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: initialDelay.inSeconds + 2),
              child: SizedBox(
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    // height: H,
                    width: W,
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1E33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            color: Color(0xff626473),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${height.toInt()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Text(
                              "cm",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff626473),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 1,
                              thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 8),
                              overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 5),
                              thumbColor: Color(0xffEB1555),
                              activeTrackColor: Color(0xff605463),
                              inactiveTrackColor: Color(0xff373743),
                            ),
                            child: Slider(
                              min: 0,
                              max: 200,
                              onChanged: (val) {
                                setState(() {
                                  height = val;
                                });
                              },
                              value: height,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: initialDelay.inSeconds + 3),
              child: SizedBox(
                height: 190,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          // height: H,
                          width: W,
                          decoration: BoxDecoration(
                            color: const Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Weight",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${weight.toInt()}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 53,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          (weight > 0) ? weight-- : null;
                                        });
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4C4F5E),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "−",
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4C4F5E),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "+",
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Color(0xffF67FA4),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          // height: H,
                          width: W,
                          decoration: BoxDecoration(
                            color: const Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Age",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "$age",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 53,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          (age > 2) ? age-- : 2;
                                        });
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4C4F5E),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "−",
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4C4F5E),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "+",
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Color(0xffF67FA4),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 4),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 75,
                      width: W,
                      decoration: BoxDecoration(
                        color: const Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            calculateBMI.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            finalAns,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 5),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          if (gender == "Male" || gender == "Female") {
                            if (age > 2) {
                              convertMeter = height / 100; // cm to meter
                              calculateBMI =
                                  weight / (convertMeter * convertMeter);
                              if (calculateBMI < 18.5) {
                                finalAns = "Underweight";
                              } else if (calculateBMI >= 18.5 &&
                                  calculateBMI < 25) {
                                finalAns = "Normal weight";
                              } else if (calculateBMI >= 25 &&
                                  calculateBMI < 30) {
                                finalAns = "Overweight";
                              } else {
                                finalAns = "Obesity";
                              }
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 60,
                        width: W,
                        decoration: BoxDecoration(
                          color: const Color(0xffEB1555),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            //
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff090E21),
    );
  }
}
