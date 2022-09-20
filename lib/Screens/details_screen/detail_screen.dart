import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/models/products.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../details_screen/components/body.dart';
class DetailsScreen extends StatelessWidget {

  final Product product;
  const DetailsScreen({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body:Body(product:product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading:  IconButton(
        icon:SvgPicture.asset("assets/icons/arrow-long-left.svg"),
        onPressed: ()=>Navigator.pop(context),
      ),
      actions: [
        IconButton(onPressed: null, icon: SvgPicture.asset("assets/icons/bag.svg")),
        SizedBox(width: SizeConfig.defaultSize,)
      ],
    );
  }
}
