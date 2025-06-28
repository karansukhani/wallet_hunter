import 'package:flutter/material.dart';
import 'package:wallet_hunter/screens/associated_temples_list_screen/component/row_temple_list.dart';
import 'package:wallet_hunter/screens/associated_temples_list_screen/model/temple_data.dart';
import 'package:wallet_hunter/screens/head_registration_screen/model/head_model_entity.dart';
import 'package:wallet_hunter/utils/global.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_value.dart';

class TempleListScreen extends StatefulWidget {
  const TempleListScreen({super.key});

  @override
  State<TempleListScreen> createState() => _TempleListScreenState();
}

class _TempleListScreenState extends State<TempleListScreen> {
  List<TempleData> filteredTemples = [];
  List<TempleData> originalTemples = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getTemples();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Linked Temples", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: filterSearch,
              decoration: InputDecoration(
                hintText: 'Search Temples...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Temples in Your Samaj",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTemples.length,
              itemBuilder: (context, index) {
                return RowTempleList(temple: filteredTemples[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterSearch(String query) {
    setState(() {
      filteredTemples = originalTemples
          .where((temple) =>
              temple.name.toLowerCase().contains(query.toLowerCase()) ||
              temple.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> getTemples() async {
    HeadModelEntity headPersonData = await PrefValue.headModel();
    originalTemples = AppGlobal.getTemplesBySamaj(headPersonData.samajName ?? "Other");
    filteredTemples = originalTemples;
    setState(() {
      originalTemples;
      filteredTemples;
    });
  }
}
