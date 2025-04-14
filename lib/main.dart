import 'package:flutter/material.dart';
import 'package:flutter_house/data.dart';
import 'package:flutter_house/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "다방",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
      ),
      home: const House(),
    );
  }
}

class House extends StatefulWidget {
  const House({super.key});

  @override
  State<House> createState() => _HouseState();
}

class _HouseState extends State<House> {
  List<Room> displayedRooms = List.from(rooms);
  String selectedType = '전체';
  bool isAscending = true;
  bool showOnlyFavorites = false;

  void sortByPrice(bool ascending) {
    setState(() {
      isAscending = ascending;
      displayedRooms.sort((a, b) =>
      ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
    });
  }

  void filterByType(String type) {
    setState(() {
      selectedType = type;
      applyFilters();
    });
  }

  void toggleFavoritesView() {
    setState(() {
      showOnlyFavorites = !showOnlyFavorites;
      applyFilters();
    });
  }

  void applyFilters() {
    List<Room> filtered = List.from(rooms);

    if (selectedType != '전체') {
      filtered = filtered.where((room) => room.type == selectedType).toList();
    }

    if (showOnlyFavorites) {
      filtered = filtered.where((room) => room.isFavorite).toList();
    }

    displayedRooms = filtered;
    sortByPrice(isAscending);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "다방",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // 타입 버튼 with fixed width
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,  // Fixed width
                child: ChoiceChip(
                  label: const Text("전체"),
                  selected: selectedType == '전체',
                  onSelected: (_) => filterByType('전체'),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 90,  // Fixed width
                child: ChoiceChip(
                  label: const Text("원룸"),
                  selected: selectedType == '원룸',
                  onSelected: (_) => filterByType('원룸'),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 90,  // Fixed width
                child: ChoiceChip(
                  label: const Text("아파트"),
                  selected: selectedType == '아파트',
                  onSelected: (_) => filterByType('아파트'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 가격 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => sortByPrice(true),
                child: const Text("▲ 가격 낮은 순"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => sortByPrice(false),
                child: const Text("▼ 가격 높은 순"),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 찜한방 버튼
          TextButton(
            onPressed: toggleFavoritesView,
            child: Text(
              showOnlyFavorites ? "전체 보기" : "찜한방",
              style: const TextStyle(color: Colors.pink),
            ),
          ),

          const SizedBox(height: 10),

          // 방 리스트
          Expanded(
            child: ListView.builder(
              itemCount: displayedRooms.length,
              itemBuilder: (context, index) {
                final room = displayedRooms[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(room: room),
                        ),
                      );
                    },
                    leading: Image.asset(room.image,
                        width: 70, fit: BoxFit.cover),
                    title: Text(room.title),
                    subtitle: Text(room.content),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${room.price}원"),
                        IconButton(
                          icon: Icon(
                            room.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                            room.isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              room.isFavorite = !room.isFavorite;
                              if (showOnlyFavorites && !room.isFavorite) {
                                displayedRooms.removeAt(index);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
