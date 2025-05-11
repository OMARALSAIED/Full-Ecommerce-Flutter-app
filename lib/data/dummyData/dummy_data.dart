
// import 'package:ecommerce/features/authentication/models/sign_up_model.dart';
// import 'package:ecommerce/features/shop/models/BrandModel.dart';
// import 'package:ecommerce/features/shop/models/ProductModel.dart';
// import 'package:ecommerce/features/shop/models/ProductVariationModel.dart';
// import 'package:ecommerce/features/shop/models/banners_model.dart';
// import 'package:ecommerce/features/shop/models/category_model.dart';
// import 'package:ecommerce/features/shop/models/productAttributeModel.dart';
// import 'package:ecommerce/routes/routes_string.dart';
// import 'package:ecommerce/util/constants/images_strings.dart';

// class DummyData {

//   static final List<BannerModel> banners=[
//     BannerModel(imageUrl: TImage.baner1,targetScreen: SRouets.orders, Activ: true),
//     BannerModel(imageUrl: TImage.shritban,targetScreen: SRouets.CartScreen,Activ: true),
//     BannerModel(imageUrl: TImage.shritban,targetScreen: SRouets.settings,Activ: true),
//     BannerModel(imageUrl: TImage.phonban2,targetScreen: SRouets.wishlist,Activ: true),
    
//   ];


//   static final Usermodel=UserModel(id: '4', firstName: 'sam', lastName:'Alsaied' , email: 'wwwdsdsde@gmail.com', userName: 'ssssś', phoneNumber: '09963211', profilePicture: '');
  
//   static final cartmodel=CategoryModel(id: '1', Name: 'sports', Image: TImage.nikee, Isfeatured: true);

  

//    static final List<CategoryModel> categories=[
    
//     CategoryModel(id: '1', Name: 'Sports', Image: TImage.nikee, Isfeatured: true),
//     CategoryModel(id: '5', Name: 'Furnituer', Image: TImage.Furnituer, Isfeatured: true),
//     CategoryModel(id: '2', Name: 'Electronics', Image: TImage.Electronics, Isfeatured: true),
//     CategoryModel(id: '3', Name: 'Clothes', Image: TImage.Clothes, Isfeatured: true),
//     CategoryModel(id: '4', Name: 'Cosmetics', Image: TImage.Cosmetics, Isfeatured: true),
//     CategoryModel(id: '6', Name: 'Jewlery', Image: TImage.Jewlery, Isfeatured: true),
    
//   ];


//   static final List<ProductModel> dummyProducts = [
//   ProductModel(
//     id: 'p1',
//     stock: '23',
//     price: 49.99,
//     salePrice: 39.99,
//     title: 'Bluetooth Headphones',
//     thumbnail: 'https://example.com/images/headphones.png',
//     productType: 'Electronics',
//     sku: 'HD-BT-1001',
//     Description: 'Wireless Bluetooth headphones with high-fidelity sound.',
//     date: DateTime.now(),
//     IsFeatured: true,
//     brand: BrandModel(
//       Id: 'b1',
//       Name: 'SoundTech',
//       Image: 'https://example.com/images/brands/soundtech.png',
//       IsFeatured: true,
//       ProductCount:'23',
      
//     ),
//     categoryId: 'c1',
//     images: [
//       'https://example.com/images/headphones-1.png',
//       'https://example.com/images/headphones-2.png'
//     ],
//     productAttributes: [
//       productAttributeModel(
//         name: 'Color',
//         values: ['Black', 'White', 'Blue'],
//       ),
//       productAttributeModel(
//         name: 'Size',
//         values: ['Standard'],
//       ),
//     ],
//     productVariation: [
//       ProductVariationModel(
//         id: 'v1',
//         sku: 'HD-BT-BLK',
//         image: 'https://example.com/images/variation-black.png',
//         description: 'Black Bluetooth Headphones',
//         price: 49.99,
//         salePrice: 39.99,
//         stock: '', attributeValues: {},
//       ),
//     ],
//   ),

//   ProductModel(
//     id: 'p2',
//     stock: '23',
//     price: 299.99,
//     salePrice: 279.99,
//     title: 'Smart Watch Pro',
//     thumbnail: 'https://example.com/images/smartwatch.png',
//     productType: 'Wearables',
//     sku: 'SW-PRO-200',
//     Description: 'Fitness smart watch with heart rate monitor and GPS.',
//     date: DateTime.now(),
//     IsFeatured: false,
//     brand: BrandModel(
//       Id: 'b2',
//       Name: 'TechFit',
//       Image: 'https://example.com/images/brands/techfit.png',
//       IsFeatured: false,
//       ProductCount:'12',
//       createdAt: DateTime.now(),
//     ),
//     categoryId: 'c2',
//     images: [
//       'https://example.com/images/smartwatch-1.png',
//       'https://example.com/images/smartwatch-2.png',
//     ],
//     productAttributes: [
//       productAttributeModel(
//         name: 'Band Color',
//         values: ['Black', 'Silver'],
//       ),
//     ],
//     productVariation: [
//       ProductVariationModel(
//         id: 'v2',
//         sku: 'SW-BLK',
//         image: 'https://example.com/images/variation-watch-black.png',
//         description: 'Black Strap Version',
//         price: 299.99,
//         salePrice: 279.99,
//         stock: '23', attributeValues: {},
//       ),
//     ],
//   ),

//   ProductModel(
//     id: 'p3',
//     stock: '23',
//     price: 89.99,
//     salePrice: 79.99,
//     title: 'Portable Bluetooth Speaker',
//     thumbnail: 'https://example.com/images/speaker.png',
//     productType: 'Audio',
//     sku: 'SP-BT-300',
//     Description: 'Compact speaker with deep bass and long battery life.',
//     date: DateTime.now(),
//     IsFeatured: true,
//     brand: BrandModel(
//       Id: 'b3',
//       Name: 'BoomBox',
//       Image: 'https://example.com/images/brands/boombox.png',
//       IsFeatured: true,
//       ProductCount: '34',
//       createdAt: DateTime.now(),
//     ),
//     categoryId: 'c3',
//     images: [
//       'https://example.com/images/speaker-1.png',
//       'https://example.com/images/speaker-2.png',
//     ],
//     productAttributes: [
//       productAttributeModel(
//         name: 'Color',
//         values: ['Red', 'Blue', 'Black'],
//       ),
//     ],
//     productVariation: [],
//   ),
// ];

  



  
  
// }