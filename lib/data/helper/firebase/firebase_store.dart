import 'dart:async';
import 'dart:typed_data';

import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_const.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/fcm_tokken_model.dart';
import 'package:ccvc_mobile/domain/model/post_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/utils/constants/dafault_env.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/dialog/message_dialog/message_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:html_editor_enhanced/utils/utils.dart';

class FireStoreMethod {
  static Future<UserModel> getDataUserInfo(String id) async {
    try {
      final QuerySnapshot<dynamic> snap = await FirebaseFirestore.instance
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(id)
          .collection(DefaultEnv.profile)
          .get();

      final UserModel userInfo = UserModel.fromJson(
        snap.docs.first.data(),
      );
      return userInfo;
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }

      return UserModel.empty();
    }
  }

  static Future<bool> isDataUser(String userId) async {
    try {
      final QuerySnapshot<dynamic> snap = await FirebaseFirestore.instance
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .get();

      for (final id in snap.docs) {
        if (id.id == userId) {
          return true;
        }
      }
      return false;
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }

      return false;
    }
  }

  static Future<void> updateUser(
    String userId,
    UserModel model,
  ) async {
    try {
      final QuerySnapshot<dynamic> snap = await FirebaseFirestore.instance
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(userId)
          .collection(DefaultEnv.profile)
          .get();

      await FirebaseFirestore.instance
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(userId)
          .collection(DefaultEnv.profile)
          .doc(snap.docs.first.id)
          .update(model.toJson(model));
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<void> saveInformationUser({
    required String id,
    required UserModel user,
  }) async {
    try {
      await firestore
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(id)
          .collection(DefaultEnv.profile)
          .doc(getRandString(15).removeChar)
          .set(
            user.toJson(user),
          );
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<void> saveFlg({
    required String userId,
  }) async {
    try {
      await firestore
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(userId)
          .set({'onlineFlag': true});
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<void> saveToken({
    required String userId,
    required FcmTokenModel fcmTokenModel,
  }) async {
    try {
      await deleteToken(userId: userId, token: fcmTokenModel.tokenFcm ?? '');
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }

    try {
      await firestore
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(userId)
          .collection(DefaultEnv.tokkenFcm)
          .doc(fcmTokenModel.tokenFcm)
          .set(fcmTokenModel.toJson(fcmTokenModel));
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<void> deleteToken({
    required String userId,
    required String token,
  }) async {
    try {
      await firestore
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(userId)
          .collection(DefaultEnv.tokkenFcm)
          .get()
          .then((value) {
        for (final DocumentSnapshot post in value.docs) {
          if (post.id == token) {
            post.reference.delete();
          }
        }
      });
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<void> updateToken({
    required String userId,
    required String tokenOld,
    required FcmTokenModel fcmTokenModel,
  }) async {
    try {
      await deleteToken(userId: userId, token: fcmTokenModel.tokenFcm ?? '');
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }

    try {
      await PrefsService.removeTokken();
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
    try {
      await firestore
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(userId)
          .collection(DefaultEnv.tokkenFcm)
          .doc(fcmTokenModel.tokenFcm)
          .update(fcmTokenModel.toJson(fcmTokenModel));
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<FcmTokenModel> getTokenFcm({required String id}) async {
    try {
      final QuerySnapshot<dynamic> snap = await FirebaseFirestore.instance
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.users)
          .doc(id)
          .collection(DefaultEnv.tokkenFcm)
          .get();

      final FcmTokenModel tokenModel =
          FcmTokenModel.fromJson(snap.docs.first.data());

      return tokenModel;
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
      return FcmTokenModel.empty();
    }
  }

  static Future<void> uploadImageToStorage(String id, Uint8List file) async {
    try {
      final Reference ref = storage.ref().child(id).child('avatarUser');

      await ref.putData(file);
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<void> removeImage(String id) async {
    try {
      final Reference ref = storage.ref().child(id);
      await ref.delete();
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<String> downImage(String id) async {
    String downUrlImage = '';
    try {
      downUrlImage =
          await storage.ref().child('$id/avatarUser').getDownloadURL();
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
    return downUrlImage;
  }

  static Future<void> uploadImageFromCreatePost({
    required String id,
    required String idPost,
    required Uint8List file,
  }) async {
    try {
      final Reference ref = storage
          .ref()
          .child(id)
          .child(DefaultEnv.postsCollection)
          .child(idPost);

      await ref.putData(file);
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }

  static Future<String> downImageCreatePost(
      {required String id, required String idPost}) async {
    String downUrlImage = '';
    try {
      downUrlImage = await storage
          .ref()
          .child('$id/${DefaultEnv.postsCollection}/$idPost')
          .getDownloadURL();
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
    return downUrlImage;
  }

  static Future<void> createPost(
      {required PostModel model, required String postId}) async {
    try {
      await firestore
          .collection(DefaultEnv.socialNetwork)
          .doc(DefaultEnv.develop)
          .collection(DefaultEnv.postsCollection)
          .doc(postId)
          .set(model.toJson(model));
    } catch (error) {
      if (error is TimeoutException || error is NoNetworkException) {
        MessageConfig.show(
          title: 'Không có kết nối Interet',
          messState: MessState.error,
        );
      } else {
        MessageConfig.show(
          title: 'Truy cập thất bại, vui lòng thử lại !',
          messState: MessState.error,
        );
      }
    }
  }
}
