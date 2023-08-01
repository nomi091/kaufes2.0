import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/constants/strings.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../../data/responce/status.dart';
import '../../../utils/constants/colors.dart';
import '../../../view_model/home_view_model/category_view_model.dart';
import 'category_items_widget.dart';

class CategoryListViewItem extends StatefulWidget {
  const CategoryListViewItem({Key? key}) : super(key: key);

  @override
  State<CategoryListViewItem> createState() => _CategoryListViewItemState();
}

class _CategoryListViewItemState extends State<CategoryListViewItem> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    categoryViewModel.getCategoryItems();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: ConstantSize.getWidth(context) * 0.07,
              right: ConstantSize.getWidth(context) * 0.07),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  MyStrings.popularCategories,
                  style: MyTextStyles.headingregularBoldPrimary,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ScreenRoutes.allCategoriesList);
                  },
                  child: Text(
                    MyStrings.seeAll,
                    textAlign: TextAlign.right,
                    style: MyTextStyles.subHeadingBoldBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(
            left: ConstantSize.getWidth(context) * 0.05,
          ),
          //   color: Colors.amberAccent,
          child: ChangeNotifierProvider<CategoryViewModel>.value(
            value: categoryViewModel,
            child: Consumer<CategoryViewModel>(
              builder: (context, value, _) {
                switch (value.getAllItemsData.status) {
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    return Text(value.getAllItemsData.message.toString());
                  default:
                    return SizedBox(
                      width: ConstantSize.getWidth(context),
                      height: ConstantSize.getHeight(context) * 0.15,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemExtent: 100,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return const CategoryItemWidget();
                        },
                      ),
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

// class CategoryItem extends StatelessWidget {
//   final Category category;

//   const CategoryItem({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     // Build your category item widget using the provided category data
//     // Example:
//     return ListTile(
//       title: Text(category.name.toString()),
//       // Add more widgets based on your design
//     );
//   }
// }
