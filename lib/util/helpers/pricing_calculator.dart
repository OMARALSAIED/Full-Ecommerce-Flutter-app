class TPricingCalCulator
{
  //Calculate price Based on Tax and Shipping
  static double calculateTotalPrice(double productPrice ,String location)
  {
     double taxRate=getTaxRateForLocation(location);
     double taxamount=productPrice*taxRate;

     double shippingCost=getShippingCost(location);

     double totalPrice=productPrice+taxamount+shippingCost;

     return totalPrice;
  }

  static  String calculateShippingCost(double productPrice,String location)
  {
    double shippingCost=getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice,String location)
  {
    double taxRate=getTaxRateForLocation(location)
;   double taxamount=productPrice*taxRate;
return taxamount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location)
  {
    return 0.10;
  }
  static double getShippingCost(String location)
  {
    return 5.00;
  }

}