class Bus {
  final int? id;
  final String? name;
  final String? route;
  final double? rating;
  final String? environment;
  final String? journeyStart;
  final double? price;
  final String? image;
  final String? info;

  const Bus({
    this.id,
    this.name,
    this.route,
    this.rating,
    this.environment,
    this.journeyStart,
    this.price,
    this.image,
    this.info,
  });

  String? formattedPrice() {
    if (price != null) {
      return 'E${price!.toStringAsFixed(2)}'; // Formats price to display two decimal places.
    }
    return null;
  }
}

class BusList {
  static List<Bus> list() {
    const data = <Bus>[
      Bus(
        id: 0,
        name: 'Emavulane Bus Service',
        route: 'Buhleni to Mbabane',
        rating: 5.0,
        environment: 'AC',
        journeyStart: '05 May, 2024',
        price: 98.0,
        image: 'assets/images/bus/1.png',
        info: "Take the bus and be on your way. Smooth sailing every time. Leave the driving to us. Drive with us, it's the best.",
      ),
      Bus(
        id: 1,
        name: 'Zulu Khayalami Bus',
        route: 'Mbabane to Manzini',
        rating: 5.0,
        environment: 'AC',
        journeyStart: '15 Feb, 2024',
        price: 49.0,
        image: 'assets/images/bus/2.png',
        info: "Take the bus and be on your way. Smooth sailing every time. Leave the driving to us. Drive with us, it's the best.",
      ),
      Bus(
        id: 2,
        name: 'Muhle Tours',
        route: 'Mbabane to Nhlangano',
        rating: 5.0,
        environment: 'AC',
        journeyStart: '01 April, 2024',
        price: 199.0,
        image: 'assets/images/bus/3.png',
        info: "Take the bus and be on your way. Smooth sailing every time. Leave the driving to us. Drive with us, it's the best.",
      ),
      Bus(
        id: 3,
        name: 'Classic Bus',
        route: 'Mbabane to Sikhuphe',
        rating: 5.0,
        environment: 'Non-AC',
        journeyStart: '25 Dec, 2021',
        price: 129.0,
        image: 'assets/images/bus/4.png',
        info: "Take the bus and be on your way. Smooth sailing every time. Leave the driving to us. Drive with us, it's the best.",
      ),
    ];
    return data;
  }
}
