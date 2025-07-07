class Item {
  final String cname;
  late final String name;
  final double rate;
  final String image;
  final String description;
  final String fact;

  Item({
    required this.cname,
    required this.rate,
    required this.name,
    required this.image,
    required this.description,
    required this.fact,
  });

  get items => null;
}

class Category {
  final String name;
  final String images;
  final List<Item> items;

  Category({required this.name, required this.images, required this.items});
}

final List<Category> categories = [
  Category(
    name: "Fruits",
    images: "assets/images/fruits.png",
    items: [
      Item(
        cname: "Fruits",
        rate: 2,
        name: "Apple",
        image: "assets/images/apple1.PNG",
        description:
            "An apple is a round, edible fruit, a pome, produced by an apple tree (Malus spp.) and known for its sweet or tart flavor, varying colors like red, green, or yellow, and crisp texture. ",
        fact: "Apples are rich in antioxidants and dietary fiber.",
      ),
      Item(
        cname: "Fruits",
        name: "Mango",
        rate: 4,
        image: "assets/images/mango1.png",
        description:
            "A mango is a sweet, tropical stone fruit with a fleshy, yellow to orange-colored pulp, a single large, flattened seed, and a smooth, thin skin that can range in color from green to yellow, red, or a combination. ",
        fact: "Mangoes are rich in vitamin C.",
      ),
    ],
  ),
  Category(
    name: "Vegetables",
    images: "assets/images/vegetables.png",
    items: [
      Item(
        cname: "Vegetables",
        name: "Tomato",
        rate: 3,
        image: "assets/images/tomato.png",
        description:
            "A tomato is a fleshy, usually red, smooth-skinned fruit (botanically a berry) from the nightshade family, often eaten and prepared as a vegetable, and is a good source of vitamins and nutrients. ",
        fact: "Tomatoes are technically a fruit.",
      ),
      Item(
        cname: "Vegetables",
        name: "Onion",
        rate: 1.5,
        image: "assets/images/onion.png",
        description:
            "Onions are a widely cultivated, herbaceous biennial plant (Allium cepa) known for its pungent, edible bulb, which consists of concentric layers of white, fleshy leaf bases. They are a staple in many cuisines and belong to the same family as garlic, leeks, and chives. ",
        fact: "High in iron and protein.",
      ),
      Item(
        cname: "Vegetables",
        name: "potato",
        rate: 2,
        image: "assets/images/potato.png",
        description:
            "Potatoes are starchy, underground tubers, native to the Americas, and a staple food in many parts of the world, belonging to the nightshade family (Solanaceae). ",
        fact: "High in iron.",
      ),
    ],
  ),
];

// class DataRepository {
//   static List<Item> getRecommendedItems() {
//     final List<Item> allItems = [];

//     for (final category in categories) {
//       for (final subCategory in category.items) {
//         allItems.addAll(subCategory.items);
//       }
//     }

//     return allItems.where((item) => item.rate < 3).toList();
//   }
// }

class DataRepository {
  // Fetch all items from categories and subcategories
  static List<Item> getAllItems() {
    final List<Item> allItems = [];
    for (final category in categories) {
      allItems.addAll(category.items);
    }
    return allItems;
  }

  // Filter items with price < 3
  static List<Item> getRecommendedItems() {
    return getAllItems().where((item) => item.rate < 3).toList();
  }
}
//
//
//
// class Catalog {
//   static final List<Itam> products = [
//     Itam(
//         name: "iphone",
//         rate: 999,
//         description: "Apple iphone",
//         fact: "best quality"),
//     Itam(
//         name: "samsung",
//         rate: 888,
//         description: "samsung phone",
//         fact: "best quality"),
//     Itam(
//         name: "vivo",
//         rate: 999,
//         description: "vivo phone",
//         fact: "best quality"),
//     Itam(
//         name: "redmi",
//         rate: 999,
//         description: "redmi phone",
//         fact: "best quality")
//   ];
// }

// class Itam {
//   final String name;
//   final int rate;

//   final String description;
//   final String fact;

//   Itam(
//       {required this.name,
//       required this.rate,
//       required this.description,
//       required this.fact});
// }
