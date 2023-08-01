import 'package:flutter/material.dart';
import 'package:kaufes/res/widgets/global_widgets/align_left_text.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/constants/strings.dart';
import 'package:provider/provider.dart';

import '../../../data/responce/status.dart';
import '../../../utils/constants/colors.dart';
import '../../../view_model/home_view_model/popular_product_view_model.dart';
import '../../global_cards/product_card_item_view.dart';

class SimilarProductScreen extends StatefulWidget {
  const SimilarProductScreen({Key? key}) : super(key: key);

  @override
  State<SimilarProductScreen> createState() => _SimilarProductScreenState();
}

class _SimilarProductScreenState extends State<SimilarProductScreen> {
  PopularProductViewModel popularProductViewModel = PopularProductViewModel();
  @override
  Widget build(BuildContext context) {
    popularProductViewModel.getProductItems();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: ConstantSize.getWidth(context) * 0.07,
          ),
          child: alignCenterLeft(
            Text(
              MyStrings.similarProducts,
              style: MyTextStyles.headingregularBoldPrimary,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(
            left: ConstantSize.getWidth(context) * 0.07,
          ),
          //   color: Colors.amberAccent,
          child: ChangeNotifierProvider<PopularProductViewModel>.value(
            value: popularProductViewModel,
            child: Consumer<PopularProductViewModel>(
              builder: (context, value, _) {
                switch (value.getAllItemsData.status) {
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    return Text(value.getAllItemsData.message.toString());
                  default:
                    return LayoutBuilder(
                      builder:
                        (BuildContext context, BoxConstraints constraints) {
                        return SizedBox(
                          width: ConstantSize.getWidth(context),
                          height: ConstantSize.getHeight(context) * 0.34,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                          itemExtent: 200,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                 //  Navigator.pushNamed(context,ScreenRoutes.productDetailScreen);
                                  },
                                  child: ProductCardView(
                                    isBid: true,
                                  ));
                            },
                          ),
                        );
                      }
                    );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
