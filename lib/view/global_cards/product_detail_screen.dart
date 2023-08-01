import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:kaufes/res/widgets/global_widgets/align_left_text.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:kaufes/utils/constants/strings.dart';
import 'package:kaufes/view_model/home_view_model/product_detail_view_model.dart';
import 'package:readmore/readmore.dart';
import '../../res/widgets/global_widgets/circular_avatar.dart';
import '../../res/widgets/global_widgets/custom_text_form_field.dart';
import '../../res/widgets/global_widgets/primary_button.dart';
import '../../res/widgets/global_widgets/product_details_component.dart';
import '../../utils/constants/constant_width.dart';
import '../google_location/launch_google_map.dart';
import '../home_screens/similar_product_screen/similar_products.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
  });
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

ProductDetailModel productDetailModel = ProductDetailModel();

GlobalKey<FormState> placebid = GlobalKey<FormState>();

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(children: [
            SizedBox(
              width: ConstantSize.getWidth(context),
              height: ConstantSize.getHeight(context) * 0.28,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: AppColors.grayColor,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        disableCenter: false,
                        enlargeCenterPage: true,
                         viewportFraction: 1.0,
                        autoPlay: true,
                         aspectRatio: 16 / 9,),
                    items: productDetailModel.sliderImages
                        .map((item) => InkWell(
                              onTap: () {},
                              child: Image.network(
                                item,
                                width: ConstantSize.getWidth(context) * 1,
                                height: ConstantSize.getHeight(context) * 1,
                                fit: BoxFit.fill,
                              ),
                            ))
                        .toList(),
                  ),
                  Positioned(
                      left: 25,
                      top: 00,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: AppColors.whiteColor,
                                size: 24,
                              )),
                          const SizedBox(
                            width: AppPadding.wDefaultPadding / 2,
                          ),
                          // const CustomTagButton(),
                        ],
                      )),
                  Positioned(
                    right: 25,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        // Platform.isAndroid
                        //     ? Share.share(
                        //         'https://play.google.com/store/apps/details?id=com.daraz.android')
                        //     : Share.share(
                        //         'https://apps.apple.com/pk/app/daraz-online-shopping-app/id978058048');
                      },
                      child: const Icon(
                        Icons.share,
                        color: AppColors.whiteColor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.wDefaultPadding * 1.5,
                  right: AppPadding.wDefaultPadding * 1.5,
                  top: AppPadding.wDefaultPadding,
                ),
                child: Form(
                  key: placebid,
                  child: Column(
                    children: [
                      productDetailModel.isadvertType == "Bid"
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildColumn("Highest Bid", "\$ 500"),
                                    _buildColumn("Time", "5d11h"),
                                    _buildColumn("Bids", "4"),
                                    const SizedBox(width: 40),
                                    const Icon(CupertinoIcons.heart_fill,
                                        color: AppColors.primaryColor,
                                        size: 35),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            ConstantSize.getHeight(context) *
                                                0.01),
                                    _buildTitle(),
                                    SizedBox(
                                        height:
                                            ConstantSize.getHeight(context) *
                                                0.01),
                                    _buildLocation(),
                                    SizedBox(
                                        height:
                                            ConstantSize.getHeight(context) *
                                                0.01),
                                    _buildBidAmount(),
                                    SizedBox(
                                        height:
                                            ConstantSize.getHeight(context) *
                                                0.01),
                                    alignCenterLeft(
                                      Text(
                                        "Enter \$ 500 or more",
                                        style: MyTextStyles.regularDetailGrey,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "\$ 500.00",
                                      style: MyTextStyles.subHeadingBoldBlack,
                                    ),
                                    const Expanded(child: SizedBox()),
                                    InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          CupertinoIcons.heart_fill,
                                          color: AppColors.primaryColor,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        ConstantSize.getHeight(context) * 0.01),
                                _buildTitle(),
                                SizedBox(
                                    height:
                                        ConstantSize.getHeight(context) * 0.01),
                                _buildLocation(),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: AppColors.snowBackground,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.wDefaultPadding * 1.5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Details",
                            textAlign: TextAlign.left,
                            style: MyTextStyles.detailBoldPrimary,
                          )),
                      SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                      ProductDetilComponents(
                          title: 'Brand', titleDetails: 'Brand', line: true),
                      ProductDetilComponents(
                          title: 'Condition', titleDetails: 'New', line: true),
                      ProductDetilComponents(
                          title: 'Price', titleDetails: '\$500', line: true),
                      ProductDetilComponents(
                        title: 'Date',
                        titleDetails: '5-12-2022',
                        line: false,
                      ),
                      const SizedBox(
                        height: AppPadding.wDefaultPadding * 1.5,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description",
                            textAlign: TextAlign.left,
                            style: MyTextStyles.detailBoldPrimary,
                          )),
                      const SizedBox(
                        height: AppPadding.wDefaultPadding * 1,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: ReadMoreText(
                          MyStrings.dummyText,
                          trimLines: 3,
                          colorClickableText: Colors.black,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.wDefaultPadding * 1.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CireleAvatarImage(
                          image: AppImages.otherPersonImages,
                          border: ConstantSize.getWidth(context) * 0.09,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.wDefaultPadding / 1.5),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Noman Hassan",
                                    overflow: TextOverflow.ellipsis,
                                    style: MyTextStyles.detailCardBoldBlack,
                                  )),
                              const SizedBox(
                                height: AppPadding.wDefaultPadding / 2,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Member since 1999",
                                    style: MyTextStyles.headingDetailGrey,
                                  )),
                            ],
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: AppPadding.wDefaultPadding / 2,
                    ),
                    Row(
                      children: [
                        // ignore: unrelated_type_equality_checks
                        Expanded(
                          child: BtnPrimeryBackground(
                            width: 70,
                            height: 50,
                            backgroundColor: AppColors.primaryColor,
                            title: 'Contact',
                            borderRadiusCircular: 5,
                            borderColor: AppColors.primaryColor,
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            borderSideWidth: 1,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: BtnPrimeryBackground(
                            width: 70,
                            height: 50,
                            backgroundColor: Colors.white,
                            title: 'All Ads',
                            borderRadiusCircular: 5,
                            borderColor: AppColors.primaryColor,
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            borderSideWidth: 1,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: AppPadding.wDefaultPadding * 1.5,
                    left: AppPadding.wDefaultPadding * 1.5),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Location",
                          style: MyTextStyles.headingSmallPrimary,
                        )),
                    const SizedBox(
                      height: AppPadding.sDefaultPadding,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "street 3 i8 markez main road highway islamabad pakistan",
                          style: MyTextStyles.regularDetailBlack,
                        )),
                    const SizedBox(
                      height: AppPadding.sDefaultPadding,
                    ),
                    const LaunchMapLocation(
                      latitude: 33.6844,
                      longitude: 73.0479,
                    ),
                    const SizedBox(
                      height: AppPadding.wDefaultPadding,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppPadding.wDefaultPadding / 2,
            ),
            const SimilarProductScreen(),
          ]);
        }),
      ),
    ));
  }

  Widget _buildColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyles.detailCardNormalBlack,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: MyTextStyles.detailCardBoldBlack,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      "16GB RAM Windows 10 Laptop 15.6 FHD Screen 128GB/2562GB/512GB/1T SSD Ultra thin office notebook",
      style: MyTextStyles.detailCardBoldBlack,
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        Expanded(
            child: Text(
          "street 3 i8 markez main road highway islamabad pakistan",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: MyTextStyles.regularDetailGrey,
        )),
        Text(
          "2 day ago",
          textAlign: TextAlign.right,
          style: MyTextStyles.regularDetailGrey,
        )
      ],
    );
  }

  Widget _buildBidAmount() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: ConstantSize.getHeight(context) * 0.061,
            width: ConstantSize.getWidth(context) * 0.45,
            child: CustomTextField(
              validator: (validator) {
                if (validator!.isEmpty) {
                  return "Enter bid Price";
                }
                if (double.tryParse(validator) == null) {
                  return "Invalid value. Please enter a number.";
                }

                return null;
              },

              keyboardType: TextInputType.name,
              // fillColor: Colors.white,
              hintText: 'Bid Amount',
              maxLines: 1,
            ),
          ),
          BtnPrimeryBackground(
            onPressed: () {},
            title: 'Place Bid',
            borderRadiusCircular: 5,
            borderSideWidth: 1,
            textStyle: MyTextStyles.headingxSmallBoldWhite,
            height: ConstantSize.getHeight(context) * 0.055,
            width: ConstantSize.getWidth(context) * 0.34,
            borderColor: AppColors.primaryColor,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
