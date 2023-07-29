import 'package:exlpore_egypt/foodcubit/foodcubit.dart';
import 'package:exlpore_egypt/foodcubit/foodstate.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit,FoodSate>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var model=FoodCubit.get(context).searchFoodModel;
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: const Image(
              image: AssetImage('images/appbar.jpg'),fit: BoxFit.cover,
            ),
            title: const Text(
              'Food details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
              ),
            ),
          ),
         body: model!=null?  SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
             child: searchItem(model, context)):progress(),
        );
      },
    );
  }
}
