import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/details_screen/detail_screen.dart';

import '../../../components/product_card.dart';
import '../../../models/products.dart';
import '../../../size_config.dart';
class RecommendedProducts extends StatelessWidget {
  final List<Product> products;
  const RecommendedProducts({
    Key? key,
    required this.products
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize! * 2),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: SizeConfig.orientation == Orientation.portrait ? 2 : 4,
              childAspectRatio: 0.693,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
          ),
          itemBuilder: (context,index)=> ProductCard(
            product: products[index],
            onPress: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>(
              DetailsScreen(product: products[index],)
                )
            ));}
          )
      ),
    );
  }
}
