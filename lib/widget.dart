import 'dart:ui';

import 'package:flutter/material.dart';

class ParticularBtn extends StatelessWidget {
  const ParticularBtn(
      {super.key, required this.title, required this.color, this.size = 150});

  final String title;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      ),
      ElevatedButton(
        // add blur effet to background
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          elevation: MaterialStateProperty.all<double>(10),
          shadowColor: MaterialStateProperty.all<Color>(color),
          fixedSize: MaterialStateProperty.all<Size>(Size(size, 50)),
        ),

        onPressed: () {
          // Respond to button press
        },
        child: Text(title),
      ),
    ]);
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ListView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: const [
                ParticularBtn(title: 'Littérature', color: Colors.red),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Science', color: Colors.yellow),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Art', color: Colors.blue),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Littérature', color: Colors.purple),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Science', color: Colors.purpleAccent),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Art', color: Colors.green),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Littérature', color: Colors.yellow),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Science', color: Colors.greenAccent),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Art', color: Colors.red),
                SizedBox(
                  width: 20,
                ),
                ParticularBtn(title: 'Littérature', color: Colors.red),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // TODO: Add listwiew in container
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Book();
                        },
                      ),
                    ),
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(
                            "https://images.pexels.com/photos/5084674/pexels-photo-5084674.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "E-book Ergonomie",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          // TODO: Add listwiew in container
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Book();
                        },
                      ),
                    ),
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(
                            "https://images.pexels.com/photos/256450/pexels-photo-256450.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "E-book Ergonomie",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class BookFinder extends StatefulWidget {
  const BookFinder({super.key});

  @override
  State<BookFinder> createState() => _BookFinderState();
}

class _BookFinderState extends State<BookFinder> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchResult = [
    "Ergonomie",
    "Design",
    "Science",
    "Littérature",
    "Art",
  ];

  final List<String> _books = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController.addListener(_search);
  }

  void _search() {
    debugPrint(_searchController.text);
    setState(() {
      Set<String> uniqueBooks = Set.from(_searchResult);
      _books.clear();
      _books.addAll(uniqueBooks
          .where((element) => element.contains(_searchController.text)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [Icon(Icons.search), Text("BookFinder")],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                color: Colors.transparent,
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _books.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (_books.isEmpty) {
                        return const Text(
                          "No result found",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return Text(
                        _books[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://images.pexels.com/photos/5084674/pexels-photo-5084674.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 300,
            opacity: Tween<double>(begin: 0.5, end: 0.5).animate(
              CurvedAnimation(
                parent: const AlwaysStoppedAnimation(1),
                curve: const Interval(0.5, 1, curve: Curves.easeInOut),
              ),
            ),
          ),
          const SizedBox(
            height: 220,
          ),
          const Text(
            "Ergonomie",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Description : Ergonomie est un livre qui parle de l'ergonomie. Il est très intéressant et très utile pour les étudiants en informatique.",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      Positioned(
        top: 20,
        left: 20,
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      Positioned(
        top: 200,
        child: Image.network(
          "https://images.pexels.com/photos/5084674/pexels-photo-5084674.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          fit: BoxFit.cover,
          width: 300,
          height: 300,
        ),
      )
    ]));
  }
}

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "ADMIN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddBook();
                    },
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    ParticularBtn(
                      title: "Ajouter un livre",
                      color: Colors.red,
                      size: 300,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const EditBook();
                    },
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit),
                    ParticularBtn(
                      title: "Modifier un livre",
                      color: Colors.blue,
                      size: 300,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const InfoBook();
                    },
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info),
                    ParticularBtn(
                      title: "Info sur un livre",
                      color: Colors.yellow,
                      size: 300,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.follow_the_signs),
                  ParticularBtn(
                    title: "Suivie des emprunts",
                    color: Colors.green,
                    size: 300,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class AddBook extends StatelessWidget {
  const AddBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un livre"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Titre",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Auteur",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Categorie",
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Code d'identification",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ParticularBtn(title: "Créer", color: Colors.yellow)
          ],
        ),
      ),
    );
  }
}

class EditBook extends StatefulWidget {
  const EditBook({super.key});

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _auteurController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _titreController.text = "Ergonomie";
      _auteurController.text = "AYENI Georges";
      _categorieController.text = "Science";
      _codeController.text = "123456789";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier un livre"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titreController,
              decoration: const InputDecoration(
                labelText: "Titre",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _auteurController,
              decoration: const InputDecoration(
                labelText: "Auteur",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _categorieController,
              decoration: const InputDecoration(
                labelText: "Categorie",
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(
                labelText: "Code d'identification",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Spacer(),
                ParticularBtn(title: "Modifier", color: Colors.blue),
                SizedBox(
                  width: 10,
                ),
                ParticularBtn(title: "Supprimer", color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InfoBook extends StatelessWidget {
  const InfoBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info sur un livre"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              child: Image.network(
                "https://img.freepik.com/psd-gratuit/illustration-code-barres-isolee_23-2150584086.jpg?size=626&ext=jpg&ga=GA1.1.1292351815.1709856000&semt=ais",
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ParticularBtn(title: "Scanner le code", color: Colors.yellow),
            const SizedBox(
              height: 20,
            ),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text("Titre"),
                    subtitle: Text("Ergonomie"),
                  ),
                  ListTile(
                    title: Text("Auteur"),
                    subtitle: Text("Jean Dupont"),
                  ),
                  ListTile(
                    title: Text("Categorie"),
                    subtitle: Text("Science"),
                  ),
                  ListTile(
                    title: Text("Code d'identification"),
                    subtitle: Text("123456789"),
                  ),
                  ListTile(
                    title: Text("Statut"),
                    subtitle: Text("Disponible"),
                    textColor: Colors.green,
                  ),
                  ListTile(
                    title: Text("Localistation"),
                    subtitle: Text("Etage 1 / Rangée 1 / Rang 2"),
                    textColor: Colors.red,
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
