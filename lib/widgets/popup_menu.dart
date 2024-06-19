import 'package:flutter/material.dart';

void handleMenuItemClick(BuildContext context, int item) {
  switch (item) {
    case 0:
    // Handle complaints
      break;
    case 1:
    // Handle my profile
      break;
    case 2:
    // Handle logout
      break;
  }
}

class PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (item) => handleMenuItemClick(context, item),
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          value: 0,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
          ),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.report_problem),
            title: Text('Complaints'),
          ),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ),
      ],
    );
  }
}
