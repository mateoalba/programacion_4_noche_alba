// El tercer parámetro es opcional — puede omitirse al llamar
String construirUrl(String host, String ruta, [int? puerto]) {
  if (puerto != null) {
    return 'https://$host:$puerto$ruta';
  }
  return 'https://$host$ruta';
}

// Con valor por defecto — evita el chequeo de null
String construirUrlV2(String host, String ruta, [int puerto = 443]) {
  return 'https://$host:$puerto$ruta';
}

// required → el parámetro es obligatorio
// sin required → el parámetro es opcional
void configurarServidor({
  required String host,
  required int puerto,
  bool ssl = true,
  int timeoutSeg = 30,
}) {
  final protocolo = ssl ? 'https' : 'http';

  print(
      'Conectando a $protocolo://$host:$puerto (timeout: ${timeoutSeg}s)');
}

void main() {
  print(construirUrl('api.ejemplo.com', '/usuarios'));
  print(construirUrl('api.ejemplo.com', '/usuarios', 8080));
  print(construirUrlV2('api.ejemplo.com', '/productos'));

  // Los nombrados pueden ir en cualquier orden
  configurarServidor(
    host: 'db.miempresa.com',
    puerto: 5432,
    ssl: false,
    timeoutSeg: 60,
  );

  // Solo obligatorios
  configurarServidor(
    host: 'api.miempresa.com',
    puerto: 443,
  );
}