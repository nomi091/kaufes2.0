import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/view/my_ads_screen/widgets_my_ads/auction_price_screen.dart';
import 'package:kaufes/view/my_ads_screen/widgets_my_ads/fix_price_screen.dart';

import '../../utils/constants/colors.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      const Tab(text: 'Fixed Price'),
      const Tab(text: 'Auctions'),
    ];
    TabController? tabController;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.square(ConstantSize.getHeight(context) * 0.1),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                'My Ads',
                style: MyTextStyles.headingSmallBoldPrimary,
              ),
            ),
            bottom: TabBar(
              unselectedLabelColor: AppColors.dimGray,
              labelColor: AppColors.primaryColor,
              labelStyle: MyTextStyles.headingSmallBoldPrimary,
              unselectedLabelStyle: MyTextStyles.headingDetailGrey,
              controller: tabController,
              tabs: myTabs,
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            FixPriceScreen(),
            AuctionPriceScreen(),
          ],
        ),
      ),
    );
  }
}
