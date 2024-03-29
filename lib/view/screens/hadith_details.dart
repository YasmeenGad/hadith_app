import 'package:flutter/material.dart';
import 'package:hadith/model/hadith_model.dart';
import 'package:hadith/view/screens/hadith_content_view_body.dart';

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [getWedjet(bol)],
      ),
    );
  }
}
