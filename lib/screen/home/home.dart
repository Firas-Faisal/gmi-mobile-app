import 'package:flutter/material.dart';
import 'package:gmi_mobile_app/screen/home/widget/diploma_tab.dart';
import 'package:gmi_mobile_app/screen/home/widget/pre_u_tab.dart';

class Programmes extends StatelessWidget {
  const Programmes({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Update this to 2 to match the number of tabs
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const TabBar(
              isScrollable: false,
              unselectedLabelColor: Colors.grey, // Other tabs color
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                  child: Text('DIPLOMA'),
                ),
                Tab(
                  child: Text('PRE-UNIVERSITY PROGRAMME'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DiplomaTab(), // No const here since it's a StatefulWidget
                  const PreUTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
