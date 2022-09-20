import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/products.dart';
import '../../../size_config.dart';
class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,

    required this.product,

  }) : super(key: key);

  final Product product;


  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    TextStyle kLightTextStyle = TextStyle(
        color: kTextColor.withOpacity(0.6)
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize! * 2),
      height: defaultSize * 28,
      width: defaultSize * (SizeConfig.orientation == Orientation.landscape ? 28 : 20),

      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.category.toUpperCase(),
                style: kLightTextStyle
            ),
            SizedBox(height: defaultSize,),
            Text(
              product.title,
              style: TextStyle(
                  fontSize: defaultSize * 2.4,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.8,
                  height: 1.4
              ),
            ),
            SizedBox(
              height: defaultSize * 2,
            ),
            Text("form",style: kLightTextStyle,
            ),
            Text("\$${product.price}",style: TextStyle(
                fontSize: defaultSize * 1.6,
                fontWeight: FontWeight.bold,
                height: 1.6
            ),),
            SizedBox(height: defaultSize * 2,),
            Text('Available Colors',style: kLightTextStyle,),
            Row(
                children:
                [
                  buildColorContainer(defaultSize,color:const Color(0xFF7BA275), isActive: true,),
                  buildColorContainer(defaultSize,color:const Color(0xFFD7D7D7), isActive: false,),
                  buildColorContainer(defaultSize,color:kTextColor, isActive: false,)
                ])
          ],
        ),
      ),
    );
  }

  Container buildColorContainer(double defaultSize,{required Color color,required bool isActive}) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin:  EdgeInsets.only(top: defaultSize,right: defaultSize),
        height: defaultSize * 2.4,
        width: defaultSize * 2.4,
        decoration:  BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6)
        ),
        child: isActive ? SvgPicture.asset("assets/icons/check.svg") : const SizedBox()
    );
  }
}
