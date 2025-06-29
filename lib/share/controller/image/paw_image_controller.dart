import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageController extends GetxController {
  final Rx<String> _imageUrl = ''.obs;
  final Rx<bool> _isPending = true.obs;

  String getUrl() {
    return _imageUrl.value;
  }

  bool getIsPending() {
    return _isPending.value;
  }

  Future<void> setImageUrl(String path) async {
    try {
      _isPending.value = true;
      Reference ref = FirebaseStorage.instance.ref().child(path);
      String url = await ref.getDownloadURL();
      _imageUrl.value = url;
    } catch (e) {
      print(e);
      _imageUrl.value = '';
    } finally {
      _isPending.value = false;
    }
  }
}