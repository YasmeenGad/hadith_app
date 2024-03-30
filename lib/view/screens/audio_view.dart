// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hadith/controller/utils/app_images/assets.dart';
// import 'package:hadith/controller/utils/constants/colors.dart';
// import 'package:hadith/model/hadith_model.dart';

// class LocalAudio extends StatefulWidget {
//   final Hadith hadith;
//   final String localAudioPath;

//   LocalAudio({required this.localAudioPath, required this.hadith});

//   @override
//   _LocalAudioState createState() => _LocalAudioState();
// }

// class _LocalAudioState extends State<LocalAudio> {

//   Widget slider() {
//     return Slider(
//         activeColor: Colors.yellow,
//         inactiveColor: Colors.black45,
//         value: _position.inSeconds.toDouble(),
//         min: 0.0,
//         max: _duration.inSeconds.toDouble(),
//         onChanged: (double value) {
//           setState(() {
//             seekToSecond(value.toInt());
//             value = value;
//           });
//         });
//   }

//   Widget _btn(Icon icon, VoidCallback onPressed) {
//     return ButtonTheme(
//       minWidth: 50.0,
//       child: Container(
//         width: 70,
//         height: 50,
//         child: MaterialButton(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//             child: icon,
//             color: Colors.black45,
//             textColor: Colors.yellow,
//             onPressed: onPressed),
//       ),
//     );
//   }

//   void seekToSecond(int second) {
//     Duration newDuration = Duration(seconds: second);

//     advancedPlayer.seek(newDuration);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             SvgPicture.asset(Assets.svgBackground),
//             Column(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 40.h),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(""),
//                             SvgPicture.asset(Assets.svgLogo),
//                             IconButton(
//                                 onPressed: () {
//                                   GoRouter.of(context).pop();
//                                 },
//                                 icon: const Icon(Icons.arrow_forward_ios))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Padding(
//                             padding: EdgeInsets.only(right: 20.w),
//                             child: Text(
//                               "${widget.hadith.name}",
//                               style: GoogleFonts.tajawal(
//                                   fontSize: 25.sp,
//                                   fontWeight: FontWeight.bold,
//                                   color: ColorApp.primary),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(Assets.svgImgAudio),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 30.w),
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Column(
//                             children: [
//                               Text(
//                                 "${widget.hadith.key}",
//                                 style: GoogleFonts.tajawal(fontSize: 18.sp),
//                               ),
//                               Text(
//                                 "${widget.hadith.name}",
//                                 style: GoogleFonts.tajawal(
//                                     fontSize: 25.sp,
//                                     fontWeight: FontWeight.bold,
//                                     color: ColorApp.primary),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       slider(),
//                       _tab([
//                         _btn(
//                             Icon(Icons.play_arrow),
//                             () => advancedPlayer
//                                 .play(widget.localAudioPath as Source)),
//                         _btn(Icon(Icons.pause), () => advancedPlayer.pause()),
//                         _btn(Icon(Icons.stop), () => advancedPlayer.stop()),
//                       ]),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _tab(List<Widget> children) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: children
//                 .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:hadith/model/hadith_model.dart';

class AudioView extends StatefulWidget {
  AudioView({required this.hadith, required this.path});
  final Hadith hadith;
  var path;

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  bool isPlaying = false;
  late final AudioPlayer player;
  Duration _duration = const Duration();
  Duration _position = Duration();
  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    widget.path = AssetSource('audio/${widget.path}');

    player.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    player.onPositionChanged.listen((Duration duration) {
      setState(() {
        _position = duration;
      });
    });

    player.onPlayerComplete.listen((_) {
      setState(() {
        _position = _duration;
      });
    });
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(widget.path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(children: [
        SvgPicture.asset(Assets.svgBackground),
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(""),
                        SvgPicture.asset(Assets.svgLogo),
                        IconButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          "${widget.hadith.name}",
                          style: GoogleFonts.tajawal(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorApp.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    SvgPicture.asset(Assets.svgImgAudio),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "${widget.hadith.key}",
                      style: GoogleFonts.tajawal(fontSize: 18.sp),
                    ),
                    Text(
                      "${widget.hadith.name}",
                      style: GoogleFonts.tajawal(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.primary),
                    ),
                  ],
                ),
              ),
            ),
            Slider(
              value: _position.inSeconds.toDouble(),
              onChanged: (value) async {
                await player.seek(Duration(seconds: value.toInt()));
                setState(() {});
              },
              min: 0,
              max: _duration.inSeconds.toDouble(),
              activeColor: Colors.yellow,
              inactiveColor: Colors.black45,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    player.seek(Duration(seconds: _position.inSeconds - 10));
                    setState(() {});
                  },
                  child: Image.asset(
                    Assets.svgRewind,
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                InkWell(
                  onTap: playPause,
                  child: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    size: 50.sp,
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                InkWell(
                  onTap: () {
                    player.seek(Duration(seconds: _position.inSeconds + 10));
                    setState(() {});
                  },
                  child: Image.asset(
                    Assets.svgForward,
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ])),
    );
  }
}
