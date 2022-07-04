import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login_screen/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button_manager/button_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_form_field/default_form_field.dart';

class RegisterScreen extends StatelessWidget {

  var emailController=TextEditingController();
  var passController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var confirmPassController=TextEditingController();
  var formKey=GlobalKey<FormState>();


  RegisterScreen({Key? key}) : super(key: key);

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
                      children: const [
                        Image(
                          image: AssetImage('assets/images/appLogo.png'),
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),

                    Container(
                      height: 620,
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
                                const SizedBox(height: 10,),
                                DefaultFormField(
                                    hint: 'Full Name',
                                    controller: nameController,
                                    textInputType: TextInputType.name,
                                    validText: 'Please, Enter Your Name'
                                ),
                                const SizedBox(height: 10,),
                                DefaultFormField(
                                  hint: 'Email',
                                  controller: emailController,
                                  textInputType: TextInputType.emailAddress,
                                  validText: 'Please, Enter Your Email',

                                ),
                                const SizedBox(height: 10,),
                                DefaultFormField(
                                    hint: 'Phone',
                                    controller: phoneController,
                                    textInputType: TextInputType.phone,
                                    validText: 'Please, Enter Your Phone'
                                ),
                                const SizedBox(height: 10,),
                                DefaultFormField(
                                  hint: 'Password',
                                  controller: passController,
                                  textInputType: TextInputType.visiblePassword,
                                  validText: 'Please, Enter Your Password',
                                  suffixIcon: GlobalCubit.get(context).isPass?Icons.visibility_off:Icons.visibility,
                                  suffixFunction: GlobalCubit.get(context).changeIcon,

                                ),
                                const SizedBox(height: 10,),
                                DefaultFormField(
                                    hint: 'Confirm Password',
                                    controller: confirmPassController,
                                    textInputType: TextInputType.visiblePassword,
                                    validText: 'Password doesn\'t equal',
                                    suffixIcon: GlobalCubit.get(context).isPass?Icons.visibility_off:Icons.visibility,
                                    suffixFunction: GlobalCubit.get(context).changeIcon,
                                ),
                                const SizedBox(height: 10,),

                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
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
                                      if(formKey.currentState!.validate()){
                                        GlobalCubit.get(context).createUser(
                                            fullName: nameController.text,
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            password: passController.text,
                                            context: context,
                                        );
                                      }
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
                                      Navigator.push(context, MaterialPageRoute(builder: (_){
                                        return LoginScreen();
                                      }));
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
