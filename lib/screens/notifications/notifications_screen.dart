import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Item Match Found",
        "message":
            "A black backpack matching your report has been found.",
        "time": "5 min ago",
        "icon": Icons.search,
        "color": Colors.green,
      },
      {
        "title": "Report Approved",
        "message":
            "Your lost iPhone report has been verified.",
        "time": "1 hour ago",
        "icon": Icons.verified,
        "color": Colors.blue,
      },
      {
        "title": "Claim Approved",
        "message":
            "Congratulations! Your claim has been approved.",
        "time": "Yesterday",
        "icon": Icons.check_circle,
        "color": Colors.orange,
      },
      {
        "title": "Welcome",
        "message":
            "Thanks for joining Lost & Found.",
        "time": "2 days ago",
        "icon": Icons.favorite,
        "color": Colors.red,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: notification["color"] as Color,
                child: Icon(
                  notification["icon"] as IconData,
                  color: Colors.white,
                ),
              ),
              title: Text(
                notification["title"] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                notification["message"] as String,
              ),
              trailing: Text(
                notification["time"] as String,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}