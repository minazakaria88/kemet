import 'package:exlpore_egypt/foodcubit/foodstate.dart';
import 'package:exlpore_egypt/shared/dio.dart';
import 'package:exlpore_egypt/shared/foodModel.dart';
import 'package:exlpore_egypt/shared/searchfoodmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCubit extends Cubit<FoodSate> {
  FoodCubit() : super(InitSate());

  static FoodCubit get(context) => BlocProvider.of(context);
  FoodModel? foodModel;
  void getData() {
    DioHelper.getDataFood(url: 'api/json/v1/1/filter.php', query: {
      'a': 'Egyptian',
    }).then((value) {
      foodModel = FoodModel.fromJson(value.data);
      emit(GetDataSuccess());
    });
  }

  SearchFoodModel? searchFoodModel;
  Future getSearchFood(String name) {
    return DioHelper.getDataFood(url: 'api/json/v1/1/search.php', query: {
      's': name,
    }).then((value) {
      searchFoodModel = SearchFoodModel.fromJson(value.data['meals'][0]);
      emit(GetDataSearchSuccess());
    });
  }
}
