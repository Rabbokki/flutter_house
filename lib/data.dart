class Room {
  final int id;
  final String title;
  final String image;
  final String content;
  final String type;
  final int price;
  bool isFavorite;

  Room({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.type,
    required this.price,
    this.isFavorite = false
  });
}

final List<Room> rooms = [
  Room(
    id: 0,
    title: "Sinrim station 30 meters away",
    image: "images/room0.jpg",
    content: "18년 신축공사한 남향 원룸 ☀️, 공기청정기 제공",
    type: "원룸",
    price: 340000,
  ),
  Room(
    id: 1,
    title: "Changdong Aurora Bedroom(Queen-size)",
    image: "images/room1.jpg",
    content: "침실만 따로 있는 공용 셰어하우스입니다. 최대 2인 가능",
    type: "원룸",
    price: 450000,
  ),
  Room(
    id: 2,
    title: "Geumsan Apartment Flat",
    image: "images/room2.jpg",
    content: "금산오거리 역세권 아파트입니다. 애완동물 불가능 ?",
    type: "아파트",
    price: 780000,
  ),
  Room(
    id: 3,
    title: "Double styled beds Studio Apt",
    image: "images/room3.jpg",
    content: "무암동인근 2인용 원룸입니다. 전세 전환가능",
    type: "아파트",
    price: 550000,
  ),
  Room(
    id: 4,
    title: "MyeongIl Apartment flat",
    image: "images/room4.jpg",
    content: "탄천동 아파트 월세, 남향, 역 5분거리, 허위매물아님",
    type: "아파트",
    price: 680000,
  ),
  Room(
    id: 5,
    title: "Banziha One Room",
    image: "images/room5.jpg",
    content: "반지하 원룸입니다. 비올 때 물가끔 새는거 빼면 좋아요",
    type: "원룸",
    price: 370000,
  ),
];