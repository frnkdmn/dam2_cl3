import 'package:flutter/material.dart';
import '../models/servicio_model.dart';
import '../providers/servicio_provider.dart';

class NuevoVEN_Servicio extends StatefulWidget {
  String titulo;
  Servicio oServicio = Servicio();
  final _provider = VEN_ServicioProvider();
  int codigoVEN_ServicioSeleccionado = 0;
  String mensaje = "";
  bool validacion = false;
  NuevoVEN_Servicio(this.titulo, this.codigoVEN_ServicioSeleccionado);
  @override
  _NuevoVEN_Servicio createState() => _NuevoVEN_Servicio();
}

class _NuevoVEN_Servicio extends State<NuevoVEN_Servicio> {
  final _tfNombreCliente = TextEditingController();
  final _tfNumeroOrdenServicio = TextEditingController();
  final _tfFechaProgramada = TextEditingController();
  final _tfLinea = TextEditingController();
  final _tfEstado = TextEditingController();
  final _tfObservaciones = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.oServicio.inicializar();
    if (widget.codigoVEN_ServicioSeleccionado > 0) {
      _listarKeyProvider();
    }
  }

  Future<String> _listarKeyProvider() async {
    Servicio oServicioModel = Servicio();
    oServicioModel.inicializar();
    var oServicioModeltmp =
        await widget._provider.listarKey(widget.codigoVEN_ServicioSeleccionado);

    // ignore: avoid_print
    print(oServicioModeltmp);
    setState(() {
      widget.oServicio = oServicioModeltmp;
      if (widget.oServicio.codigoServicio! > 0) {
        widget.mensaje = "Estas actualizando los datos";
        _mostrarDatos();
      }
    });
    return "Procesado";
  }

  void _mostrarDatos() {
    _tfNombreCliente.text = widget.oServicio.nombreCliente.toString();
    _tfNumeroOrdenServicio.text =
        widget.oServicio.numeroOrdenServicio.toString();
    _tfFechaProgramada.text = widget.oServicio.fechaProgramada.toString();
    _tfLinea.text = widget.oServicio.linea.toString();
    _tfEstado.text = widget.oServicio.estado.toString();
    _tfObservaciones.text = widget.oServicio.observaciones.toString();
  }

  void _cargarEntidad() {
    widget.oServicio.nombreCliente = _tfNombreCliente.text;
    widget.oServicio.numeroOrdenServicio = _tfNumeroOrdenServicio.text;
    widget.oServicio.fechaProgramada = _tfFechaProgramada.text;
    widget.oServicio.linea = _tfLinea.text;
    widget.oServicio.estado = _tfEstado.text;
    widget.oServicio.observaciones = _tfObservaciones.text;
  }

  bool _validarRegistro() {
    if (_tfNombreCliente.text.toString() == "") {
      widget.validacion = false;
      setState(() {
        widget.mensaje = "Falta completar NombreCliente ";
      });
      return false;
    }
    if (_tfNumeroOrdenServicio.text.toString() == "") {
      widget.validacion = false;
      setState(() {
        widget.mensaje = "Falta completar NumeroOrdenServicio ";
      });
      return false;
    }
    if (_tfFechaProgramada.text.toString() == "") {
      widget.validacion = false;
      setState(() {
        widget.mensaje = "Falta completar FechaProgramada ";
      });
      return false;
    }
    if (_tfLinea.text.toString() == "") {
      widget.validacion = false;
      setState(() {
        widget.mensaje = "Falta completar Linea ";
      });
      return false;
    }
    if (_tfEstado.text.toString() == "") {
      widget.validacion = false;
      setState(() {
        widget.mensaje = "Falta completar Estado ";
      });
      return false;
    }
    if (_tfObservaciones.text.toString() == "") {
      widget.validacion = false;
      setState(() {
        widget.mensaje = "Falta completar Observaciones ";
      });
      return false;
    }
    return true;
  }

  void _grabarRegistro() {
    if (_validarRegistro()) {
      _ejecutar_ServicioGrabadoProvider();
    }
  }

  // ignore: non_constant_identifier_names
  Future<String> _ejecutar_ServicioGrabadoProvider() async {
    String accion = "N";
    if (widget.oServicio.codigoServicio! > 0) {
      accion = "A";
    }
    _cargarEntidad();
    Servicio oServicioModeltmp = Servicio();
    oServicioModeltmp.inicializar();
    var oServicioModeltmpReg =
        await widget._provider.registraModifica(widget.oServicio, accion);
    // ignore: avoid_print
    print(oServicioModeltmpReg);
    setState(() {
      widget.oServicio = oServicioModeltmpReg;
      if (widget.oServicio.codigoServicio! > 0) {
        widget.mensaje = "Grabado correctamente";
      }
      // ignore: avoid_print
      print(widget.oServicio);
    });
    return "Procesado";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registro de Servicios " + widget.titulo),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: _grabarRegistro),
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(" Código de Servicio:" +
                  widget.oServicio.codigoServicio.toString()),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: _tfNombreCliente,
                      decoration: const InputDecoration(
                        hintText: "Ingrese NombreCliente ",
                        labelText: "NombreCliente",
                      )),
                  TextField(
                      controller: _tfNumeroOrdenServicio,
                      decoration: const InputDecoration(
                        hintText: "Ingrese NumeroOrdenServicio ",
                        labelText: "NumeroOrdenServicio",
                      )),
                  TextField(
                      controller: _tfFechaProgramada,
                      decoration: const InputDecoration(
                        hintText: "Ingrese FechaProgramada ",
                        labelText: "FechaProgramada",
                      )),
                  TextField(
                      controller: _tfLinea,
                      decoration: const InputDecoration(
                        hintText: "Ingrese Linea ",
                        labelText: "Linea",
                      )),
                  TextField(
                      controller: _tfEstado,
                      decoration: const InputDecoration(
                        hintText: "Ingrese Estado ",
                        labelText: "Estado",
                      )),
                  TextField(
                      controller: _tfObservaciones,
                      decoration: const InputDecoration(
                        hintText: "Ingrese Observaciones ",
                        labelText: "Observaciones",
                      )),
                  Text("Mensaje:" + widget.mensaje),
                ],
              ),
            )
          ],
        ));
  }
}
