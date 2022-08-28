import 'package:get/get.dart';
import 'package:tracker_admin_panel/model/dashboard_model.dart';

import '../model/shipments_model.dart';
import '../services/fetch_data_services.dart';

class DashoardController extends GetxController {
  final _lista = <Dashboard>[];
  final isLoading=false.obs;

   List<Dashboard> get lista => _lista;
  final _listOfShipments = <ShipmentModel>[];
  get listOfShipments => _listOfShipments;


  var listOfUsers = [];

  final services = FetchDataServices();

  @override
  void onInit() {
     isLoading.value;
    getData();
    getUsers();
    getShipments();
  }

  getData() async {
    isLoading.value=false;
    _lista.addAll(await services.getDataFromFireStore());
    print('*************************************${_lista.length}');
    isLoading.value=true;
  }

  getUsers() async {
    listOfUsers = await services.getNumberOfUsers();
  }

  getShipments() async {
    _listOfShipments.addAll(await services.getDataFromShipments());
  }


}
