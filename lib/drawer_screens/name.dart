import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';

class NameTranslate extends StatefulWidget {
  const NameTranslate({Key? key}) : super(key: key);

  @override
  _NameTranslateState createState() => _NameTranslateState();
}

class _NameTranslateState extends State<NameTranslate> {
  List<String> alpha = [];
  String filter = 'abcdefghijklmnopkrstuvwxyz';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('images/appbar.jpg'),
          fit: BoxFit.cover,
        ),
        title: const Text(
          'name in hieroglyphic',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: defaultColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22
                    ),
                    cursorColor: defaultColor1,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'your name',
                      hintStyle:  TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onChanged: (String s) {
                      setState(() {
                        alpha = [];
                      });
                      if (s.isNotEmpty) {
                        for (int j = 0; j < s.length; j++) {
                          for (int i = 0; i < filter.length; i++) {
                            if (s[j] == filter[i]) {
                              setState(() {
                                alpha.add(s[j]);
                              });
                              break;
                            }
                          }
                        }
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              alpha.isNotEmpty
                  ? SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                    'images/img/${alpha[index]}.png'),
                              ),
                          separatorBuilder: (context, index) => Container(
                                width: 3,
                              ),
                          itemCount: alpha.length),
                    )
                  : Expanded(
                      child: Container(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
