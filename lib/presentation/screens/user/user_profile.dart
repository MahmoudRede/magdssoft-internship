import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login_screen/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button_manager/button_manager.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
        listener: (context,state){

        },
      builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light
              ),
              centerTitle: true,
              title: Text('User Data',style:GoogleFonts.roboto(
                  fontSize: 27,
                  color:AppColor.white
              )),
            ),
            body:  Column(
                children: [
                  const SizedBox(height: 140,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('Name :',style:GoogleFonts.roboto(
                          fontSize: 25,
                          color:AppColor.primaryColor
                      )),
                      const SizedBox(width: 5,),
                      Text((GlobalCubit.get(context).userName)!,style:GoogleFonts.roboto(
                          fontSize: 25,
                          color:AppColor.primaryColor,
                      ),

                      ),

                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Email :',style:GoogleFonts.roboto(
                          fontSize: 25,
                          color:AppColor.primaryColor
                      )),
                      const SizedBox(width: 5,),
                       Text((GlobalCubit.get(context).userEmail)!,style:GoogleFonts.roboto(
                            fontSize: 25,
                            color:AppColor.primaryColor
                        ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),


                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Phone :',style:GoogleFonts.roboto(
                          fontSize: 25,
                          color:AppColor.primaryColor
                      )),
                      const SizedBox(width: 5,),
                      Text((GlobalCubit.get(context).userPhone)!,style:GoogleFonts.roboto(
                          fontSize: 25,
                          color:AppColor.primaryColor
                      ),),

                    ],
                  ),
                  const Spacer(),
                  ButtonManager(
                      text: 'Logout',
                      textColor: AppColor.white,
                      textFontSize: 20,
                      buttonColor: AppColor.logoutButtonColor,
                      buttonRadius: 7,
                      function: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return LoginScreen();
                        }));
                      }
                  ),
                  const SizedBox(height: 83,),
                ],
              ),

          );
      },
    );
  }
}
