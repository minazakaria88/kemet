import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void goTo({context, screen}) => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));

Widget newButton({
  String? text,
  IconData? icon,
  Function? function,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 20
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: defaultColor2,
        ),
        child: MaterialButton(
            onPressed: () {
              function!();
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );

Widget progress() =>  Center(
    child: CircularProgressIndicator(
      color: defaultColor2,
    ));


Widget weatherItem(model) => Container(
      width: double.infinity,
      height: 330,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: defaultColor2,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
            ),
          ]),
      child: model == null
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:  [
                      const SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: defaultColor1,
                        radius: 7,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Live Weather',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.network(
                          'http://openweathermap.org/img/w/${model.image}.png',
                          fit: BoxFit.cover,
                        ))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${model.temp}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        '${model.status}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${model.name},${model.date}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );

Widget weatherItemList(model, index, days, list) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (index + 1) % 2 != 0 ? defaultColor2 : defaultColor1,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
            ),
          ],
        ),
        height: 100,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              days[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'http://openweathermap.org/img/w/${list[index]['weather'][0]['icon']}.png',
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${list[index]['temp']['day']}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Text(
                    '${list[index]['weather'][0]['main']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${model?.name},${model?.date}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget drawerItem({
  String? text,
  IconData? iconData,
  context,
  Widget? screen,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 1),
      child: Card(
        color: defaultColor1,
        child: ListTile(
          focusColor: Colors.red,
          leading: Icon(
            iconData,
            color: Colors.white
          ),
          title: Text(
            text!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17
            ),
          ),

          onTap: () {
            goTo(context: context, screen: screen);
          },
        ),
      ),
    );

Widget listItem({
  Function? onTap,
  model,
}) =>
    InkWell(
      onTap: () {
        onTap!();
      },
      splashColor: Colors.red,
      highlightColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: defaultColor2,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 8,
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 140,
                child: Image.network(
                  model!.image!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, bottom: 10, top: 10, right: 10),
                child: Text(
                  model.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      //fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget myBorder() => Container(
      height: 2,
      color: Colors.black,
    );
Color defaultColor1=const Color(0xFFed9e67);
Color defaultColor2=const Color(0xFF281e32);
Color defaultColor3=const Color(0xFFbcbcbc);
Color defaultColor4=const Color(0xFF86370e);





Widget itemClick({
  model,
  context,
  Function ? function,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.red,
        highlightColor: Colors.green,
        focusColor: Colors.red,
        onTap: ()
        {
          function!();
        },
        child: Card(
          elevation: 5,
          color: defaultColor2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    '${model.image}',
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${model.name}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );


Widget searchItem(model,context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Card(
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                '${model.image}',
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${model.name}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                newColumn(
                  name: 'origin',
                  value: model.origin,
                ),
                newColumn(
                  name: 'category',
                  value: model.category,
                ),
                newColumn(
                  name: 'video',
                  value: 'YouTube',
                  video: model.video,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'instruction : ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${model.instruction}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);






Widget newColumn({
  name,
  value,
  video,
}) => Column(
  children: [
    Text(
      '$name',
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
    value!='YouTube'?Text(
      '$value',
      style: const TextStyle(
        color: Colors.black,
      ),
    )
        :
    InkWell(
      onTap: ()
      {
        final Uri url = Uri.parse('$video');
        launchUrl(url);
      },
      child: Text(
        '$value',
        style: const TextStyle(
          color: Colors.blue,
        ),
      ),
    ),
  ],
);