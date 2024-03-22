import 'package:get/get.dart';

import 'api_client.dart';
class Services extends GetxService {
  final ApIClient apIClient;

  Services({required this.apIClient});
  Future<Response> getAll(String path) async {
    return await apIClient.getData(path);
  }

  Future<Response> getVideosByID(String path,int id) async {
    return await apIClient.getData('$path/?id=$id');
  }
}
