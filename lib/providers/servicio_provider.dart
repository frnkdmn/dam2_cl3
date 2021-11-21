import 'package:http/http.dart' as http;
import '../models/servicio_model.dart';
import 'dart:convert';
import '../utilidades/util.dart' as util;
import 'dart:async' show Future;

class VEN_ServicioProvider {
  String urlRegistraModifica = "RegistraModifica";
  String urlListado = "Listar";
  String urlListarKey = "Listarkey";
  String urlEliminar = "Elimina";
  String jsonResultado = "";

  Future<List<Servicio>> listar(Servicio pServicio) async {
    final urlListadoVEN_Servicio =
        '${util.urlBase}/${util.controlerServicio}/' +
            '${this.urlListado}?${pServicio.toParameter()}';
    var respuesta = await http.get(Uri.parse(urlListadoVEN_Servicio));
    var data = respuesta.body;
    jsonResultado = "[${Servicio().toModelString()}]";
    print(jsonResultado);
    List<Servicio> oListaVEN_Servicio = [];
    if (data != '') {
      oListaVEN_Servicio = List<Servicio>.from(
          json.decode(data).map((x) => Servicio.fromJson(x)));
      jsonResultado = data;
    }
    return oListaVEN_Servicio;
  }

  Future<Servicio> listarKey(int pCodigoServicio) async {
    Servicio oServicio = Servicio();
    oServicio.inicializar();
    final urlquery = '${util.urlBase}/${util.controlerServicio}/' +
        urlListarKey +
        '?' +
        "&pCodigoServicio=" +
        pCodigoServicio.toString();
    final response = await http.get(Uri.parse(urlquery));
    final data = response.body;
    jsonResultado = data;
    if (data != '') {
      oServicio = Servicio.fromJson(json.decode(data));
    }
    return oServicio;
  }

  Future<Servicio> registraModifica(
      Servicio pServicio, String pTipoTransaccion) async {
    Servicio oServicio = Servicio();
    oServicio.inicializar();
    final urlquery = '${util.urlBase}/${util.controlerServicio}/' +
        urlRegistraModifica +
        '?Accion=' +
        pTipoTransaccion +
        '&' +
        pServicio.toParameter();
    final response = await http.get(Uri.parse(urlquery));
    final data = response.body;
    jsonResultado = data;
    if (data != '') {
      pServicio = Servicio.fromJson(json.decode(data));
    }
    return pServicio;
  }

  Future<Servicio> eliminar(int pCodigoServicio) async {
    Servicio oServicio = Servicio();
    oServicio.inicializar();
    final urlquery = '${util.urlBase}/${util.controlerServicio}/' +
        urlEliminar +
        '?' +
        "&pCodigoServicio=" +
        pCodigoServicio.toString();
    final response = await http.get(Uri.parse(urlquery));
    final data = response.body;
    jsonResultado = data;
    if (data != '') {
      oServicio = Servicio.fromJson(json.decode(data));
    }
    return oServicio;
  }

  Future<Servicio> ListaValidarCamposLlenos(int pCodigoServicio) async {
    Servicio oServicio = Servicio();
    oServicio.inicializar();
    final urlquery = '${util.urlBase}/${util.controlerServicio}/' +
        urlListarKey +
        '?' +
        "&pCodigoServicio=" +
        pCodigoServicio.toString();
    final response = await http.get(Uri.parse(urlquery));
    final data = response.body;
    jsonResultado = data;
    if (data != '') {
      oServicio = Servicio.fromJson(json.decode(data));
    }
    return oServicio;
  }
}
