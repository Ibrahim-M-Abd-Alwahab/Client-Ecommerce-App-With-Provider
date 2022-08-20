import 'package:e_commerce_app/Views/screens/category/widgets/category_details_widget.dart';
import 'package:e_commerce_app/providers/firestore_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(builder: (context, provider, x) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("All Categories").tr(),
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            elevation: 0,
            backgroundColor: Color(0xff1572A1),
            foregroundColor: Colors.white,
          ),
          body: Stack(
            children: [
              provider.categories.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: provider.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child:
                              CategoryDetailsWidget(provider.categories[index]),
                        );
                      },
                    ),
            ],
          ));
    });
  }
}
