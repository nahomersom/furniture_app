import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/products.dart';
import '../../../size_config.dart';
class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,

    required this.product,
    required this.onPress
  }) : super(key: key);

  final Product product;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;

    return Container(
      constraints: BoxConstraints(
          minHeight: defaultSize! * 44
      ),
      padding: EdgeInsets.only(top:defaultSize * 6,left: defaultSize * 2,right: defaultSize * 2 ),

      decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 1.2),
              topRight: Radius.circular(defaultSize * 1.3)
          )
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.subTitle,
              style: TextStyle(fontSize: defaultSize * 1.8, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: defaultSize * 2,),
            Text(product.description,
              style: TextStyle(
                  color: kTextColor.withOpacity(0.7),
                  height: 1.5
              ),
            ),
            SizedBox(height: defaultSize * 2,),
            SizedBox(
              width: double.infinity,
              child:
              TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(defaultSize * 1.5)),
                    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0)
                      ),

                    ),
                  ),
                  onPressed: onPress,
                  child:  Text('Add to Cart',style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultSize * 1.6,
                      fontWeight: FontWeight.bold
                  ),)
              ),
            )

          ],
        ),
      ),
    );
  }
}

