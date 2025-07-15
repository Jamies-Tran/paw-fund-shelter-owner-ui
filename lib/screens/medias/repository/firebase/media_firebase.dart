import 'package:firebase_storage/firebase_storage.dart';

abstract class IMediaFirebase {
  Future<String> getUrl(String path);
}

class MediaFirebaseImpl extends IMediaFirebase {

  @override
  Future<String> getUrl(String path) async {
    try {
          Reference reference = FirebaseStorage.instance.ref(path);
          return await reference.getDownloadURL();
    } catch (e) {
      print(e);
      return "";
    }
  }

}