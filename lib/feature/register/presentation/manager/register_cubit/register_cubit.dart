import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kafiil_test/constants.dart';
import 'package:kafiil_test/core/shared_components/custom_toast_message.dart';
import 'package:kafiil_test/core/utils/cacheHelper.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/complete_data/complete_data.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/register/register_view_body.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var salaryController = TextEditingController();
  var aboutController = TextEditingController();

  
  bool visiblePassword = false;
  bool visibleConfirmPassword = false;
  String userType ="Seller";
  
  var currentPage = 0;

  List pages = [
    const RegisterViewBody(),
    const CompleteData(),
  ];
  void changePage() {
    ++currentPage ;
    emit(RegisterChangePageState());
  }
    void bachPage() {
    --currentPage ;
    emit(RegisterChangePageState());
  }
  
void changeToPage(int index) {
    currentPage= index ;
    emit(RegisterChangePageState());
  }
  void changeVisiblePassword(bool pass) {
    visiblePassword = pass;
    emit(RegisterVisiblePasswordState());
  }

  void changeVisibleConfirmPassword(bool pass) {
    visibleConfirmPassword = pass;
    emit(RegisterVisiblePasswordState());
  }

  bool registerDone = true;

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String salary,
    required String about,
    required String userType,
    

    context,
    String image =
        "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg?w=740",
  }) async {
    registerDone = false;
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          userCreate(
              firstName: firstName,
              lastName: lastName,
              email: email,
              salary: salary,
              about: about,
              uId: value.user!.uid,
              image: image,
              userType:userType,
              context: context);
        },
      );
    } on FirebaseAuthException catch (e) {
      registerDone = true;
      emit(RegisterErrorState(e));
    }
  }

  void userCreate(
      {required String firstName,
      required String lastName,
      required String email,
      required String salary,
      required String about,
      required String userType,
      required String uId,
      required String image,
      context}) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uId).set({
        'email': email,
        'uId': uId,
        'firstName': firstName,
        'lastName': lastName,
        'salary': salary,
        'about': about,
        'userType':userType,
        'isEmailVerified': false,
        'image': image,
      }).then((value) {
        changeUId(uId, context);
      });
    } on FirebaseAuthException catch (e) {
      emit(UserDataRegErrorState(e.message));
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
      registerDone = true;
      changeUIdDone = true;
      emit(ChangeUIdDoneState());
    });
  }
}
