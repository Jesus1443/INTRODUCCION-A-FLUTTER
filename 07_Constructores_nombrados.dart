void main() {
  final Map<String, dynamic> spidermanJson = {
    'name': 'Peter Parker',
    'power': 'Aracnido',
    'isAlive': true
  };
  
  final Map<String, dynamic> wolverineJson = {
    'name': 'Logan',
    'power': 'Regeneracion',
    'isAlive': false
  };
  
  final ironman = Hero(
    name: 'Tony Stark', 
    power: 'Millonario', 
    isAlive: false
  );
  
  final spiderman = Hero(
   name: spidermanJson['name'],
   power: spidermanJson['power'],
   isAlive: spidermanJson['isAlive'],  
  );
  
  final wolverine = Hero.fromJson(wolverineJson);
  
  print(ironman);
  print(spiderman);
  print (wolverine);

}

class Hero{
  
  String name;
  String power;
  bool isAlive;
  
  Hero({
    
  required this.name,
  required this.power,
  required this.isAlive
});
  
  Hero.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      power = json['power'],
      isAlive = json['isAlive'];

@override
  String toString(){
    return '$name, $power - ${isAlive ? 'Yes :)' : 'Nope :('}'; 
  }
}