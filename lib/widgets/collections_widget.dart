import 'package:dutch_learning/style.dart';
import 'package:flutter/material.dart';

import '../models/collections.dart';

class CollectionsWidget extends StatelessWidget {
  final collections = Collection.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(children: <Widget>[
          Text("Collections", style: TitleTextStyle),
          Expanded(
              child: ListView(
                  children: collections
                      .map((collection) => GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color:
                                        Color(0xFFFF000000).withOpacity(0.5)),
                              )),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(collection.title),
                                    Icon(Icons.ac_unit)
                                  ])),
                          onTap: () =>
                              _onCollectionTap(context, collection.id)))
                      .toList()))
        ]));
  }

  _onCollectionTap(BuildContext context, int collectionId) {
    Navigator.of(context)
        .pushNamed("/collection_details", arguments: collectionId);
  }
}
