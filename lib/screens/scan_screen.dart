import 'package:camera/camera.dart';
import 'package:cours_gl_g1_2026/main.dart';
import 'package:cours_gl_g1_2026/widgets/card_wave.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late CameraController controller;
  PageController pageController = PageController();
  bool isFlashOn = false;
  int pageIndex=0;


  toggleFlash() {
    setState(() {
      isFlashOn = !isFlashOn;
    });
    if (isFlashOn) {
      controller.setFlashMode(FlashMode.torch);
    } else {
      controller.setFlashMode(FlashMode.off);
    }
}

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller
        .initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        })
        .catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                // Handle access errors here.
                break;
              default:
                // Handle other errors here.
                break;
            }
          }
        });
    pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page!.round();
        print('Page: $pageIndex');
      });
    },);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              cameraPage(),
              Container(color: Colors.white,
              child: Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: CardWave(
                    width: 400,
                    height: 300,
                    showText: false,
                  ),
                ),
              ),),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ToggleSwitch(
                minWidth: 160.0,
                cornerRadius: 20.0,
                activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: pageIndex,
                totalSwitches: 2,
                labels: ['Scanner', 'Ma carte'],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                  pageController.jumpToPage(index!);

                },
              ),
            ),
          ), ],
      ),
    );
  }

  cameraPage(){
    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            child: CameraPreview(controller),
          ),
        ),
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: .6),
            BlendMode.dstOut,
          ),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child:Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(15),
                    backgroundBlendMode: BlendMode.srcOut,
                  ),
                ),
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.clear,color: Colors.white,),
              ),
              IconButton(
                onPressed: () {
                  toggleFlash();
                },
                icon: Icon(!isFlashOn?Icons.flash_on:Icons.flash_off,color: Colors.white,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

