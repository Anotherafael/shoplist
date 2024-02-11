import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static late final String cloudDatabaseUrl;

  static Future<void> init({String fileName = '.env'}) async {
    await dotenv.load(fileName: fileName);
    cloudDatabaseUrl = dotenv.env['CLOUD_DATABASE_URL']!;
  }
}
