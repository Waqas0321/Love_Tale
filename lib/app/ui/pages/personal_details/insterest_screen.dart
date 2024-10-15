import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/Auth/location_Screen.dart';
import 'package:love_tale/app/ui/pages/personal_details/location_screen.dart';
class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  int? _selectedValue; // This will store the selected value

  void _onChanged(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "Who would you like to see?",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "We want to make sure we find the right for you. You can always update this later",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 18),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.black26),
                      child: RadioListTile<int>(
                        title: Text("I'd liek to see men"),
                        value: 1,
                        groupValue: _selectedValue,
                        onChanged: _onChanged,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.black26),
                      child: RadioListTile<int>(
                        title: Text("I'd liek to see women"),
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: _onChanged,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.black26),
                      child: RadioListTile<int>(
                        title: Text("I'd liek to see everyone"),
                        value: 3,
                        groupValue: _selectedValue,
                        onChanged: _onChanged,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                      child:
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white
                              ),
                              onPressed: () {
                                Get.to(LocationMapScreen());
                              }, child: Text('Continue',style: TextStyle(fontWeight: FontWeight.w600),))),
                ))
          ],
        ),
      ),
    );
  }
}
