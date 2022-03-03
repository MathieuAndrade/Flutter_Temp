import 'package:http/http.dart';
import 'package:preferences/preferences.dart';

String externAddress = 'http://cameraferolles.ddns.net';

String serverIp = 'http://192.168.1.50';
String serverPort = '8080';
String serverExternPort = '9090';

Map<String, String> headers = {"Content-type": "application/json"};

changeTempState(value) async {
  externAddress = PrefService.get('dns_address');
  serverIp = PrefService.get('device_ip');
  serverPort = PrefService.get('device_intern_port');
  serverExternPort = PrefService.get('device_extern_port');
  try {
    Response response = await post('$serverIp:$serverPort/temp/state=$value', headers: headers);
    // If request with local url fail, test with extern url
    if(response.statusCode != 200) {
      response = await post('$externAddress!$serverExternPort/temp/state=$value', headers: headers);
    }

    return response.statusCode;
  } catch (err) {
    print(err);
    return 500;
  }
}

changeDeviceState(value) async {
  externAddress = PrefService.get('dns_address');
  serverIp = PrefService.get('device_ip');
  serverPort = PrefService.get('device_intern_port');
  serverExternPort = PrefService.get('device_extern_port');
  try {
    Response response = await post('$serverIp:$serverPort/device/state=$value', headers: headers);
    // If request with local url fail, test with extern url
    if(response.statusCode != 200) {
      response = await post('$externAddress!$serverExternPort/device/state=$value', headers: headers);
    }

    return response.statusCode;
  } catch (err) {
    print(err);
    return 500;
  }
}

changeHouseState(value) async {
  externAddress = PrefService.get('dns_address');
  serverIp = PrefService.get('device_ip');
  serverPort = PrefService.get('device_intern_port');
  serverExternPort = PrefService.get('device_extern_port');
  try {
    Response response = await post('$serverIp:$serverPort/house/state=$value', headers: headers);
    // If request with local url fail, test with extern url
    if (response.statusCode != 200) {
      response = await post('$externAddress!$serverExternPort/house/state=$value', headers: headers);
    }
    return response.statusCode;
  } catch (err) {
    print(err);
    return 500;
  }
}

getCurrentTemp() async {
  externAddress = PrefService.get('dns_address');
  serverIp = PrefService.get('device_ip');
  serverPort = PrefService.get('device_intern_port');
  serverExternPort = PrefService.get('device_extern_port');
  try {
    Response response = await get('$serverIp:$serverPort/temp', headers: headers);
    // If request with local url fail, test with extern url
    if(response.statusCode != 200) {
      response = await get('$externAddress:$serverExternPort/temp', headers: headers);
    }

    String body = response.body;
    print(body);
  } catch (err) {
    print(err);
    return 500;
  }
}