import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exlpore_egypt/productscubit/productsstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/productsmodel.dart';

class ProductsCubit extends Cubit<ProductsState>
{
  ProductsCubit():super(InitState());

  static ProductsCubit get(context)=>BlocProvider.of(context);

  List<ProductsModel> products=[];
  void getProducts()
  {
    FirebaseFirestore.instance.collection('products')
        .get()
        .then((value) {
      for (var element in value.docs) {
        products.add(ProductsModel.fromJson(element.data()));
      }
      emit(GetProductsSuccess());
    }).catchError((error){
      emit(GetProductsError());
    });
  }

}
