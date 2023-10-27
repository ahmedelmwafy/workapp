import 'package:workapp/helpers/dio.dart';
import 'package:workapp/model/home.dart';
import 'package:workapp/screens/home/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  bool isHomeLoading = false;
  Future<void> getHomeData() async {
    isHomeLoading = true;
    emit(HomeLoading());
    await DioHelper.getData(path: 'v1/home').then((value) {
      homeModel = HomeModel.fromJson(value!.data);
      emit(HomeSuccess());
      isHomeLoading = false;
    }).catchError((e) {
      emit(HomeError());
      isHomeLoading = false;
    });
  }
}
