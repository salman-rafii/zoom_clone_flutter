import 'package:flutter/material.dart';
import 'package:zoom_clone_flutter/screens/history_meeting_screen.dart';
import 'package:zoom_clone_flutter/screens/meeting_screen.dart';
import 'package:zoom_clone_flutter/utils/colors.dart';
import 'package:zoom_clone_flutter/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const MeetingScreen(),
    const HistoryMeetingScreen(),
    const Center(
      child: Text("Contacts"),
    ),
    const Center(
      child: Text("Settings"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const CustomText(
          text: "Meet & Chat",
        ),
        centerTitle: true,
      ),
      body: const MeetingScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: whiteColor,
        unselectedItemColor: greyColor,
        unselectedFontSize: 14.0,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        onTap: onPageChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: "Meet & Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: "Meetings",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
