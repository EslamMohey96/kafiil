import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_test/constants.dart';
import 'package:kafiil_test/core/shared_components/custom_toast_message.dart';
import 'package:kafiil_test/core/utils/cacheHelper.dart';
import 'package:kafiil_test/feature/login/data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // List li = [];

  // int? constraints;
  // void changeConstraints(int constraints) {
  //   this.constraints = constraints;
  //   emit(ChangeConstraintsState());
  // }

    String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'email must\'n be empty ';
    }
    return null;
  }

String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  bool visiblePassword = false;
  void changeVisiblePassword(bool pass) {
    visiblePassword = pass;
    emit(LogInVisiblePasswordState());
  }

  bool loginDone = false;
    userLogin({
    context,
    required email,
    required password,
  }) async {
    emit(LoginLoadingState());

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        getUserData(value.user!.uid);
        print(value.user!.uid);
        print("Login Successfully");
        changeUId(value.user!.uid, context);
        emit(LoginSuccessState(value.user!.uid));
      });
    } on FirebaseAuthException catch (e) {
     emit(LoginErrorState(e));
      }
    }

// getUserData

  int userModelDone = 0;
  void getUserData(String uId) async {
    try {
      userModelDone = 0;
      emit(UserDataLoadingState());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        userModel = UserModel.fromJson(value.data());
      }).then((value) {
        emit(UserDataSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      emit(UserDataErrorState(e.message));
    }
  }

  bool changeUIdDone = false;
  changeUId(id, context) {
    changeUIdDone = false;
    cacheHelper
        .setData(
      key: 'uId',
      value: id,
    )
        .then((value) {
      uIdConst = cacheHelper.getData(
        key: 'uId',
      );
    }).then((value) {
      // kafiil_testCubit.get(context).getUserData(uIdConst);
      debugPrint(uIdConst);
      changeUIdDone = true;
      emit(ChangeUIdDoneState());
    });
  }
}
