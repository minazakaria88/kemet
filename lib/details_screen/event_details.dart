import 'package:exlpore_egypt/shared/eventsmodel.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  EventsModel ? model;
  EventDetails(this.model, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        flexibleSpace: const Image(
          image: AssetImage('images/appbar.jpg'),fit: BoxFit.cover,
        ),
        title: const Text(
          'Events details',
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
                child: Image.network(model!.image!,fit: BoxFit.cover,)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                model!.name!,
                style:  const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            myBorder(),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: double.infinity,
                color: defaultColor2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          size: 45,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            model!.location!,
                            maxLines: 3,
                            style:  const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            myBorder(),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: double.infinity,
                color: defaultColor2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                         const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Date',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            model!.date!,
                            style:   const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
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
              padding:const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
              child: Text(
                model!.description!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
           ]
        ),
      ),
    );
  }
}
