import 'package:exlpore_egypt/shared/placsesmodel.dart';
import 'package:flutter/material.dart';

import '../shared/reuable.dart';

class PlaceDetails extends StatelessWidget {
 PLacesModel model;
  PlaceDetails(this.model, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        flexibleSpace: const Image(
          image: AssetImage('images/appbar.jpg'),fit: BoxFit.cover,
        ),
        title: const Text(
          'Places details',
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
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                  width: double.infinity,
                  height: 200,
                  child: Image.network(model.image!,fit: BoxFit.cover,)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                model.name!,
                style:  const TextStyle(
                  color: Colors.black,
                  fontSize:20
                ),
              ),
            ),
            myBorder(),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                color: defaultColor2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        size: 45,
                        color: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          model.location!,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width/15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            myBorder(),
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Description : ',
                style: TextStyle(
                  color: defaultColor2,
                  fontSize: MediaQuery.of(context).size.width/15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
              child: Text(
                model.description!,
                style:  const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
