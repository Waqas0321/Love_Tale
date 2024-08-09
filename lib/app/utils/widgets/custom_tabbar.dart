import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width / 50,
            left: MediaQuery.of(context).size.width / 70,
            right: MediaQuery.of(context).size.width / 70
        ),
        child: Center(
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.pink,
            dividerHeight: 1,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            tabs: tabs.map((tab) {
              return SizedBox(
                child: Center(
                  child: Tab(
                    text: tab,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
