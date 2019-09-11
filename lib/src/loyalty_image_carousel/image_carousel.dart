import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class CustomCarouselClipper extends CustomClipper<Path> {
//Based on some help from this video : https://www.youtube.com/watch?v=XmU0PyFa6T0
  @override
  Path getClip(Size size) {
    /**
     * This should draw a clip, or the whole path to be drawn,
     * from starting point to ending point.
     *
     */
    Path path = Path(); //Create a new path object, which initially starts at 0,0 (top left corner by default)
    /**
     * Move the path from the top left corner to (x,y) = (0, height)
     * so create a path on the left with the height of the image
     */
    path.lineTo(0, size.height);
    /**
     * Create a curve,
     * The first 2 parameters are where the center of the curve be,
     * which is
     * x = width/2 (horizontal center)
     * y = size.height * 0.? (how much the curve will go up
     * the second 2 parameters are the end of the curve,
     * starting from the point in the previous line,
     * and ending with the point width, height (bottom right corner)
     */
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.9, size.width, size.height);
    /**
     * This line is to draw the path on right side,
     * from bottom right to top right, the path usually ends with the starting point
     */
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

class LoyaltyImageCarousel extends StatefulWidget {
  var imagesList;
  double width;
  double height;
  double dotSize;
  double dotSpacing;
  Color dotColor;
  double indicatorBgPadding;
  Color dotBgColor;
  bool borderRadiusEnabled;
  double borderRadius;

  LoyaltyImageCarousel({this.imagesList,
    this.width,
    this.height,
    this.dotSize,
    this.dotSpacing,
    this.dotColor,
    this.indicatorBgPadding,
    this.dotBgColor,
    this.borderRadiusEnabled,
    this.borderRadius});

  @override
  _LoyaltyImageCarouselState createState() => _LoyaltyImageCarouselState(this);
}

class _LoyaltyImageCarouselState extends State<LoyaltyImageCarousel> {
  LoyaltyImageCarousel imageCarousel;

  _LoyaltyImageCarouselState(this.imageCarousel);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCarouselClipper(),
      child: SizedBox(
          height: this.imageCarousel.height ?? MediaQuery
              .of(context)
              .size
              .height * 0.4,
          width: this.imageCarousel.width ?? MediaQuery
              .of(context)
              .size
              .width,
          child: new Carousel(
            images: this.imageCarousel.imagesList,
            dotSize: this.imageCarousel.dotSize ?? 4.0,
            dotSpacing: this.imageCarousel.dotSpacing ?? 15.0,
            dotColor: this.imageCarousel.dotColor ?? Colors.lightGreenAccent,
            indicatorBgPadding: 5.0,
            dotBgColor: this.imageCarousel.dotBgColor ??
                Colors.purple.withOpacity(0.5),
            showIndicator: true,
            borderRadius: this.imageCarousel.borderRadiusEnabled ?? true,
            moveIndicatorFromBottom: 20,
//          moveIndicatorFromBottom: MediaQuery
//              .of(context)
//              .size
//              .height * 0.4,
            noRadiusForIndicator: true,
            overlayShadow: false,
            overlayShadowColors: Colors.grey[400],
            overlayShadowSize: 0.25,
            boxFit: BoxFit.cover,

          )

      ),
    );
  }
}
