import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:hadith/model/hadith_model.dart';
import 'package:hadith/view/screens/audio_view.dart';
import 'package:hadith/view/screens/hadith_content_view_body.dart';
import 'package:share_plus/share_plus.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({this.hadith});
  final Hadith? hadith;

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  bool bol = true;
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "";
  @override
  void initState() {
    text = widget.hadith!.text!;
    super.initState();
  }

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText + ' \n';
    });
  }

  getWedjet(bool bol) {
    if (bol) {
      return HadithContentViewBody(
        hadith: widget.hadith!,
        data: text,
      );
    } else {
      return AudioView(
        hadith: widget.hadith!,
        path: widget.hadith!.audio!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: ColorApp.primary,
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB;
          });
          Share.share(text, subject: widget.hadith!.text);
        },
        child: Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.h,
          margin: EdgeInsets.only(left: 12.0.w, right: 12.0.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  bol = true;
                  updateTabSelection(0, widget.hadith!.text!);
                },
                iconSize: 27.0.sp,
                icon: Icon(
                  Icons.book,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0 ? ColorApp.yellow : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bol = true;
                  updateTabSelection(1, widget.hadith!.explaination!);
                },
                iconSize: 27.0.sp,
                icon: Icon(
                  Icons.library_books,
                  color: selectedIndex == 1 ? ColorApp.yellow : Colors.white,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0.w,
              ),
              IconButton(
                onPressed: () {
                  bol = true;
                  updateTabSelection(2, widget.hadith!.translation!);
                },
                iconSize: 27.0.sp,
                icon: Icon(
                  Icons.collections_bookmark,
                  color: selectedIndex == 2 ? ColorApp.yellow : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bol = false;
                  updateTabSelection(3,
                      "${widget.hadith!.key}" + ' \n' + widget.hadith!.name!);
                },
                iconSize: 27.0.sp,
                icon: Icon(
                  Icons.volume_up,
                  color: selectedIndex == 3 ? ColorApp.yellow : Colors.white,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: ColorApp.primary,
      ),
      body: Stack(
        children: [
          SvgPicture.asset(Assets.svgBackground),
          getWedjet(bol),
        ],
      ),
    );
  }
}
