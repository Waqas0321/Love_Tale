import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_tale/app/ui/pages/likesScreen.dart';
import 'package:love_tale/app/ui/pages/topPicksScreen.dart';

class MatechesScreen extends StatefulWidget {
   MatechesScreen({super.key});

  @override
  State<MatechesScreen> createState() => _MatechesScreenState();
}

class _MatechesScreenState extends State<MatechesScreen> {
  String _currentSelection = "Likes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SegmentedButton(
                  multiSelectionEnabled: false,
                  showSelectedIcon: false,
                  segments: [
                    ButtonSegment(
                        label: Text("4 Likes"),
                        value: "Likes"),
                    ButtonSegment(
                        label: Text("3 Top Picks"),
                        value: "TopPicks"),

                  ], selected: {_currentSelection},
                  onSelectionChanged: (value) {
                    setState(() {
                      _currentSelection = value.first;
                    });

                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith((states) {
                        if(states.contains(MaterialState.selected)){
                          return Colors.white;
                        }else{
                          return Colors.black;
                        }
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if(states.contains(MaterialState.selected)){
                          return Colors.redAccent;
                        }else{
                          return Colors.white;
                        }
                      },
                      )
                  ),
                ),
                Expanded(child: _currentSelection == "Likes"? ThreeLikesScreen(): TopPickesScreen())
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //     body: Padding(
    //   padding: EdgeInsets.only(
    //       left: MediaQuery.of(context).size.width / 6,
    //       right: MediaQuery.of(context).size.width / 6),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       CustomSvgImage(assetPath: "assets/images/startig.svg",height: 150,width: 150, color: Colors.pink,),
    //       SizedBox(height: MediaQuery.of(context).size.width / 32),
    //       Text(
    //         "Matches",
    //         style: Theme.of(context).textTheme.headlineMedium,
    //       ),
    //       SizedBox(height: MediaQuery.of(context).size.width / 30),
    //       Text(
    //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
    //     ],
    //   ),
    // ));
  }
}
