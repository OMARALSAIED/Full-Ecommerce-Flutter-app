class SthandelFormatExceptions implements Exception {
  SthandelFormatExceptions();

  String invalidJson() => 'The received data is not in a valid JSON format.';
  
  String unexpectedCharacter() => 'The data contains unexpected characters.';
  
  String missingRequiredField() => 'Some required fields are missing from the data.';
  
  String invalidType() => 'The data contains an invalid type. Please check your input.';
  
  String unexpectedEndOfInput() => 'The data ended unexpectedly. Please ensure complete data.';
  
  String unknown() => 'An unexpected format error occurred. Please ensure the data is correct.';
}
