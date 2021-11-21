class Servicio {
  int? codigoServicio;
  String? nombreCliente;
  String? numeroOrdenServicio;
  String? fechaProgramada;
  String? linea;
  String? estado;
  String? observaciones;
  bool? eliminado;
  int? codigoError;
  String? descripcionError;
  String? mensajeError;

  Servicio(
      {this.codigoServicio,
      this.nombreCliente,
      this.numeroOrdenServicio,
      this.fechaProgramada,
      this.linea,
      this.estado,
      this.observaciones,
      this.eliminado,
      this.codigoError,
      this.descripcionError,
      this.mensajeError});

  Servicio.fromJson(Map<String, dynamic> json) {
    codigoServicio = json['CodigoServicio'];
    nombreCliente = json['NombreCliente'];
    numeroOrdenServicio = json['NumeroOrdenServicio'];
    fechaProgramada = json['FechaProgramada'];
    linea = json['Linea'];
    estado = json['Estado'];
    observaciones = json['Observaciones'];
    eliminado = json['Eliminado'];
    codigoError = json['CodigoError'];
    descripcionError = json['DescripcionError'];
    mensajeError = json['MensajeError'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CodigoServicio'] = codigoServicio;
    data['NombreCliente'] = nombreCliente;
    data['NumeroOrdenServicio'] = numeroOrdenServicio;
    data['FechaProgramada'] = fechaProgramada;
    data['Linea'] = linea;
    data['Estado'] = estado;
    data['Observaciones'] = observaciones;
    data['Eliminado'] = eliminado;
    data['CodigoError'] = codigoError;
    data['DescripcionError'] = descripcionError;
    data['MensajeError'] = mensajeError;
    return data;
  }

  void inicializar() {
    codigoServicio = 0;
    nombreCliente = "";
    numeroOrdenServicio = "";
    fechaProgramada = "";
    linea = "";
    estado = "";
    observaciones = "";
    eliminado = false;
    codigoError = 0;
    descripcionError = "";
    mensajeError = "";
  }

  String toParameter() {
    return "CodigoServicio=${codigoServicio.toString()}" +
        "&NombreCliente=${nombreCliente.toString()}" +
        "&NumeroOrdenServicio=${numeroOrdenServicio.toString()}" +
        "&FechaProgramada=${fechaProgramada.toString()}" +
        "&Linea=${linea.toString()}" +
        "&Estado=${estado.toString()}" +
        "&Observaciones=${observaciones.toString()}";
  }

  String toModelString() {
    return '{"CodigoServicio":"${codigoServicio.toString()}",' +
        '"NombreCliente":"${nombreCliente.toString()}",' +
        '"NumeroOrdenServicio":"${numeroOrdenServicio.toString()}",' +
        '"FechaProgramada":"${fechaProgramada.toString()}",' +
        '"Linea":"${linea.toString()}",' +
        '"Estado":"${estado.toString()}",' +
        '"Observaciones":"${observaciones.toString()}"' +
        '}';
  }
}
