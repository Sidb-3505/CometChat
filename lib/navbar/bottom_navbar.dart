import 'package:comet_chat/helper/helper_functions.dart';
import 'package:comet_chat/screens/home_screen.dart';
import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CometChatBottomNav extends StatefulWidget {
  const CometChatBottomNav({super.key});

  @override
  _CometChatBottomNavState createState() => _CometChatBottomNavState();
}

class _CometChatBottomNavState extends State<CometChatBottomNav> {
  /// to manage the different screen
  int _selectedIndex = 0;

  /// screens options to be navigated
  final List<Widget> _screens = [
    HomeScreen(),
    CometChatCallLogs(),
    CometChatUsers(),
  ];

  /// to refresh the changes after tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      /// showing option buttons
      floatingActionButton: _selectedIndex == 0
          ? SpeedDial(
              icon: Icons.add,
              activeIcon: Icons.close,
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              children: [
                /// logout button
                SpeedDialChild(
                  child: Icon(Icons.logout),
                  label: 'Logout',
                  onTap: () => Dialogs.logout(context),
                  backgroundColor: Colors.red,
                ),

                /// add user button
                SpeedDialChild(
                  child: Icon(Icons.person_add),
                  label: 'Add User',
                  onTap: () => Dialogs.onAddUser(context),
                  backgroundColor: Colors.blue,
                ),
              ],
            )
          : null,

      /// bottom navigation bar for tab selection
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          /// chats tab
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),

          /// call logs tab
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),

          /// show current added users tab
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
        ],
      ),
    );
  }
}
