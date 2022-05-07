 import 'dart:developer';

import 'package:ccvc_mobile/config/firebase_config.dart';

class PostRepository{

  FirebaseSetup firebaseSetup = FirebaseSetup();



   Future<Map> fetchAllPost() async {
     final response = await firebaseSetup.postsCollection.orderBy('createAt').limit(10).get();
     if (response.docs == null) {
       return {};
     } else {
       Map data = Map();
       for(var x in response.docs)
       {
         log(x.data().toString());
         data.addAll({x.id:x.data()});
       }

       return data;
     }
   }
}

