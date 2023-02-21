import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages
          .map((e) => Builder(
              builder: (BuildContext context) => Image.network(
                    e,
                    fit: BoxFit.cover,
                    height: 200,
                  )))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
        // autoPlay: true,
      ),
    );
  }
}
