import 'package:logger/logger.dart';

Logger logger = Logger(printer: PrettyPrinter());

class LoggerHelper {
  static verbose(message) {
    logger.v(message);
  }

  static debug(message) {
    logger.d(message);
  }

  static info(message) {
    logger.i(message);
  }

  static warning(message) {
    logger.w(message);
  }

  static error(message) {
    logger.e(message);
  }
}
