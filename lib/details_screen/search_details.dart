



import 'package:exlpore_egypt/shared/searchmodel.dart';
import 'package:flutter/material.dart';

import '../shared/reuable.dart';

class SearchDetails extends StatelessWidget {
   SearchModel ? model;
   SearchDetails(
       this.model,
       );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        flexibleSpace: const Image(
          image: AssetImage('images/appbar.jpg'),fit: BoxFit.cover,
        ),
        title: const Text(
          'Search details',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 2,
            ),
            SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(model!.image!)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                model!.name!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            myBorder(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Description : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                model!.description!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
