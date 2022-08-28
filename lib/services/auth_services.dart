import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../helper/cache_helper.dart';

class RegisterServices   {
  final auth = FirebaseAuth.instance;
  final fireCloud = FirebaseFirestore.instance;
  User? currentFirebaseUser  ;
    // var listOfUsers=[];
  signInAnonymously() async {
    try {
      final userCredential = await auth.signInAnonymously();
      // listOfUsers.add( userCredential.user?.uid);
      print("Signed in with temporary account.");
      currentFirebaseUser=userCredential.user;
      await fireCloud.collection('users').doc().collection('AnonymousUsers').add({
        'anonymousUserId':currentFirebaseUser?.uid
      });
      CacheHelper.saveData(key: 'token', value: userCredential.user?.uid);
      CacheHelper.saveData(key: 'user', value: currentFirebaseUser);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
  signOut()async{
    await CacheHelper.removeData(key: 'token');
    await CacheHelper.clearData().then((value) {
        // Get.offAllNamed(AppRoutes.splashScreen)
    }
    );
  }

}
