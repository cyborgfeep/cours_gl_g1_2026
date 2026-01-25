import 'package:cours_gl_g1_2026/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class CardWave extends StatefulWidget {
  final double? height;
  final double? width;
  const CardWave({super.key, this.height, this.width});

  @override
  State<CardWave> createState() => _CardWaveState();
}

class _CardWaveState extends State<CardWave> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 200,
      width: widget.width ?? 300,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(ImageConstants.bgImg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withValues(alpha: .4),
            BlendMode.srcIn,
          ),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(ImageConstants.logoImg, width: 50),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 3),
                  SizedBox(
                    width: 125,
                    child: PrettyQrView.data(data: 'google.com'),
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, size: 20),
                      SizedBox(width: 5),
                      Text('Scanner'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
