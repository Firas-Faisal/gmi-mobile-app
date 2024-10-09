import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/screen/checker/checker.dart';
import 'package:gmi_mobile_app/screen/enquiry/enquiry.dart';
import 'package:gmi_mobile_app/screen/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class HamburgerMenuController extends GetxController {
  var selectedIndex = 0.obs;
  var appBarTitle = 'PROGRAMMES'.obs;
  // Method to update the selected index and AppBar title
  void updateIndex(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        appBarTitle.value = 'PROGRAMMES';
        break;
      case 1:
        appBarTitle.value = 'ELIGIBILITY CHECKER';
        break;
      case 2:
        appBarTitle.value = 'ENQUIRY';
        break;
      default:
        appBarTitle.value = '';
    }
  }
}

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final HamburgerMenuController controller =
        Get.put(HamburgerMenuController());

    List<Widget> widgetOptions = <Widget>[
      const HomeScreen(),
      const EligibilityCheckerScreen(),
      const EnquiryScreen(),
    ];

    return Scaffold(
      // Dynamically update AppBar title based on selection using Obx
      appBar: AppBar(
        // title: Image.asset(
        //   'asset/images/logo-gmi-header.webp',
        //   height: 40, // Adjust the height as needed
        //   fit: BoxFit.contain, // Ensure the aspect ratio is maintained
        title: Obx(
          () => Text(
            controller.appBarTitle.value,
            style: GoogleFonts.roboto(),
          ),
          // ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        // Use Obx to react to changes in the selectedIndex
        child: Obx(() => widgetOptions[controller.selectedIndex.value]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(),
              child:
                  Image(image: AssetImage('asset/images/logo-gmi-header.webp')),
            ),
            // Home ListTile

            Obx(() => Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(108, 158, 158, 158)))),
                  child: ListTile(
                    leading: const Icon(Icons.list_alt_rounded),
                    title: Text('PROGRAMMES',
                        style: GoogleFonts.roboto(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    selected: controller.selectedIndex.value == 0,
                    onTap: () {
                      controller.updateIndex(0); // Update index and title
                      Get.back(); // Close the drawer
                    },
                  ),
                )),
            // Business ListTile
            Obx(() => Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(108, 158, 158, 158)))),
                  child: ListTile(
                    leading: const Icon(Icons.check_rounded),
                    title: Text('ELIGIBILITY CHECKER',
                        style: GoogleFonts.roboto(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    selected: controller.selectedIndex.value == 1,
                    onTap: () {
                      controller.updateIndex(1); // Update index and title
                      Get.back(); // Close the drawer
                    },
                  ),
                )),
            // School ListTile
            Obx(() => Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(108, 158, 158, 158)))),
                  child: ListTile(
                    leading: const Icon(Icons.question_answer_rounded),
                    title: Text('ENQUIRY',
                        style: GoogleFonts.roboto(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    selected: controller.selectedIndex.value == 2,
                    onTap: () {
                      controller.updateIndex(2); // Update index and title
                      Get.back(); // Close the drawer
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
