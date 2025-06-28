import 'dart:io';
import 'dart:typed_data' as type;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallet_hunter/utils/color_constants.dart';
import 'package:wallet_hunter/utils/other.dart';

import 'logic/family_tree_cubit.dart';

class FamilyTreeScreen extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => FamilyTreeCubit(),
      child: const FamilyTreeScreen(),
    );
  }

  const FamilyTreeScreen({super.key});

  @override
  State<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends State<FamilyTreeScreen> {
  GlobalKey repaintBoundaryKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<FamilyTreeCubit>().loadFamilyTree();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family Trees", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: exportImage,
        icon: const Icon(Icons.download, color: Colors.white, size: 18),
        label: const Text(
          "Export Family Tree",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        backgroundColor: Colors.purple,
      ),
      body: BlocBuilder<FamilyTreeCubit, FamilyTreeState>(
        builder: (context, state) {
          if (state is FamilyTreeLoading) {
            return const Center(child: CircularProgressIndicator(color: purple));
          } else if (state is FamilyTreeSuccess) {
            return RepaintBoundary(
              key: repaintBoundaryKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sectionTitle("Head of Family"),
                    Center(child: memberCard(state.head.name ?? "", "Head")),
                    const SizedBox(height: 24),
                    sectionTitle("Spouse & Children"),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: state.spouseChildren.map((member) {
                        return memberCard(getFullName(member.firstName, member.middleName, member.lastName),
                            member.relationWithHead ?? "");
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                    sectionTitle("Grandchildren"),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: state.grandChildren.map((member) {
                        return memberCard(getFullName(member.firstName, member.middleName, member.lastName),
                            member.relationWithHead ?? "");
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                    sectionTitle("Extended Family"),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: state.extendedFamily.map((member) {
                        return memberCard(getFullName(member.firstName, member.middleName, member.lastName),
                            member.relationWithHead ?? "");
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }

  Future<void> exportImage() async {
    try {
      RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      type.ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      type.Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/family_tree.png';
      final file = File(imagePath);
      await file.writeAsBytes(pngBytes);

      await Share.shareXFiles([XFile(imagePath)], text: "My Family Tree");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Export failed: $e')),
      );
    }
  }

  Widget sectionTitle(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          height: 2,
          width: 100,
          color: Colors.pink.shade300,
        ),
        const SizedBox(height: 6),
      ],
    );
  }

  Widget memberCard(String name, String relation) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            relation,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
