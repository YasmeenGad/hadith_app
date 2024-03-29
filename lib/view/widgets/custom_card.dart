import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hadith/model/custom_card_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.cardModel});

  final CustomCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 48.h),
      child: Container(
          height: 117.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(10, 10),
                    blurRadius: 40)
              ],
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  colors: [
                    cardModel.firstColor,
                    cardModel.secondColor,
                  ],
                  begin: AlignmentDirectional.topEnd,
                  end: AlignmentDirectional.bottomStart)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(cardModel.firstPathImage),
              cardModel.text,
              SvgPicture.asset(cardModel.secondPathImage),
            ],
          )),
    );
  }
}
