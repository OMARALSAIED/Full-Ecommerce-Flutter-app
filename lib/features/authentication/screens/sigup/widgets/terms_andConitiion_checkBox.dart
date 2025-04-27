import 'package:ecommerce/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart' show TText;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class termsAndConitiionCheckbox extends StatelessWidget {
  const termsAndConitiionCheckbox({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Row(
      children: [
        SizedBox(
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicyAccepted.value,
              onChanged:
                  (value) =>
                      controller.privacyPolicyAccepted.value =
                          !controller.privacyPolicyAccepted.value,
            ),
          ),
        ),
        const SizedBox(width: TSize.spaceBtweenItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TText.iAgreeTo}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${TText.privacyPolicy}',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? AppColor.kwhite : AppColor.kPrimery,
                ),
              ),
              TextSpan(
                text: '${TText.and}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${TText.termsOfUse}',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? AppColor.kwhite : AppColor.kPrimery,
                ),
              ),
              TextSpan(text: ""),
            ],
          ),
        ),
      ],
    );
  }
}
