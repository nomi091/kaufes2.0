import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../../data/responce/status.dart';
import '../../../res/widgets/global_widgets/filter_app_bar.dart';
import '../../../view_model/home_view_model/sub_category_view_model.dart';
import '../../global_cards/category_list_card.dart';

class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList({Key? key}) : super(key: key);

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  SubCategoryViewModel subCategoryViewModel = SubCategoryViewModel();

  @override
  Widget build(BuildContext context) {
    subCategoryViewModel.getSubCategoryItems();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
          child: FilterAppBar(
            onTapBack: () {
              Navigator.pop(context);
            },
            height: ConstantSize.getHeight(context) * 0.05,
            title: "Sub Categories",
            trailingCheck: false,
            onTapTrailing: () {
              //    Get.offAndToNamed(MyRoutes.getHomeScreen());
            },
          )),
      body: Container(
        padding: EdgeInsets.only(
          left: ConstantSize.getWidth(context) * 0.05,
          right: ConstantSize.getWidth(context) * 0.05,
        ),
        child: ChangeNotifierProvider<SubCategoryViewModel>.value(
          value: subCategoryViewModel,
          child: Consumer<SubCategoryViewModel>(
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
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemExtent: 40,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ScreenRoutes.filterHomeScreen);
                            },
                            child: CategoryItemListCard(
                              title: 'Computer',
                            ),
                          );
                        },
                      );
                    }),
                  );
              }
            },
          ),
        ),
      ),
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
