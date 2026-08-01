import 'package:flutter/material.dart';

class MyReportsScreen extends StatefulWidget {
  const MyReportsScreen({super.key});

  @override
  State<MyReportsScreen> createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  final List<Map<String, dynamic>> reports = [
    {
      "item": "iPhone 15 Pro",
      "status": "Lost",
      "location": "Library",
      "date": "28 July 2026"
    },
    {
      "item": "Student ID",
      "status": "Found",
      "location": "Main Gate",
      "date": "30 July 2026"
    },
    {
      "item": "Dell Laptop",
      "status": "Lost",
      "location": "Lecture Hall B",
      "date": "31 July 2026"
    },
  ];

  Color statusColor(String status) {
    return status == "Lost" ? Colors.red : Colors.green;
  }

  void deleteReport(int index) {
    setState(() {
      reports.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Report deleted."),
      ),
    );
  }

  void editReport(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Editing ${reports[index]["item"]} (coming soon)"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Reports"),
      ),
      body: reports.isEmpty
          ? const Center(
              child: Text(
                "No reports available.",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          statusColor(report["status"]),
                      child: const Icon(
                        Icons.inventory,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(report["item"]),
                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text("Location: ${report["location"]}"),
                        Text("Date: ${report["date"]}"),
                        const SizedBox(height: 5),
                        Chip(
                          label: Text(report["status"]),
                          backgroundColor:
                              statusColor(report["status"]),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == "Edit") {
                          editReport(index);
                        } else if (value == "Delete") {
                          deleteReport(index);
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: "Edit",
                          child: Text("Edit"),
                        ),
                        PopupMenuItem(
                          value: "Delete",
                          child: Text("Delete"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}