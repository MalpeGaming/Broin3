import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../your_activities.dart';
import 'book_description.dart';

class Classic extends StatefulWidget {
  const Classic({super.key});

  @override
  State<Classic> createState() => _Classic();
}

class _Classic extends State<Classic> {
  Widget createActivity2(
    BuildContext context,
    String img,
    String txt1,
    String txt2,
    Widget route, {
    double fontSize = 1,
  }) {
    Size size = MediaQuery.of(context).size;
    return createActivity(
      context,
      "attention/reading/$img",
      txt1,
      txt2,
      0.025 * size.height * fontSize,
      route,
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.onPrimary,
      zero: 0.8,
      textWidth: 0.4,
      title: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "CLASSIC",
                  style: TextStyle(
                    fontSize: size.width / 8,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "NOVELS",
                  style: TextStyle(
                    fontSize: size.width / 18,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 0.03 * size.height),
            Expanded(
              child: ListView(
                children: [
                  createActivity2(
                      context,
                      "classic/1984",
                      "1984",
                      "by George Orwell",
                      const BookDescriptionPage(
                        title: "1984",
                        author: "George Orwell",
                        imageName: "covers/1984",
                        audienceReview: "4.5",
                        genre: "Science Fictions",
                        time: "5 h 55 min",
                        description:
                            "1984 tells the futuristic story of a dystopian, totalitarian world where free will and love are forbidden. Although the year 1984 has long since passed, the prophecy of a society controlled by fear and lies is arguably more relevant now than ever.",
                      )),
                  createActivity2(
                    context,
                    "classic/the_lord_of_the_rings",
                    "The Lord of the Rings",
                    "by J.R.R. Tolkien",
                    const BookDescriptionPage(
                      title: "The Lord of the Rings ",
                      author: "J.R.R. Tolkien",
                      imageName: "covers/lord",
                      audienceReview: "4.7",
                      genre: "Fantasy Fiction",
                      time: "12 h",
                      description:
                          "The Lord of the Rings unfolds an epic tale of adventure and the eternal fight against darkness, set in the enchanting world of Middle-earth. Even decades after its publication, the journey of Frodo Baggins to destroy the One Ring remains a compelling testament to the power of friendship, courage, and hope.",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/the_kite_runner",
                    "The Kite Runner",
                    "by Khaled Hosseini",
                    const BookDescriptionPage(
                      title: "The Kite Runner",
                      author: "Khaled Hosseini",
                      imageName: "covers/kiterunner",
                      audienceReview: "4.8",
                      genre: "Novels",
                      time: "7,2 h",
                      description:
                          "The Kite Runner navigates the deep waters of friendship, betrayal, and redemption against the backdrop of Afghanistan’s turbulent history. This narrative, transcending time and geography, speaks to the universal quest for forgiveness and the unbreakable bonds of childhood friendship.",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/harry_potter",
                    "Harry Potter",
                    "by J.K. Rowling",
                    const BookDescriptionPage(
                      title: "Harry Potter and the Philosopher’s Stone",
                      author: "J.K. Rowling",
                      imageName: "covers/harry",
                      audienceReview: "4.8",
                      genre: "Fantasy",
                      time: " 5 h 20 min",
                      description:
                          "Harry Potter and the Philosopher’s Stone introduces a world where magic is real and an orphan boy discovers his identity in a school of witchcraft and wizardry. Years after its release, the magic of Harry's world continues to inspire and teach the importance of friendship and bravery.",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/slaughterhouse",
                    "Slaughterhouse-Five",
                    "by Kurt Vonnegut",
                    const BookDescriptionPage(
                      title: "Slaughterhouse-Five",
                      author: "Kurt Vonnegut",
                      imageName: "covers/slaughterhouse",
                      audienceReview: "4.4",
                      genre: "Science Fiction",
                      time: "3 h 30 min",
                      description:
                          "Slaughterhouse-Five offers a surreal journey through time, exploring the destructiveness of war through the eyes of Billy Pilgrim. Vonnegut’s blend of dark humor and tragic reality remains a poignant reminder of war’s absurdity and its enduring impact on humanity.",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/the_lion_the_witch_and_the_wardrobe",
                    "The Lion, the Witch, and the Wardrobe",
                    "by C.S. Lewis",
                    const BookDescriptionPage(
                      title: "The Lion, the Witch, and the Wardrobe",
                      author: "C.S. Lewis",
                      imageName: "covers/narnia",
                      audienceReview: "4.4",
                      genre: "Fantasy",
                      time: "2 h 40 min",
                      description:
                          "The Lion, the Witch, and the Wardrobe opens the door to the magical land of Narnia, where four siblings embark on a divine quest to end an eternal winter. Lewis’s tale is more than just an adventure; it's a timeless exploration of courage, sacrifice, and the battle between good and evil.",
                    ),
                    fontSize: 0.85,
                  ),
                  createActivity2(
                    context,
                    "classic/to_kill_a_mockingbird",
                    "To Kill a Mockingbird",
                    "by Harper Lee",
                    const BookDescriptionPage(
                      title: "To Kill a Mockingbird",
                      author: "Harper Lee",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/wuthering_heights",
                    "Wuthering Heights",
                    "by Emily Bronte",
                    const BookDescriptionPage(
                      title: "Wuthering Heights",
                      author: "Emily Bronte",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/pride_and_prejudice",
                    "Pride and Prejudice",
                    "by Jane Austen",
                    const BookDescriptionPage(
                      title: "Pride and Prejudice",
                      author: "Jane Austen",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/jane_eyre",
                    "Jane Eyre",
                    "by Charlotte Bronte",
                    const BookDescriptionPage(
                      title: "Jane Eyre",
                      author: "Charlotte Bronte",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/animal_farm",
                    "Animal Farm",
                    "by George Orwell",
                    const BookDescriptionPage(
                      title: "Animal Farm",
                      author: "George Orwell",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/little_women",
                    "Little Women",
                    "by Louisa May Alcott",
                    const BookDescriptionPage(
                      title: "Little Women",
                      author: "Louisa May Alcott",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/frankenstein",
                    "Frankenstein",
                    "by Mary Shelley",
                    const BookDescriptionPage(
                      title: "Frankenstein",
                      author: "Mary Shelley",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/dune",
                    "Dune",
                    "by Frank Herbert",
                    const BookDescriptionPage(
                      title: "Dune",
                      author: "Frank Herbert",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/the_time_machine",
                    "The Time Machine",
                    "by H. G. Wells",
                    const BookDescriptionPage(
                      title: "The Time Machine",
                      author: "H. G. Wells",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/the_martian_chronicles",
                    "The Martian Chronicles",
                    "by Ray Bradbury",
                    const BookDescriptionPage(
                      title: "The Martian Chronicles",
                      author: "Ray Bradbury",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                  createActivity2(
                    context,
                    "classic/discworld",
                    "Discworld",
                    "by Terry Pratchett",
                    const BookDescriptionPage(
                      title: "Discworld",
                      author: "Terry Pratchett",
                      imageName: "covers/harry",
                      audienceReview: "4.5",
                      genre: "Fantasy",
                      time: "7h 5m",
                      description:
                          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
