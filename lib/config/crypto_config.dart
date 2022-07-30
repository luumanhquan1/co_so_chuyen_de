import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
class CryptoConfig{
  static final key = utf8.encode('p@112312312312323123123123123123');
  static String encode(dynamic data){
    final bytes = utf8.encode(data.toString());

    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    log('>>>>>>>>>>>>${digest.toString()}');

    return digest.toString();
  }
  static dynamic decode(String data){
  }
}