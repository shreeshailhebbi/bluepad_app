class Book {
  int id;
  String name;
  String image;
  String description;
  String authorName;
  String releaseDate;
  double price;
  bool favorite;
  String genres;

  Book(
      {this.id,
      this.name,
      this.description,
      this.authorName,
      this.releaseDate,
      this.image,
      this.price,
      this.favorite,
      this.genres});
}

List<Book> getBooks() {
  List<Book> books = List();
  Book book1 = new Book(
      id: 1,
      name: "You'll Never Believe What Happened to Lacey",
      image:
          "https://images-na.ssl-images-amazon.com/images/I/51OBgMVqjBL._SX336_BO1,204,203,200_.jpg",
      description:
          "Every few decades a book is published that changes the lives of its readers forever. The Alchemist is such a book",
      authorName: "Amber Ruffin",
      genres: "Fantasy",
      price: 11.2,
      releaseDate: "2006-01-26",
      favorite: false);
  books.add(book1);
  Book book2 = new Book(
      id: 2,
      name: "I AM Watching You",
      description:
          "How Real Time Businesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "Teresa Driscoll",
      image:
          "https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg",
      genres: "Action and Adventure",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book2);
  Book book3 = new Book(
      id: 3,
      name: "The Four Winds",
      description:
          "How Real Time Businesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "Christian Hanna",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSflVQHazUTLkqbp7TQNd2ACNaif-fdgxjwrw&usqp=CAU",
      genres: "Action and Adventure",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book3);
  Book book4 = new Book(
      id: 4,
      name: "Alice’s Adventures in Wonderland",
      description:
          "Even if you’re not a math geek, you’re probably familiar with the algebraist Charles Dodgson — you just know him his much more famous alter-ego, Lewis Carroll. Unlike Dodgson, Carroll wrote stories that defied logic, twisting it into dreamlike, fantastical shapes: a hookah-smoking caterpillar, a flamingo-filled croquet-ground, a perpetually tardy White Rabbit. The result was Alice's Adventures in Wonderland, which has delighted adults and children alike since it was published over a century and a half ago — and today is recognized as a momentous early foray into the fantasy genre as a whole.",
      authorName: "Lewis Carroll ",
      image:
          "https://m.media-amazon.com/images/I/51MDljSTrTL.jpg",
      genres: "Fantasy",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: false);
  books.add(book4);
  Book book5 = new Book(
      id: 5,
      name: "The King of Elfland’s Daughter",
      description:
          "The King of Elfland’s Daughter is a fairy tale with deep, dark roots — as well as a love story rendered with piercing emotional honesty. It’s also an unlikely immigration novel, about an elfin princess’s attempts to deal with her fractured sense of self as she adjusts to the homeland of her beloved human husband. Another remarkably early entry into the fantasy genre, this book prompted Arthur C. Clarke to name Dunsany as one of the greatest writers of his century, and World Fantasy Award winner Jane Yolen to call him “the great grandfather of us all.”",
      authorName: "Lord Dunsany",
      image:
          "https://images-na.ssl-images-amazon.com/images/I/81xScSMIsSL.jpg",
      genres: "Fantasy",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book5);
  Book book6 = new Book(
      id: 6,
      name: "The Hobbit",
      description:
          "It might be a childhood favorite, but The Hobbit gives adult fantasy readers one of the genre’s most relatable protagonists: a middle-aged homebody who just wants to chill. The iconic Bilbo Baggins speaks to all grownup introverts who like nothing more than a good meal and a cozy chair. But we all hope we’d find Bilbo-like reservoirs of heroism within us — yes, while a career as a Chosen One might be out of reach for us, we can all aspire to be Bilbo Baggins. ",
      authorName: "J.R.R. Tolkien",
      image:
          "https://m.media-amazon.com/images/I/5187PQgDScL.jpg",
      genres: "Fantasy",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book6);
  Book book7 = new Book(
      id: 7,
      name: "It Ends With Us",
      description:
          "New to Boston, small-town girl Lily manages to get gorgeous neurosurgeon Ryle Kincaid to break his no dating rule. But his stubborn ways  make her wonder where that aversion came from. And when an old flame resurfaces, everything she has with Ryle is suddenly thrown into question.\nHow Real Time Businesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "COLLEEN HOOVER",
      image:
          "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1549386174-514wNQ0vMgL.jpg?crop=1.00xw:0.944xh;0,0&resize=768:*",
      genres: "Romance",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: false);
  books.add(book7);
  Book book8= new Book(
      id: 8,
      name: "The Proposal",
      description:
          "You really can't go wrong with any of Jasmine Guillory's fun, romantic romps, but this Reese's Book Club pick is especially great. Freelance writer Nik's boyfriend proposes at a Dodger's game, and the dude can't even spell her name right. She says no (duh), and the video goes viral. Handsome doctor Carlos sweeps her away from the frenzy, but he can't possibly be the real deal. Or can he?  \n New to Boston, small-town girl Lily manages to get gorgeous neurosurgeon Ryle Kincaid to break his no dating rule. But his stubborn ways  make her wonder where that aversion came from. And when an old flame resurfaces, everything she has with Ryle is suddenly thrown into question.\nHow Real Time Businesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "JASMINE GUILLORY",
      image:
          "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1581097994-41FddZoWzL.jpg?crop=1xw:0.999xh;center,top&resize=768:*",
      genres: "Romance",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: false);
  books.add(book8);
  Book book9= new Book(
      id: 9,
      name: "The Hating Game",
      description:
          "If you've ever carried a torch for a coworker (the scandal!) this 2016 novel will speak to you. Ccoworkers Lucy Hutton and her sworn nemesis Joshua Templeman have a rivalry as bitter as they come, especially as they compete for the same promotion. At least, it starts out that way.  \n You really can't go wrong with any of Jasmine Guillory's fun, romantic romps, but this Reese's Book Club pick is especially great. Freelance writer Nik's boyfriend proposes at a Dodger's game, and the dude can't even spell her name right. She says no (duh), and the video goes viral. Handsome doctor Carlos sweeps her away from the frenzy, but he can't possibly be the real deal. Or can he?  \n New to Boston, small-town girl Lily manages to get gorgeous neurosurgeon Ryle Kincaid to break his no dating rule. But his stubborn ways  make her wonder where that aversion came from. And when an old flame resurfaces, everything she has with Ryle is suddenly thrown into question.\nHow Real Time Businesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "SALLY THORNE",
      image:
          "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1549388634-5177RJNUAgL.jpg?crop=1xw:0.996xh;center,top&resize=768:*",
      genres: "Romance",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book9);
  Book book10= new Book(
      id: 10,
      name: "JAMIE MCGUIRE",
      description:
          "Abby Abernathy swears she's going to leave her dark past behind her when she goes to college, becoming the consummate good girl. But all of her best intentions are challenged by tattooed campus bad boy Travis Maddox, who tricks Abby into a month-long bet. The stakes turn out to be higher than either of them realize. If you've ever carried a torch for a coworker (the scandal!) this 2016 novel will speak to you. Ccoworkers Lucy Hutton and her sworn nemesis Joshua Templeman have a rivalry as bitter as they come, especially as they compete for the same promotion. At least, it starts out that way.  \n You really can't go wrong with any of Jasmine Guillory's fun, romantic romps, but this Reese's Book Club pick is especially great. Freelance writer Nik's boyfriend proposes at a Dodger's game, and the dude can't even spell her name right. She says no (duh), and the video goes viral. Handsome doctor Carlos sweeps her away from the frenzy, but he can't possibly be the real deal. Or can he?  \n New to Boston, small-town girl Lily manages to get gorgeous neurosurgeon Ryle Kincaid to break his no dating rule. But his stubborn ways  make her wonder where that aversion came from. And when an old flame resurfaces, everything she has with Ryle is suddenly thrown into question.\nHow Real Time Businesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "SALLY THORNE",
      image:
          "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1549389792-51K1EGCliqL.jpg?crop=0.969xw:0.936xh;0.0155xw,0.0340xh&resize=768:*",
      genres: "Romance",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book10);
  Book book11= new Book(
      id: 11,
      name: "Don Quixote by Miguel de Cervantes",
      description:
          "Regarded as one of the greatest works in literature, Don Quixote recounts the adventures of Alonso Quixano: a middle-aged man so obsessed with chivalric books that he decides to imitate them and become a knight-errant. So begins his journey to find a faithful squire, save damsels in distress, and fight windmills. \n Abby Abernathy swears she's going to leave her dark past behind her when she goes to college, becoming the consummate good girl. But all of her best intentions are challenged by tattooed campus bad boy Travis Maddox, who tricks Abby into a month-long bet. The stakes turn out to be higher than either of them realize. If you've ever carried a torch for a coworker (the scandal!) this 2016 novel will speak to you. Ccoworkers Lucy Hutton and her sworn nemesis Joshua Templeman have a rivalry as bitter as they come, especially as they compete for the same promotion. At least, it starts out that way.  \n You really can't go wrong with any of Jasmine Guillory's fun, romantic romps, but this Reese's Book Club pick is especially great. Freelance writer Nik's boyfriend proposes at a Dodger's game, and the dude can't even spell her name right. She says no (duh), and the video goes viral. Handsome doctor Kincaid to break his no dating rule. But his stubborn ways  make her wonder where that aversion came from. And when an old flame resurfaces, everything she has with Ryle is suddenly thrown into question.\nHow Real Time Businesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "SALLY THORNE",
      image:
          "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546112331l/3836.jpg",
      genres: "Action and Adventure",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book11);
  Book book12= new Book(
      id: 12,
      name: "The Three Musketeers",
      description:
          "n this classic by Dumas, a young man named d’Artagnan joins the Musketeers of the Guard. In doing so, he befriends Athos, Porthos, and Aramis — the King’s most celebrated musketeers — and embarks on a journey of his own. \n Regarded as one of the greatest works in literature, Don Quixote recounts the adventures of Alonso Quixano: a middle-aged man so obsessed with chivalric books that he decides to imitate them and become a knight-errant. So begins his journey to find a faithful squire, save damsels in distress, and fight windmills. \n Abby Abernathy swears she's going to leave her dark past behind her when she goes to college, becoming the consummate good girl. But all of her best intentions are challenged by tattooed campus bad boy Travis Maddox, who tricks Abby into a month-long bet. The stakes turn out to be higher than either of them realize. If you've ever carried a torch for a coworker (the scandal!) this 2016 novel will speak to you. Ccoworkers Lucy Hutton and her sworn nemesis Joshua Templeman have a rivalry as bitter as they come, especially as they compete for the same promotion. At least, it starts out that way.  \n You and the dude can't even spell her name right. She says no (duh), and the video goes viral. Handsome doctor Carlos sweeps her away from the frenzy, but he can't possibly be the real deal. Or can he?  \n New to Boston, small-town girl Lily manages to get gorgeous neurosurgeon Ryle Kincaid to break his no dating rule. But his stubborn ways  make her wonder where that aversion came from. And when an old flame resurfaces, everything she has with Ryle is suddenly thrown and Beat the Competition",
      authorName: "Alexandre Dumas",
      image:
          "https://m.media-amazon.com/images/I/51UJsfRHTRL.jpg",
      genres: "Action and Adventure",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: false);
  books.add(book12);
  Book book13= new Book(
      id: 12,
      name: "Treasure Island",
      description:
          "Written by Scottish author Robert Louis Stevenson, this story of “buccaneers and buried gold” launched a million tropes of treasure maps, sea chests, Black Spots, and deserted islands \n usinesses Anticipate Customer Needs, Create Opportunities, and Beat the Competition",
      authorName: "Robert Louis Stevenson",
      image:
          "https://m.media-amazon.com/images/I/61Nvv+LTdeL.jpg",
      genres: "Action and Adventure",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: false);
  books.add(book13);
  Book book14= new Book(
      id: 14,
      name: "Journey to the Center of the Earth ",
      description:
          "Journey to the Center of the Earth is exactly that: a trip to the inside of the world, which is where German professor Otto Lidenbrock theorizes that volcanic tubes will lead. Another one of Jules Verne’s magnum opuses — and one of the most famous examples of subterranean fiction.",
      authorName: "Jules Verne",
      image:
          "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328864746l/1086164.jpg",
      genres: "Action and Adventure",
      price: 15.99,
      releaseDate: "2006-01-26",
      favorite: true);
  books.add(book14);
  return books;
}
