import 'package:flutter/material.dart';
import 'package:bustick/utils/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class MyRating extends StatefulWidget {
  final double rating;

  const MyRating({Key? key, required this.rating}) : super(key: key);

  @override
  _MyRatingState createState() => _MyRatingState();
}

class _MyRatingState extends State<MyRating> {
  @override
  Widget build(BuildContext context) {
    // changed:  onrady to onratingChanged
    return SmoothStarRating(
      allowHalfRating: true,
      onRatingChanged: (v) {},
      starCount: 5,
      rating: widget.rating,
      size: 20.0,
      defaultIconData: Icons.star_outline_rounded,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star,
      color: CustomColor.primaryColor,
      borderColor: CustomColor.primaryColor,
      spacing: 0.0,
    );
  }
}
