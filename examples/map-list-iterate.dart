// MAP and LIST

List<Map<String, dynamic>> getUsers() {
  return [
    {
      "gender": "male",
      "name": {"title": "Mr", "first": "Álvaro", "last": "Martínez"},
      "location": {
        "street": {"number": 6724, "name": "Avenida de La Albufera"},
        "city": "Cuenca",
        "state": "Región de Murcia",
        "country": "Spain",
        "postcode": 31394,
        "coordinates": {"latitude": "-34.0060", "longitude": "-176.7084"},
        "timezone": {
          "offset": "-6:00",
          "description": "Central Time (US & Canada), Mexico City"
        }
      },
      "email": "alvaro.martinez@example.com",
      "login": {
        "uuid": "183a23f3-58e0-4db3-bd4e-857999909e32",
        "username": "crazytiger562",
        "password": "smokie",
        "salt": "vF6bYSmT",
        "md5": "e88cd27e517c41ae54b32e6509beb7c6",
        "sha1": "9027ff02a14a0e24314b82dfb0af83baea832886",
        "sha256":
            "b2005e7832e34d2c73ffc75252b4b80095c4de950221bf212fafa64b0e005138"
      },
      "dob": {"date": "1964-08-17T09:31:59.133Z", "age": 60},
      "registered": {"date": "2011-08-15T00:33:31.998Z", "age": 13},
      "phone": "955-606-921",
      "cell": "600-593-703",
      "id": {"name": "DNI", "value": "31194530-T"},
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/59.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/59.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/59.jpg"
      },
      "nat": "ES"
    },
    {
      "gender": "male",
      "name": {"title": "Mr", "first": "Agostinho", "last": "Nunes"},
      "location": {
        "street": {"number": 5642, "name": "Rua Dom Pedro Ii "},
        "city": "Parnaíba",
        "state": "Rio Grande do Norte",
        "country": "Brazil",
        "postcode": 25828,
        "coordinates": {"latitude": "-89.9361", "longitude": "-177.4022"},
        "timezone": {
          "offset": "+5:30",
          "description": "Bombay, Calcutta, Madras, New Delhi"
        }
      },
      "email": "agostinho.nunes@example.com",
      "login": {
        "uuid": "9f5b1551-2e78-450c-970b-b94ab2b189ae",
        "username": "beautifulcat558",
        "password": "studly",
        "salt": "TgHKN3Ul",
        "md5": "d611517869a516b62e6a4123dba865da",
        "sha1": "79c7cef45178c0f7ebc84480baf7ea6d8e05f159",
        "sha256":
            "0d529eb7edf449358ea8fd2416b2f93eac27bb5fc395b9b0b917f79d06fa24c6"
      },
      "dob": {"date": "1981-09-27T18:38:31.178Z", "age": 42},
      "registered": {"date": "2014-12-04T05:27:21.028Z", "age": 9},
      "phone": "(69) 4462-3013",
      "cell": "(88) 8431-0003",
      "id": {"name": "CPF", "value": "026.994.282-38"},
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/58.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/58.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/58.jpg"
      },
      "nat": "BR"
    }
  ];
}

// List numbers = [1,2,4];

// print(numbers); // [1,2,4]
// print(numbers[0]); // 1

void isValidUser(
  Map<String, String> credential,
  List<Map<String, dynamic>> users, 
  int a,
  int b,
  int c,
  int d,
  String name,
  double weight)
{
  
  print(credential);
  print(users);
  print(name);
  
}

void main() {
  List<Map<String, dynamic>> users =
      getUsers(); // no arguments for getUsers function

  List<Map<String, String>> usersCredentials = [
    {
      "username": "crazytiger562",
      "password": "smokie",
    },
  ];
  print(usersCredentials);
  print(usersCredentials[0]);

  for (int i = 0; i < usersCredentials.length; i++) {
    isValidUser(usersCredentials[i], users, 1, 2, 3, 4, 'raju', 50.400); // 8 arugments
  }
  ;
}
