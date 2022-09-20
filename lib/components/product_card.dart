import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';

import '../constants.dart';
import '../models/products.dart';
import '../size_config.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  final Function()? onPress;
  const ProductCard({
    Key? key,
    required this.product,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;

    return GestureDetector(
      onTap: onPress,
      child: Container(

        width: defaultSize! * 14.5,
        decoration:  BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(30)
        ),
        child:  AspectRatio(
          aspectRatio: 0.63,
          child: Column(
            children:  [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/spinner.gif',
                      image: product.image,
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
                  child: TitleText(title: product.title)
              ),
              SizedBox(height: SizeConfig.defaultSize! / 2,),
              Text("${product.price}")
            ],
          ),
        ),
      ),
    );
  }
}

