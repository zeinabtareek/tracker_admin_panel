import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tracker_admin_panel/model/dashboard_model.dart';
import 'package:tracker_admin_panel/model/shipments_model.dart';

class FetchDataServices {
  final fireCloud = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
   Future<List<Dashboard>> getDataFromFireStore() async {
     final results = await fireCloud.collectionGroup('info').get();
     var data = results.docs.map((e) => Dashboard.fromMap(e)).toList();
    return data;
   }
   Future  getNumberOfUsers()async{
     try{
     final results=await fireCloud
         .collectionGroup('AnonymousUsers')
         .get();
     print('########################${results.size}');
     return await results.docs;
       }catch(e){
       print(e);
     }
}
   Future  getDataFromShipments()async{
     try{
     final results=await fireCloud
         .collectionGroup('shipmentId')
         .get();
     var data=results.docs.map((e) => ShipmentModel.fromMap(e)).toList();
     print(' the total number of docs :${results.size}');
     return await data;
       }catch(e){
       print(e);
     }
}


}
