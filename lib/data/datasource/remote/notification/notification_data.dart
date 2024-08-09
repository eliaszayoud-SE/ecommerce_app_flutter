
import '../../../../core/class/crud.dart';
import '../../../../core/constant/link_api.dart';

class NotificationData{
  Crud crud;
  NotificationData(this.crud);

  viewAddress(Map<String, String>? headers) async {
    var response =  await crud.getData(AppLink.viewNotification, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

}