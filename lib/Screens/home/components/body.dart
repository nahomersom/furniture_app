import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/home/components/recommended_products.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/categories.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/services/fetch_categories.dart';
import '../../../components/categories.dart';
import '../../../components/product_card.dart';
import '../../../components/title_text.dart';
import '../../../services/fetch_products.dart';
import '../../../size_config.dart';
import 'category_card.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    //singlechildscrollview we use for vertical not for the horizonal
    return  SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   <Widget>[
            Padding(
                padding: EdgeInsets.all(defaultSize! * 2),
                child: const TitleText(title: 'Browse by Categories',)),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data as List<Category>)
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            const Divider(height: 5,),
            Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: const TitleText(title: 'Recommended for you',)),
          FutureBuilder(
              future: fetchProducts(),
              builder: (context,snapshot){
            if(snapshot.hasData){
              return  RecommendedProducts(products: snapshot.data as List<Product>);
            }else{
              return Center(child: Image.asset("assets/ripple.gif"),
              );
            }
          })
          ]
        )

      ),
    );
  }
}



class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}