import 'package:flutter/material.dart';
import 'package:zynk/view/home/pages/slider_view_page.dart';
import 'package:zynk/view/home/pages/video_view_page.dart';

class SliderHandlePage extends StatefulWidget {
  const SliderHandlePage({super.key});

  @override
  State<SliderHandlePage> createState() => _SliderHandlePageState();
}

class _SliderHandlePageState extends State<SliderHandlePage> {
  bool _isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          SliderViewPage(
            onPressed: (){
              setState(() {
                _isCollapsed = !_isCollapsed;
              });
            },
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut, 
            top: _isCollapsed ? 0 : 0.2 * height,
            bottom: _isCollapsed ? 0 : 0.2 * width,
            left: _isCollapsed ? 0 : 0.6 * width,
            right: _isCollapsed ? 0 : -0.4 * width,
            child: VideoViewPage(
              onPressed: () {
                setState(() {
                  _isCollapsed = !_isCollapsed;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
