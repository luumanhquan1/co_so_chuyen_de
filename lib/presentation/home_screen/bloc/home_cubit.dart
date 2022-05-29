import 'dart:developer';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/default_env.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/domain/model/post_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/domain/repository/post_repository.dart';
import 'package:ccvc_mobile/domain/repository/user_repository.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeStateInitial())
  {
     userId =  PrefsService.getUserId();
    log(userId);
    getUserInfo(userId);
    getAllPosts();
  }

  String userId='';
  final BehaviorSubject<List<PostModel>> _posts =
  BehaviorSubject<List<PostModel>>.seeded([]);

  Stream<List<PostModel>> get posts => _posts.stream;

  final BehaviorSubject<int> _unreadNotis =
  BehaviorSubject<int>.seeded(0);

  Stream<int> get unreadNotis => _unreadNotis.stream;

  final BehaviorSubject<UserModel> _user =
  BehaviorSubject<UserModel>.seeded(UserModel());

  Stream<UserModel> get user => _user.stream;

  PostRepository _postRepository = PostRepository();
  UserRepopsitory _userRepopsitory = UserRepopsitory();
  Future<void> getAllPosts() async{
    log(DateTime.now().toString());
    //showLoading();
   try{
    FirebaseFirestore.instance
        .collection(DefaultEnv.appCollection)
        .doc(DefaultEnv.developDoc)
        .collection(DefaultEnv.postsCollection)
        .snapshots()
        .listen((event) async {
      if (event.docs == null) {
        return null;
      } else {
        final result = await _postRepository.fetchAllPost();
      log(result.toString());
      log('gggggggggggggg');
      _posts.sink.add(result);
      showContent();
   }


    });

    }catch (e){
      log(e.toString());
      showError();
    }
  }

  Future<void> getUserInfo(userId) async{
    showLoading();
  //  try{
      final result = await _userRepopsitory.getUserProfile(userId: userId);
      if(result != null)
        {
          log('pppp'+result.toString());
          _user.sink.add(result);
       //   showContent();
        }
      else{
        showError();
      }




    // }catch (e){
    //   log(e.toString());
    //   showError();
    // }
  }

  Future<void> likePost({required String postId, required List<String> likes}) async{
    log('ppppppppppppppppp');
    // try{
    //   await _postRepository.likePost(
    //     postId,
    //     _user.value.userId!,
    //     likes,
    //   );
    // await getAllPosts();
    //
    // }catch (e) {
    //   log(e.toString());
    //   showError();
    // }
  }

  Future<void> deletePost({required String postId}) async{
    // try{
    //   await _postRepository.deletePost(
    //     postId,
    //   );
   // await getAllPosts();
    // }catch (e) {
    //   log(e.toString());
    //   showError();
    // }
  }

}