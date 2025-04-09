import 'package:intl/intl.dart';

class TFormatter{
  static String formatDate(DateTime? date)
  {
    date??=DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }
  static String formateCurrency(double amount)
  {
    return NumberFormat.currency(locale: 'en_US',symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phonenumber)
  {
    if(phonenumber.length==10)
    {
      return '(${phonenumber.substring(0,3)}) ${phonenumber.substring(3,6)} ${phonenumber.substring(6)}';

    }else if(phonenumber.length==11)
    {
      return '(${phonenumber.substring(0,4)}) ${phonenumber.substring(4,7)} ${phonenumber.substring(7)}';
    }

    return phonenumber;
  }

static String internationalFormatPhoneNumber(String phoneNumber) {
  // Remove any non-digit characters from phone number
  var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Extract the country code from the digitsOnly (the first 1-3 digits)
  String countryCode;
  if (digitsOnly.length > 10) {
    countryCode = '+' + digitsOnly.substring(0, digitsOnly.length - 10); // Get country code part
    digitsOnly = digitsOnly.substring(digitsOnly.length - 10); // Remaining part is the local number
  } else {
    countryCode = '+' + digitsOnly.substring(0, 1); // Assuming it's a single digit country code for shorter formats
    digitsOnly = digitsOnly.substring(1); // Remove country code part
  }

  final formattedNumber = StringBuffer();
  formattedNumber.write('$countryCode ');

  // Now format the phone number in standard grouping (usually 3-3-4 for local numbers)
  int i = 0;
  while (i < digitsOnly.length) {
    int groupLength = 3; // Default group length
    if (i == 0 && countryCode == '+1') {
      groupLength = 3; // US phone number typically starts with 3 digits after country code
    } else {
      if (i == 3) {
        groupLength = 3; // Adding more formatting after the country code
      }
    }
    int end = i + groupLength;
    formattedNumber.write(digitsOnly.substring(i, end));
    if (end < digitsOnly.length) {
      formattedNumber.write('-'); // Add dash between groups
    }
    i = end;
  }
  
  return formattedNumber.toString();
}

}