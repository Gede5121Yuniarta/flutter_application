// import 'dart:async';
// import 'dart:convert';

// // import 'package:flutter_application_1/models/errMsg.dart';
// import 'package:http/http.dart' as http;
// // import 'package:flutter_application_1/models/kelompok.dart';
// import 'package:flutter_application_1/models/petani.dart';

// class ApiStatic{
//   // static final host='http://192.168.43.189/webtani/public';
//   static final host='http://10.10.58.123/webtani/public';
//   static var _token="8|x6bKsHp9STb0uLJsM11GkWhZEYRWPbv0IqlXvFi7";
//   Future<List<Petani>> fetchPetani() async {
//   final response = await http
//       .get(Uri.parse('https://dev.wefgis.com/api/petani?s'), headers: {
//     'Authorization': 'Bearer ' + _token,
//   });

//   if (response.statusCode == 200) {
//     // If the server returns a 200 OK response,
//     // then parse the JSON.
//     var json = jsonDecode(response.body);
//     final data = json['data'];

//     if (data is List) {
//       // Check if data is a list
//       return data.map((petaniJson) => Petani.fromJson(petaniJson)).toList();
//     } else {
//       throw Exception('Data is not in the expected format');
//     }
//   } else {
//     // If the server does not return a 200 OK response,
//     // throw an exception.
//     throw Exception('Failed to load data');
//   }
// }

// // Create a new petani
//   Future<Petani> createPetani(Petani petani) async {
//     final response = await http.post(
//       Uri.parse('https://dev.wefgis.com/api/petani'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'id_kelompok_tani': petani.idKelompokTani,
//         'nama': petani.nama,
//         'nik': petani.nik,
//         'alamat': petani.alamat,
//         'telp': petani.telp,
//         'foto': petani.foto,
//         'status': petani.status,
//         'nama_kelompok': petani.namaKelompok,
//       }),
//     );

//     if (response.statusCode == 201) {
//       return Petani.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create petani');
//     }
//   }

//   // Update an existing petani
//   Future<Petani> updatePetani(Petani petani) async {
//     final response = await http.put(
//       Uri.parse('https://dev.wefgis.com/api/petani/${petani.idPenjual}'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'id_kelompok_tani': petani.idKelompokTani,
//         'nama': petani.nama,
//         'nik': petani.nik,
//         'alamat': petani.alamat,
//         'telp': petani.telp,
//         'foto': petani.foto,
//         'status': petani.status,
//         'nama_kelompok': petani.namaKelompok,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return Petani.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to update petani');
//     }
//   }

//   // Delete a petani
//   Future<void> deletePetani(String idPenjual) async {
//     final response = await http.delete(
//       Uri.parse('https://dev.wefgis.com/api/petani/$idPenjual'),
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to delete petani');
//     }
//   }

//   //Nambah
//   // static Future<List<Kelompok>> getKelompokTani() async{
//   //   try {
//   //     final response= await http.get(Uri.parse("$host/api/kelompoktani"),
//   //     headers: {
//   //       'Authorization':'Bearer '+_token,
//   //     });
//   //     if (response.statusCode==200) {
//   //       var json=jsonDecode(response.body);
//   //       final parsed=json.cast<Map<String, dynamic>>();
//   //       return parsed.map<Kelompok>((json)=>Kelompok.fromJson(json)).toList();
//   //     } else {
//   //       return [];
//   //     }
//   //     } catch (e) {
//   //       return [];
//   //   }
//   // }
//   // static Future<ErrorMSG> savePetani(id, petani, filepath) async {
//   //   try {
//   //     var url=Uri.parse('$host/api/petani');
//   //     if(id != 0){
//   //       url=Uri.parse('$host/api/petani/'+id.toString());
//   //     }
//   //     var request = http.MultipartRequest('POST', url);
//   //     request.fields['nama']=petani['nama'];
//   //     request.fields['nik']=petani['nik'];
//   //     request.fields['alamat']=petani['alamat'];
//   //     request.fields['telp']=petani['telp'];
//   //     request.fields['status']=petani['status'];
//   //     request.fields['id_kelompok_tani']=petani['id_kelompok_tani'].toString();
//   //     if(filepath!=''){
//   //       request.files.add(await http.MultipartFile.fromPath('foto', filepath));
//   //     }
//   //     request.headers.addAll(
//   //       {
//   //         'Authorization':'Bearer '+_token,
//   //       }
//   //     );
//   //     var response = await request.send();
//   //     //final response = await http.post(Uri.parse('$_host/panen'), body:_panen);
//   //     if (response.statusCode == 200) {
//   //         //return ErrorMSG.fromJson(jsonDecode(response.body));
//   //         final respStr = await response.stream.bytesToString();
//   //         //print(jsonDecode(respStr));
//   //         return ErrorMSG.fromJson(jsonDecode(respStr));
//   //       } else {
//   //         //return ErrorMSG.fromJson(jsonDecode(response.body));
//   //         return ErrorMSG(success: false,message: 'err Request');
//   //       }
//   //   } catch (e) {
//   //     ErrorMSG responseRequest = ErrorMSG(success: false,message: 'error caught: $e');
//   //     return responseRequest;
//   //   }
//   // }
// }

import 'dart:async';
import 'dart:convert';

import 'package:flutter_application_1/models/errMsg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/models/kelompok.dart';
// import 'package:flutter_application_1/models/new_petani_model.dart';
import 'package:flutter_application_1/models/petani.dart';

class ApiStatic {
  //static final host='http://192.168.43.189/webtani/public';
  static final host = 'http://10.10.58.123/webtani/public';
  static var _token = "8|x6bKsHp9STb0uLJsM11GkWhZEYRWPbv0IqlXvFi7";
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  static Future<void> getPref() async {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final SharedPreferences prefs = await preferences;
    _token = prefs.getString('token') ?? "";
  }

  static getHost() {
    return host;
  }

  // Fetch all petani
  Future<List<Petani>> fetchPetani() async {
    final response =
        await http.get(Uri.parse('https://dev.wefgis.com/api/petani?s'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final data = json['data'];

      if (data is List) {
        return data.map((petaniJson) => Petani.fromJson(petaniJson)).toList();
      } else {
        throw Exception('Data is not in the expected format');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Create a new petani
  Future<Petani> createPetani(Petani petani) async {
    final response = await http.post(
      Uri.parse('https://dev.wefgis.com/api/petani'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id_kelompok_tani': petani.idKelompokTani,
        'nama': petani.nama,
        'nik': petani.nik,
        'alamat': petani.alamat,
        'telp': petani.telp,
        'foto': petani.foto,
        'status': petani.status,
        'nama_kelompok': petani.namaKelompok,
      }),
    );

    if (response.statusCode == 201) {
      return Petani.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create petani');
    }
  }

  // Update an existing petani
  Future<Petani> updatePetani(Petani petani) async {
    final response = await http.put(
      Uri.parse('https://dev.wefgis.com/api/petani/${petani.idPenjual}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id_kelompok_tani': petani.idKelompokTani,
        'nama': petani.nama,
        'nik': petani.nik,
        'alamat': petani.alamat,
        'telp': petani.telp,
        'foto': petani.foto,
        'status': petani.status,
        'nama_kelompok': petani.namaKelompok,
      }),
    );

    if (response.statusCode == 200) {
      return Petani.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update petani');
    }
  }

  // Delete a petani
  Future<void> deletePetani(String idPenjual) async {
    final response = await http.delete(
      Uri.parse('https://dev.wefgis.com/api/petani/$idPenjual'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete petani');
    }
  }

  // get kelompok petani
  static Future<List<Kelompok>> getKelompokTani() async {
    try {
      final response =
          await http.get(Uri.parse("$host/api/kelompoktani"), headers: {
        'Authorization': 'Bearer ' + _token,
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json.cast<Map<String, dynamic>>();
        return parsed.map<Kelompok>((json) => Kelompok.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //Darma
  static Future<ErrorMSG> savePetani(petani, filepath) async {
    try {
      print(petani);
      var url = Uri.parse('https://dev.wefgis.com/api/petani');

      var request = http.MultipartRequest('POST', url);
      request.fields['nama'] = petani.nama;
      request.fields['nik'] = petani.nik;
      request.fields['alamat'] = petani.alamat;
      request.fields['telp'] = petani.telp;
      request.fields['status'] = petani.status;
      request.fields['id_kelompok_tani'] = petani.idKelompokTani;
      if (filepath != '') {
        request.files.add(await http.MultipartFile.fromPath('foto', filepath));
      }
      request.headers.addAll({
        'Authorization': 'Bearer ' + _token,
      });
      var response = await request.send();

      if (response.statusCode == 200) {
        // return Petani.fromJson(jsonDecode(response.body));
        final respStr = await response.stream.bytesToString();
        print(jsonDecode(respStr));
        // print(respStr);

        // return Petani.fromJson(jsonDecode(response.body));
        return ErrorMSG.fromJson(jsonDecode(respStr));
        // return ErrorMSG.fromJson(jsonDecode(respStr));
      } else {
        //return ErrorMSG.fromJson(jsonDecode(response.body));
        // return ErrorMSG(success: false, message: 'err Request');

        throw Exception('Failed to update petani');
      }
    } catch (e) {
      // ErrorMSG responseRequest =
      //     ErrorMSG(success: false, message: 'error caught: $e');
      // return responseRequest;
      print(e);
      throw Exception('Error $e');
    }
  }

  // Update an existing petani
  static Future<ErrorMSG> editPetani(idPenjual, petani, filepath) async {
    try {
      print(petani);
      print(idPenjual);

      var url = Uri.parse('https://dev.wefgis.com/api/petani/$idPenjual');

      var request = http.MultipartRequest('POST', url);
      request.fields['nama'] = petani.nama!;
      request.fields['nik'] = petani.nik!;
      request.fields['alamat'] = petani.alamat!;
      request.fields['telp'] = petani.telp!;
      request.fields['status'] = petani.status!;
      request.fields['id_kelompok_tani'] = petani.idKelompokTani!;
      if (filepath != '') {
        request.files.add(await http.MultipartFile.fromPath('foto', filepath));
      }
      request.headers.addAll({
        'Authorization': 'Bearer ' + _token,
      });
      var response = await request.send();

      if (response.statusCode == 200) {
        // return Petani.fromJson(jsonDecode(response.body));
        final respStr = await response.stream.bytesToString();
        print(jsonDecode(respStr));
        // print(respStr);

        // return Petani.fromJson(jsonDecode(response.body));
        return ErrorMSG.fromJson(jsonDecode(respStr));
        // return ErrorMSG.fromJson(jsonDecode(respStr));
      } else {
        //return ErrorMSG.fromJson(jsonDecode(response.body));
        // return ErrorMSG(success: false, message: 'err Request');

        throw Exception('Failed to update petani');
      }
    } catch (e) {
      // ErrorMSG responseRequest =
      //     ErrorMSG(success: false, message: 'error caught: $e');
      // return responseRequest;
      print(e);
      throw Exception('Error $e');
    }
  }
}
