import 'package:flutter/material.dart';
import '../models/collections.dart';

class CollectionDetails extends StatelessWidget {
  final int collectionId;
  CollectionDetails({this.collectionId});

  @override
  Widget build(BuildContext context) {
    final collectionData = Collection.fetchByID(collectionId);
    return Container(
        padding: EdgeInsets.all(50), child: Text(collectionData.title));
  }
}
