import 'package:ecommerce/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/features/shop/models/ProductVariationModel.dart';
import 'package:get/get.dart';

class Variationcontroller extends GetxController {
  static Variationcontroller get instance => Get.find();

  RxMap<String, String> selectedAttributes = <String, String>{}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  void setInitialSelection(ProductModel product) {
    if (product.productVariation != null && product.productVariation!.isNotEmpty) {
      final firstVariation = product.productVariation!.first;

      // تعيين السمات بشكل تلقائي
      selectedAttributes.clear();
      firstVariation.attributeValues.forEach((key, value) {
        selectedAttributes[key] = value;
      });

      print("Selected Attributes: $selectedAttributes");

      // تحديث الصورة الرئيسية
      if (firstVariation.image.isNotEmpty) {
        ImagesController.instance.selectedProductImage.value = firstVariation.image;
      }

      // تعيين الـ selectedVariation
      selectedVariation.value = firstVariation;

      // تحديث حالة المخزون
      getProductVariationStockStatus();

      // تحديث الواجهة بعد التحديد الأولي
      update();
    }
  }

  void onAttributeSelected(
    ProductModel product,
    String attributeName,
    String attributeValue,
  ) {
    selectedAttributes[attributeName] = attributeValue;

    // البحث عن التوافق مع المتغيرات
    final matchedVariation = product.productVariation!.firstWhere(
      (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    selectedVariation.value = matchedVariation;

    // تحديث الصورة
    if (matchedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = matchedVariation.image;
    }

    getProductVariationStockStatus();

    update(); // تحديث الواجهة
  }

  bool _isSameAttributeValues(
    Map<String, String> variationAttributes,
    Map<String, String> selectedAttributes,
  ) {
    for (final key in selectedAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
