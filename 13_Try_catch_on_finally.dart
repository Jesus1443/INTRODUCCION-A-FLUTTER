void main() async {
  print('Inicio del programa');
  
  try {
    final value = await httpGet('http://api.jesus.dev');
    print(value);
    
  } on Exception catch(err) {
    print('Tenemos una excepcion: $err');
    
  } catch(err) {
    print('OOPS!! Algo terrible ha pasado!');
    
  } finally {
    print('Fin del try-catch');
  }
  
  print('Final del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 2));
  
  //throw Exception('No hay parametros en la URL');
  throw 'Error en la petición';
    
  //return 'Tenemos un valor!!';
  }
 