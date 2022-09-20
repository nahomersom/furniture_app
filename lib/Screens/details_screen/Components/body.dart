import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/Screens/details_screen/Components/product_description.dart';
import 'package:furniture_app/Screens/details_screen/Components/product_info.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/size_config.dart';
class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle kLightTextStyle = TextStyle(
        color: kTextColor.withOpacity(0.6)
    );
    return  SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfo(product: product),
            Positioned(
                 left: 0,
                  right: 0,
                top: SizeConfig.defaultSize! * 28.5,
                child: ProductDescription( product: product,onPress: null,)),
            Positioned(
                top: SizeConfig.defaultSize! * 5.5,
                right: -SizeConfig.defaultSize! * 2.0,
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                      product.image,
                    height: SizeConfig.defaultSize! * 35,
                    width: SizeConfig.defaultSize! * 35,
                    fit: BoxFit.cover,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

