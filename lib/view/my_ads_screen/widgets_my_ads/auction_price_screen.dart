import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/view/my_ads_screen/widgets_my_ads/status_button.dart';

import '../../../view_model/my_ads_view_model/my_ads_view_model.dart';

class AuctionPriceScreen extends StatefulWidget {
  const AuctionPriceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuctionPriceScreenState createState() => _AuctionPriceScreenState();
}

MyAdsViewModel myAdsViewModel = MyAdsViewModel();

class _AuctionPriceScreenState extends State<AuctionPriceScreen> {
  @override
  void initState() {
    super.initState();
    myAdsViewModel.statusBoolList =
        List.generate(myAdsViewModel.statusList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(myAdsViewModel.statusList.length, (index) {
            final isActive = index == myAdsViewModel.selectedIndex;
            // print(isActive);
            return Container(
              padding: const EdgeInsets.all(2.0),
              width: ConstantSize.getWidth(context) * 0.26,
              child: StatusButton(
                title: myAdsViewModel.statusList[index],
                isActive: isActive,
                onPressed: () {
                  setState(() {
                    myAdsViewModel.selectedIndex = index;
                    // print(isActive);
                    print(
                        '${myAdsViewModel.statusList[myAdsViewModel.selectedIndex]} ${!isActive}');
                    //     print(myAdsViewModel.selectedIndex);
                  });
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
