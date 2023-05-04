import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class UPCarouselView extends StatefulWidget {
  const UPCarouselView({Key? key}) : super(key: key);

  @override
  State<UPCarouselView> createState() => _UPCarouselViewState();
}

class _UPCarouselViewState extends State<UPCarouselView> {
  final imagesArr = [
    'images/2.0x/1.png',
    'images/2.0x/2.png',
    'images/2.0x/3.png',
    'images/2.0x/4.png',
    'images/2.0x/5.png',
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = _width * 0.5;

    return SizedBox(
      width: _width,
      height: _height,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          final image = imagesArr[index];
          return Image.asset(image as String, fit: BoxFit.fill,);
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        itemCount: imagesArr.length,
        pagination: const SwiperPagination(),
        control:  const SwiperControl(),
      )
    );
  }
}
