import 'package:ecommerce/data/repositories/Banners/banner_repository.dart';
import 'package:ecommerce/features/shop/models/banners_model.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BannerController extends GetxController {
  final carsualCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {

    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carsualCurrentIndex.value = index;
  }

  void updatePageIndicatr(index) {
    carsualCurrentIndex.value = index;
  }

  //Fetch Banners

  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categores
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);
     
    } catch (e) {
      Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
}
