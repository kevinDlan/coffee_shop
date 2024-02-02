class CoffeeDataList {
  static Future<List<Map<String, dynamic>>> fetchCoffee() async {
    return Future.delayed(
        const Duration(milliseconds: 150),
        () => [
              {
                "id": 1,
                "name": "Cappuccino",
                "content": "with Chocolate",
                "price": 4.5,
                "rating": 3.6,
                "image": "assets/coffees/coffe_one.png",
                "category": "cappuccino"
              },
              {
                "id": 2,
                "name": "Cappuccino",
                "content": "with Coffee",
                "price": 3.5,
                "rating": 4.0,
                "image": "assets/coffees/coffe_two.png",
                "category": "cappuccino"
              },
              {
                "id": 3,
                "name": "Cappuccino",
                "content": "with Milk",
                "price": 3.99,
                "rating": 4.9,
                "image": "assets/coffees/cappuccino_1.png",
                "category": "cappuccino"
              },
              {
                "id": 4,
                "name": "Cappuccino",
                "content": "with Chocolate",
                "price": 4.5,
                "rating": 3.6,
                "image": "assets/coffees/cappuccino_mocha.jpg",
                "category": "cappuccino"
              },
              {
                "id": 5,
                "name": "Machiato",
                "content": "with Chocolate",
                "price": 3.5,
                "rating": 2.6,
                "image": "assets/coffees/iced_chocolate_macchiato.png",
                "category": "machiato"
              },
              {
                "id": 6,
                "name": "Machiato",
                "content": "with Chocolate",
                "price": 6.3,
                "rating": 4.3,
                "image": "assets/coffees/hot_espresso_macchiato.jpg",
                "category": "machiato"
              },
              {
                "id": 7,
                "name": "Machiato",
                "content": "with Chocolate",
                "price": 6.0,
                "rating": 4.6,
                "image": "assets/coffees/macchiato_black.png",
                "category": "machiato"
              },
              {
                "id": 8,
                "name": "Machiato Car",
                "content": "with Caramel",
                "price": 5.5,
                "rating": 5.6,
                "image": "assets/coffees/macchiato_caramel.jpg",
                "category": "machiato"
              },
              {
                "id": 9,
                "name": "Chocolate",
                "content": "with Chocolate",
                "price": 5.5,
                "rating": 4.1,
                "image": "assets/coffees/latte_chocolate.jpg",
                "category": "latte"
              },
              {
                "id": 10,
                "name": "Imperial",
                "content": "with Oat Milk",
                "price": 4.5,
                "rating": 3.6,
                "image": "assets/coffees/latte_imperial.jpg",
                "category": "latte"
              },
              {
                "id": 11,
                "name": "Moe",
                "content": "with Chocolate",
                "price": 2.5,
                "rating": 4.2,
                "image": "assets/coffees/latte_moe.jpg",
                "category": "latte"
              },
              {
                "id": 12,
                "name": "White",
                "content": "with Chocolate",
                "price": 4.5,
                "rating": 3.6,
                "image": "assets/coffees/latte_white.jpg",
                "category": "latte"
              },
              {
                "id": 13,
                "name": "Americano",
                "content": "with Chocolate",
                "price": 1.99,
                "rating": 5.99,
                "image": "assets/coffees/americano_coffee_with_milk.jpg",
                "category": "americano"
              },
              {
                "id": 14,
                "name": "Americano",
                "content": "with Coffee",
                "price": 3.5,
                "rating": 3.5,
                "image": "assets/coffees/cafe_americano_portada.jpg",
                "category": "americano"
              },
              {
                "id": 15,
                "name": "Americano",
                "content": "with Coffee",
                "price": 4.5,
                "rating": 3.6,
                "image": "assets/coffees/americano_black.jpg",
                "category": "americano"
              },
              {
                "id": 16,
                "name": "Americano",
                "content": "Pure Coffee",
                "price": 4.5,
                "rating": 3.6,
                "image": "assets/coffees/long_black_americano.jpg",
                "category": "americano"
              },
            ]);
  }
}
