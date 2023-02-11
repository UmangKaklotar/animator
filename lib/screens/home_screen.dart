import 'package:animation_list/animation_list.dart';
import 'package:animator/utils/color.dart';
import 'package:animator/utils/planet_list.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/denys-churchyn-Kwmz_c_NiYk-unsplash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Galaxy Planets", style: TextStyle(fontSize: 20),),
            ),
            Expanded(
              child: AnimationList(
                  duration: 4000,
                  reBounceDepth: 0,
                  physics: const BouncingScrollPhysics(),
                  children: Planet.planetList.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, 'detail', arguments: Planet.planetList.indexOf(e));
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 150,
                        width: width,
                        decoration: BoxDecoration(
                          color: MyColors.bgContainer.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: 100,
                                child: Hero(
                                  tag: e['file'],
                                  child: ModelViewer(
                                    src: e['file'],
                                    autoRotate: true,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(e['name'], style: const TextStyle(fontSize: 20),),
                                Text(e['type'], style: TextStyle(fontSize: 16, color: MyColors.grey),),
                                Text(e['radius'], style: TextStyle(fontSize: 16, color: MyColors.grey),),
                                Text(e['year'], style: TextStyle(fontSize: 16, color: MyColors.grey),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
