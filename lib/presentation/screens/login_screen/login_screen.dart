import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/register_screen/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button_manager/button_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_form_field/default_form_field.dart';

class LoginScreen extends StatelessWidget {

  var emailController=TextEditingController();
  var passController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
        listener: (context,state){

        },
      builder: (context,state){
          return Scaffold(
            backgroundColor: AppColor.primaryColor,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light
              ),
              toolbarHeight: 0.0,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 21),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: MaterialButton(
                              color: AppColor.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)
                              ),
                              onPressed:(){

                              },
                              child: const Text('عربي',
                                style: TextStyle(
                                    fontSize: 15,
                                    color:AppColor.primaryColor
                                ),),
                            ),
                          ),
                        ),
                        const Image(
                          image: AssetImage('assets/images/appLogo.png'),
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Container(
                      height: 420,
                      width: double.infinity,
                      padding: const EdgeInsetsDirectional.all(15),
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(25, 5, 25, 5),
                            child: Column(
                              children: [
                                const SizedBox(height: 70,),
                                DefaultFormField(
                                    hint: 'Email',
                                    controller: emailController,
                                    textInputType: TextInputType.emailAddress,
                                    validText: 'Invalid Email'
                                ),
                                const SizedBox(height: 10,),
                                DefaultFormField(
                                  hint: 'Password',
                                  controller: passController,
                                  textInputType: TextInputType.visiblePassword,
                                  validText: 'Invalid Password',
                                  suffixIcon: GlobalCubit.get(context).isPass?Icons.visibility_off:Icons.visibility,
                                  suffixFunction: GlobalCubit.get(context).changeIcon,

                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 70,),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 5,10, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonManager(
                                    text: 'Register',
                                    textColor: AppColor.white,
                                    textFontSize: 17,
                                    buttonColor: AppColor.primaryColor,
                                    buttonRadius: 7,
                                    function: (){
                                         Navigator.push(context, MaterialPageRoute(builder: (_){
                                           return RegisterScreen();
                                         }));
                                    }
                                ),
                                const SizedBox(width: 15,),
                                ButtonManager(
                                    text: 'Login',
                                    textColor: AppColor.white,
                                    textFontSize: 17,
                                    buttonColor: AppColor.primaryColor,
                                    buttonRadius: 7,
                                    function: (){
                                      if(formKey.currentState!.validate()){
                                        GlobalCubit.get(context).getUser(
                                            email: emailController.text,
                                            password: passController.text,
                                            context: context
                                        ).then((value) {

                                        });
                                      }


                                    }
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
      },
    );
  }
}
