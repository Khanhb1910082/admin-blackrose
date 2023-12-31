import 'dart:async';

import 'package:blackrose_admin_panel/core/constants/size_of_device.dart';
import 'package:blackrose_admin_panel/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double? screenWidth;
  Timer? timer;
  int currentIndex = 0;
  int? totalIndex;
  final controller = PageController();
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(const Duration(seconds: 5), (time) {
        if (currentIndex < totalIndex!) {
          controller.animateTo(currentIndex * (screenWidth!),
              duration: const Duration(milliseconds: 1000), curve: Curves.ease);
          currentIndex++;
        } else {
          currentIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width / 2;
    totalIndex = slides.length;
    return Container(
      child: PageView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        //controller: _pageController,
        controller: controller,

        children: List.generate(
          slides.length,
          (int index) => GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(left: 0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [], color: Color(slides[index].kBackgroundColor!)),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2 - 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(slides[index].image!),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            boxShadow: [],
                            color: const Color(0xFF96A724)),
                      ),
                    ],
                  ),
                  Positioned(
                    //top: MediaQuery.of(context).size.height / 1.4,

                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Image.asset(
                          slides[index].productImage!,
                          // scale: 7,
                          height: SizeDevice().height(context) / 2 - 50,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(slides[index].text!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(slides[index].altText!,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          alignment: Alignment.center,
                          child: Text(slides[index].bAltText!,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: slides.length,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Colors.white,
                            dotColor: Colors.white.withOpacity(0.2),
                            dotHeight: 4.8,
                            dotWidth: 6,
                            spacing: 4.8),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
