import 'package:flutter/material.dart';

import '../../../components/title_text.dart';
import '../../../constants.dart';
import '../../../models/categories.dart';
import '../../../size_config.dart';
import 'body.dart';
class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),//20
      child: SizedBox(
        width: SizeConfig.defaultSize! * 20.5,//since it's parent it forces the child(aspect ratio) to have this width
        child:  AspectRatio(// we use aspect ratio for responsivness and screen orientietaion
          aspectRatio: 83/100, //takes 0.83 %(83 widht(but doesn't affect because of the parent) 100 height) of screen width and height event if it is oriented
          child: Stack(
            alignment: Alignment.bottomCenter,
            children:<Widget> [
              ClipPath(// clip path allow us to create different shape to our box , I know we can add borderradius to our container but clip path give us more flexibitlity
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TitleText(title: category.title),
                        SizedBox(height: SizeConfig.defaultSize),
                        Text(
                          "${category.numOfProducts}+ Products",
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(//allow to position a single stack element
                  top:0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15,
                    child: FadeInImage.assetNetwork(placeholder: 'assets/spinner.gif', image: category.image),

                  ))
            ],
          ),
        ),
      ),
    );
  }
}
