import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width*.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            color: ColorsManager.white,
            child: Text("News App" ,style: GoogleFonts.inter(fontSize: 24.sp , fontWeight:FontWeight.bold, color: ColorsManager.black ),
            
             ),
          ),
          SizedBox(height: 16.h,),
Padding(
  padding: const EdgeInsets.all(14.0),
  child: Column(children: [
              InkWell(
              onTap: (){},
              child: Row(children: [
                  SizedBox(width: 8,),
                Icon(Icons.home_filled, color: ColorsManager.white,),
                SizedBox(width: 8,),
                Text("Go To Home" ,style: GoogleFonts.inter(fontSize: 20.sp , fontWeight:FontWeight.bold, color: ColorsManager.white ),),
              
              
              
              ],),
            ),
              SizedBox(height: 24.h,),
              Divider(
                height: 1,
                thickness: 1,
                color: ColorsManager.white,
              ),
                SizedBox(height: 24.h,),
  
    Row(
      children: [
          SizedBox(width: 8,),
              Icon(Icons.mode_night_outlined, color: ColorsManager.white,),
              SizedBox(width: 8,),
              Text("Theme" ,style: GoogleFonts.inter(fontSize: 20.sp , fontWeight:FontWeight.bold, color: ColorsManager.white ),),
  
      ],
    ),
  
      SizedBox(height: 8.h,),
  Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(width: 1 , color: ColorsManager.white)
    ),
    child: Row(
      children: [
        SizedBox(width: 8,),
      Text("Dark" ,style: GoogleFonts.inter(fontSize: 24.sp , fontWeight:FontWeight.bold, color: ColorsManager.white ),),
  Spacer(),
        DropdownButton(
                              iconEnabledColor: ColorsManager.white,

          underline: Container(),
          items: ["Light", "Dark"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    ),
  ),
      SizedBox(height: 24.h,),
      Divider(
                height: 1,
                thickness: 1,
                color: ColorsManager.white,
              ),
      SizedBox(height: 24.h,),
        Row(
      children: [
          SizedBox(width: 8,),
              Icon(Icons.language, color: ColorsManager.white,),
              SizedBox(width: 8,),
              Text("Language" ,style: GoogleFonts.inter(fontSize: 20.sp , fontWeight:FontWeight.bold, color: ColorsManager.white ),),
  
      ],
    ),
      SizedBox(height: 16.h,),
      Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(width: 1 , color: ColorsManager.white)
    ),
    child: Row(
      children: [
          SizedBox(width: 8,),
      Text("English" ,style: GoogleFonts.inter(fontSize: 24.sp , fontWeight:FontWeight.bold, color: ColorsManager.white ),),
  Spacer(),
        DropdownButton(
                    iconEnabledColor: ColorsManager.white,

          underline: Container(),
          items: ["English", "Arabic"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    ),
  ),
  ],),
)



        ],
      ),
    );
  }
}
