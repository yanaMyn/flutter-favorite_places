import 'dart:io';

import 'package:favorite_places/providers/user_place.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlacesScreen extends ConsumerStatefulWidget {
  const AddPlacesScreen({super.key});

  @override
  ConsumerState<AddPlacesScreen> createState() {
    return _AddPlacesScreenState();
  }
}

class _AddPlacesScreenState extends ConsumerState<AddPlacesScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _saveItem() {
    final textTitle = _titleController.text;
    if (textTitle.isEmpty || _selectedImage == null) {
      return;
    }

    ref.read(userPlaceProvider.notifier).addPlace(textTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text(
                  "Title",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              controller: _titleController,
            ),
            const SizedBox(height: 16),
            ImageInput(onPickedImage: (image) {
              _selectedImage = image;
            },),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                _saveItem();
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
