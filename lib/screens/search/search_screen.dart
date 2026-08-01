import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> items = [
    {
      "name": "iPhone 15 Pro",
      "category": "Phone",
      "location": "Library",
      "status": "Lost"
    },
    {
      "name": "HP Laptop",
      "category": "Laptop",
      "location": "Lecture Hall B",
      "status": "Found"
    },
    {
      "name": "Student ID",
      "category": "ID Card",
      "location": "Cafeteria",
      "status": "Lost"
    },
    {
      "name": "Black Backpack",
      "category": "Bag",
      "location": "Parking Area",
      "status": "Found"
    },
  ];

  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void searchItem(String keyword) {
    setState(() {
      filteredItems = items.where((item) {
        return item["name"]!
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            item["category"]!
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            item["location"]!
                .toLowerCase()
                .contains(keyword.toLowerCase());
      }).toList();
    });
  }

  Color statusColor(String status) {
    return status == "Lost" ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Items"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: searchItem,
              decoration: InputDecoration(
                hintText: "Search item...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: statusColor(item["status"]!),
                        child: const Icon(
                          Icons.inventory,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(item["name"]!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Category: ${item["category"]}"),
                          Text("Location: ${item["location"]}"),
                        ],
                      ),
                      trailing: Chip(
                        label: Text(item["status"]!),
                        backgroundColor: statusColor(item["status"]!),
                        labelStyle:
                            const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}