import 'package:cloud_firestore/cloud_firestore.dart';

class ShipmentModel{

 String ? dt;
 String ?id;
 List ?points;


 ShipmentModel({this.id, this.points,this.dt});


 factory ShipmentModel.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> shipmentMap){
  return ShipmentModel(
   dt: shipmentMap['dt'],
   id: shipmentMap['id'],
   points: shipmentMap['points'],
   );


}
}