class Food {
  final String name;
  final String description;
  final int price;
  final List direction;
  final List ingredient;
  final String image;
  final int kcal;
  final int ratings;
  final int servingNumber;
  final String servingTime;
  final int typeOfFood;
  final String toServe;
  final String uid;
  final int quantity;

  const Food({
    this.uid = '',
    this.quantity = 0,
    required this.servingTime,
    required this.name,
    required this.description,
    required this.direction,
    required this.ingredient,
    required this.image,
    required this.kcal,
    required this.ratings,
    required this.servingNumber,
    required this.typeOfFood,
    required this.toServe,
    required this.price,
  });

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'],
      description: map['description'],
      direction: map['direction'],
      ingredient: map['ingredient'],
      image: map['image'],
      kcal: map['kcal'],
      ratings: map['ratings'],
      servingNumber: map['servingNumber'],
      typeOfFood: map['typeOfFood'],
      toServe: map['toServe'],
      servingTime: map['servingTime'],
      uid: map['uid'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'direction': direction,
      'ingredient': ingredient,
      'image': image,
      'kcal': kcal,
      'ratings': ratings,
      'servingNumber': servingNumber,
      'typeOfFood': typeOfFood,
      'toServe': toServe,
      'servingTime': servingTime,
      'uid': uid,
      'price': price,
      'quantity': quantity,
    };
  }

  Food copyWith({
    String? name,
    String? description,
    int? price,
    List? direction,
    List? ingredient,
    String? image,
    int? kcal,
    int? ratings,
    int? servingNumber,
    String? servingTime,
    int? typeOfFood,
    String? toServe,
    String? uid,
    int? quantity,
  }) {
    return Food(
      name: name ?? this.name,
      description: description ?? this.description,
      direction: direction ?? this.direction,
      ingredient: ingredient ?? this.ingredient,
      image: image ?? this.image,
      kcal: kcal ?? this.kcal,
      ratings: ratings ?? this.ratings,
      servingNumber: servingNumber ?? this.servingNumber,
      typeOfFood: typeOfFood ?? this.typeOfFood,
      toServe: toServe ?? this.toServe,
      uid: uid ?? this.uid,
      servingTime: servingTime ?? this.servingTime,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
