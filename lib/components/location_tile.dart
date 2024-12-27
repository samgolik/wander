import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wander/model/location.dart';

class LocationTile extends StatefulWidget {
  final Location location;
  final String userId;

  const LocationTile({super.key, required this.location, required this.userId});

  @override
  State<LocationTile> createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile> {
  bool _isChecked = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _fetchLocationStatus();
  }

  Future<void> _fetchLocationStatus() async {
    try {
      final userDoc = _firestore.collection('users').doc(widget.userId);
      final categoriesSnapshot = await userDoc.get();

      if (categoriesSnapshot.exists) {
        final data = categoriesSnapshot.data();
        final categories = data?['categories'] ?? [];

        for (var category in categories) {
          for (var location in category['locations']) {
            if (location['title'] == widget.location.title) {
              setState(() {
                _isChecked = location['visited'] ?? false;
              });
              return;
            }
          }
        }
      }
    } catch (e) {
      print('Error fetching location status: $e');
    }
  }

  Future<void> _updateLocationStatus(bool? value) async {
    if (value == null) return;

    setState(() {
      _isChecked = value;
    });

    try {
      final userDoc = _firestore.collection('users').doc(widget.userId);
      final categoriesSnapshot = await userDoc.get();

      if (categoriesSnapshot.exists) {
        final data = categoriesSnapshot.data();
        final categories = data?['categories'] ?? [];

        for (var category in categories) {
          for (var location in category['locations']) {
            if (location['title'] == widget.location.title) {
              location['visited'] = value;
            }
          }
        }

        await userDoc.set({'categories': categories}, SetOptions(merge: true));
      }
    } catch (e) {
      print('Error updating location status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          title: Text(
            widget.location.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          trailing: Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                _updateLocationStatus(value);
              },
              activeColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
