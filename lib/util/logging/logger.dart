import 'package:logger/web.dart';

class TLoggrtHelper
{
  static final Logger _logger=Logger(printer: PrettyPrinter(),
  level: Level.debug
  );

  static void deBug(String message)
  {
    _logger.d(message);
  }

  static void info(String message)
  {
    _logger.i(message);

  }

  static void wraning(String message)
  {
    _logger.w(message);
  }

  static void error(String message,[dynamic erro])
  {
    _logger.e(message,error: error,stackTrace: StackTrace.current);
  }
  
}