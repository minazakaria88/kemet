import 'package:exlpore_egypt/appcubit/cubit.dart';
import 'package:exlpore_egypt/appcubit/state.dart';
import 'package:exlpore_egypt/drawer_screens/chatbot.dart';
import 'package:exlpore_egypt/drawer_screens/egyptianFood.dart';
import 'package:exlpore_egypt/drawer_screens/name.dart';
import 'package:exlpore_egypt/drawer_screens/products.dart';
import 'package:exlpore_egypt/drawer_screens/weather.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getPlaces()
        ..getEvents(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 10,
              flexibleSpace: const Image(
                image: AssetImage('images/appbar.jpg'),
                fit: BoxFit.cover,
              ),
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            body: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.jpg'),
                        fit: BoxFit.cover)),
                child: cubit.screens[cubit.currentIndex]),
            bottomNavigationBar: FloatingNavbar(
              backgroundColor: defaultColor2,
              selectedBackgroundColor: defaultColor1,
              selectedItemColor: Colors.white,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                FloatingNavbarItem(icon: Icons.home_filled, title: 'Places'),
                FloatingNavbarItem(
                    icon: Icons.image_search_outlined, title: 'Search'),
                FloatingNavbarItem(icon: Icons.event, title: 'Events'),
              ],
            ),
            drawer: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/lol.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Drawer(
                backgroundColor: defaultColor2,
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/lol.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: null,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    drawerItem(
                      text: 'Chatbot',
                      iconData: Icons.chat,
                      context: context,
                      screen: ChatBot(),
                    ),
                    drawerItem(
                      text: 'Egyptian Food',
                      iconData: Icons.fastfood,
                      context: context,
                      screen: EgyptianFood(),
                    ),
                    drawerItem(
                      text: 'your name in hieroglyphic',
                      context: context,
                      iconData: Icons.edit,
                      screen: const NameTranslate(),
                    ),
                    drawerItem(
                      text: 'Weather',
                      iconData: Icons.cloud,
                      context: context,
                      screen: Weather(),
                    ),
                    drawerItem(
                      text: 'products price',
                      iconData: Icons.attach_money,
                      context: context,
                      screen: const Products(),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () {
               cubit.status? cubit.stopMusic():cubit.playMusic("music/music.mp3");
              },
              child: Icon(
                      cubit.status? Icons.pause:Icons.play_arrow,
                      size: 35,
                      color: Colors.white,
                    ),
            ),
          );
        },
      ),
    );
  }
}
