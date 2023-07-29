

import 'dart:io';

import 'package:exlpore_egypt/appcubit/cubit.dart';
import 'package:exlpore_egypt/appcubit/state.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
     listener: (context, state) {
     },
      builder: (context, state) {
       var cubit=AppCubit.get(context);
       var image=cubit.image;
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: defaultColor2,
                      width: 5
                    ),
                   borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                        image: image==null? const AssetImage('images/py.jpg'):FileImage(File(image.path)) as ImageProvider,
                    ),
                  ),
                ),
              ),
              if( state is LoadingState)
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: defaultColor2,
                  ),
                ),
              newButton(
                  text: 'camera',
                  icon: Icons.camera_alt,
                  function: (){
                     cubit.getImageFromCamera(context);
                  }
              ),
              newButton(
                  text: 'gallery',
                  icon: Icons.image_outlined,
                  function: ()
                  {
                       cubit.getImageFromGallery(context);
                  }
              ),
            ],
          ),
        );
      },
    );
  }
}
/*
);*/