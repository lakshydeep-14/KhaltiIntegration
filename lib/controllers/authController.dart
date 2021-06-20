import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Screens/Home.dart';
import '../Screens/SignInPage.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser ; 
  var userEmail;
  String get user => _firebaseUser.value?.email; // Observables have values :D

  
  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  // creating the new user
  Future<User> createUser(String email, String password) async {
    try {
      final res=await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
          userEmail=res.user.email;
          return res.user;
          
    } catch (error) {
      Get.snackbar("Error Creating account", error.message,
          snackPosition: SnackPosition.BOTTOM);
         
      if (error.code == "email-already-in-use") {
        print("Email adress already in use");
      }
    }
  }

  // Logging the  user

  Future<User> login({String email, String password}) async {
    
    try {
      
      final res=await _auth.signInWithEmailAndPassword(email: email, password: password);
       userEmail=res.user.email;
      return res.user;
          
    } catch (error) {
      Get.snackbar("Unable to sign in!", error.message,
          snackPosition: SnackPosition.BOTTOM);
      print(error.message);
      return null;
    }
  }
  
  Future<User> signInWithGoogle() async {
    try {
      GoogleSignIn gs=GoogleSignIn();
      final guser= await gs.signIn();
      final gauth=await guser.authentication;
      final  credential = GoogleAuthProvider.credential(
    accessToken: gauth.accessToken,
    idToken: gauth.idToken,
  );
final res=await _auth.signInWithCredential(credential);
 userEmail=res.user.email;
      return res.user;
          
    } catch (error) {
      Get.snackbar("Unable to sign in!", error.message,
          snackPosition: SnackPosition.BOTTOM);
      print(error.message);
      return null;
    }
  

}
 
  void signOut() async {
    try {
      await _auth.signOut().whenComplete(
            () => Get.offAll(
              SignInPage(),
            ),
          );
    } catch (error) {
      print(error.code);
    }
  }
}
