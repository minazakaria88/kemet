import 'package:exlpore_egypt/productscubit/ProductsCubit.dart';
import 'package:exlpore_egypt/productscubit/productsstate.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: BlocConsumer<ProductsCubit,ProductsState>(
        listener: (context, state) {

        },
        builder:  (context, state) {
          var list=ProductsCubit.get(context).products;
          return Scaffold(
            appBar: AppBar(
              elevation: 10,
              flexibleSpace: const Image(
                image: AssetImage('images/appbar.jpg'),
                fit: BoxFit.cover,
              ),
              title: const Text('Products price',style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  bottom: 8,
                  top: 1,
                ),
                child: list.isNotEmpty? ListView.separated(
                  physics:const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: defaultColor2,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 8,
                            ),
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 160,
                            child: Image.network(
                              list[index].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Padding(
                                padding: const EdgeInsets.only(
                                    left: 20,
                                    bottom: 15,
                                    top: 10,
                                    right: 20
                                ),
                                child: Text(
                                  list[index].name!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                          ),
                               Padding(
                                 padding: const EdgeInsets.only(
                                     left: 20,
                                     bottom: 15,
                                     top: 10,
                                     right: 20
                                 ),
                                 child: Text(
                                   list[index].price!,
                                   style: const TextStyle(
                                       color: Colors.white,
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                               ),
                             ],
                           ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder:(context, index) => Container(
                    height: 2,
                  ),
                  itemCount: list.length,
                ):const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
