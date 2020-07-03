class Content {
  String en;
  String dutch;

  Content(this.en, this.dutch);
}

class Collection {
  final int id;
  String title;
  bool isLiked;
  final List<Content> content;

  Collection({this.id, this.title, this.isLiked, this.content});

  static List<Collection> fetchAll() {
    return [
      Collection(id: 1, title: "Basic Greetings", isLiked: false, content: [
        Content("Hello", "Hallo"),
        Content("Good Day", "Goedenmorgen")
      ]),
      Collection(id: 2, title: "Numbers", isLiked: false, content: [
        Content("One", "En"),
        Content("Two", "twee"),
        Content("Three", "drie")
      ]),
      Collection(id: 3, title: "Self Introduction", isLiked: false, content: [
        Content("My name is", "Mijn naam is"),
        Content("I am ... years old", "ik ben ... jaar oud")
      ]),
      Collection(id: 4, title: "Date and Time", isLiked: false),
      Collection(id: 5, title: "Transportation", isLiked: false)
    ];
  }

  static fetchByID(int collectionId) {
    //fetch all collections, filter down the specific collection by ID
    List<Collection> collections = fetchAll();
    for (var i = 0; i < collections.length; i++) {
      if (collections[i].id == collectionId) {
        return collections[i];
      }
    }
  }
}
