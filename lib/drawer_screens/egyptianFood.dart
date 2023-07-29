import 'package:exlpore_egypt/foodcubit/foodcubit.dart';
import 'package:exlpore_egypt/foodcubit/foodstate.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../details_screen/food_details.dart';

class EgyptianFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit,FoodSate>(
      listener: (context, state) {

      },
      builder:  (context, state) {
        var list=FoodCubit.get(context).foodModel;
        if(list==null)
          {
            FoodCubit.get(context).getData();
          }
        return Scaffold(
          appBar: AppBar(
            elevation: 10,
            flexibleSpace: const Image(
              image: AssetImage('images/appbar.jpg'),
              fit: BoxFit.cover,
            ),
            title: const Text(
              'Egyptian Food',
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
            child: list!=null?ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => itemClick(
                  context: context,
                  model: list.foods[index],
                  function: ()
                    {
                      FoodCubit.get(context).getSearchFood(list.foods[index].name!).then((value) {
                        goTo(
                          context: context,
                          screen: const FoodDetails(),
                        );
                      });
                    }
                ),
              itemCount: list.foods.length,
            ):progress(),
          ),
        );
      },
    );
  }
}
