String urlBase = 'http://cibertec202122cf.somee.com';
String controlerCliente = "Cliente";
String controlerProveedor = "Proveedor";
String controlerServicio = "Servicios";
String controlerDocente = "Docente";
String controlerArticulo = "Articulo";

double checkDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else if (value is int) {
    return 0.0 + value;
  } else {
    return value;
  }
}

bool isNumeric(String s) {
  if (s.isEmpty) return false;
  final n = num.tryParse(s);
  return (n == null) ? false : true;
}
