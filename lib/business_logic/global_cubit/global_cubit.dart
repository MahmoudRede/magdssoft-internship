import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login_screen/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);


  String ?userName;
  String ?userEmail;
  String ?userPhone;
  bool isPass =false;


  void createUser({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    context
  }) {
    emit(CreateUserLoadingState());
    DioHelper.postData(url:'register', body: {
      'name': fullName,
      'email': email,
      'password': password,
      'phone': phone,
    }).then((value) {
      print(value.data['message']);
      Navigator.push(context, MaterialPageRoute(builder: (_){
        return LoginScreen();
      }));
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print('createUser Error is ${error.toString()}');
      emit(CreateUserErrorState());
    });
  }


  Future getUser({
    required String email,
    required String password,
    context
  }) async{
    emit(GetUserLoadingState());
    DioHelper.postData(url: 'login', body: {
      'email': email,
      'password': password
    }).then((value) {

      userName=value.data['account'][0]['name'];
      userEmail=value.data['account'][0]['email'];
      userPhone=value.data['account'][0]['phone'];

      Navigator.push(context, MaterialPageRoute(builder: (_){
        return const UserProfile();
      }));

      emit(GetUserSuccessState());
    }).catchError((error) {
      print('getUser Error is ${error.toString()}');
      emit(GetUserErrorState());
    });
  }

  void changeIcon(){

    isPass=!isPass;
    emit(ChangeIconState());

  }
}
