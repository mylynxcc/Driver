import 'package:flutter/material.dart';
import 'package:ovoride_driver/core/utils/dimensions.dart';
import 'package:ovoride_driver/core/utils/style.dart';
import 'package:get/get.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/util.dart';
import '../../../../data/controller/withdraw/withdraw_history_controller.dart';
import '../../../components/text-form-field/search_text_field.dart';

class WithdrawHistoryTop extends StatefulWidget {
  const WithdrawHistoryTop({super.key});

  @override
  State<WithdrawHistoryTop> createState() => _WithdrawHistoryTopState();
}

class _WithdrawHistoryTopState extends State<WithdrawHistoryTop> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawHistoryController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.space15, vertical: Dimensions.space15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
            color: MyColor.getCardBgColor(),
            boxShadow: MyUtils.getBottomSheetShadow()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MyStrings.trxNo.tr,
                style: regularSmall.copyWith(
                    color: MyColor.labelTextColor,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: Dimensions.space5 + 3),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: SearchTextField(
                        needOutlineBorder: true,
                        controller: controller.searchController,
                        onChanged: (value) {
                          return;
                        },
                        hintText: '',
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.space10),
                  InkWell(
                    onTap: () {
                      controller.filterData();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: MyColor.primaryColor,
                      ),
                      child: const Icon(Icons.search_outlined,
                          color: MyColor.colorWhite, size: 18),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
