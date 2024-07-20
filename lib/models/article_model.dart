import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt,
  });

  static List<Article> articles = [
    Article(
      id: '1',
      title: 'CAPTURE THE FLAG',
      subtitle:
          'No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en',
      body:
          'Sharpen your cybersecurity skills and compete in a thrilling Capture The Flag event! The event will be conducted by IEEE Computer Society i the adrenaline-pumping challenge and win exciting prizes as well as activity points',
      author: 'IEEE',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 1204,
      imageUrl: 'assets/images/CTF_image.png',
      category: 'Workshops',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '2',
      title: 'Ascendio 6.0',
      subtitle: 'Ascendio 6.0: Where Innovation Ascends!',
      body: 'Dont miss this oppurtunity.Register soon ',
      author: 'Elizebath',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 1204,
      imageUrl: 'assets/images/IEE_logo.png',
      category: 'competitions',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '3',
      title:
          'Hackfest 2024 - Regional Round at Amal Jyothi College of Engineering , Kottayam',
      subtitle:
          'No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en',
      body:
          'Embrace innovation at Hackfest 2024,hosted by AJCE,Kottayum,starting at 9am!,Unleash your teachprowess,pitch groundbreaking ideads, and open to glory',
      author: 'IEEE',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 104,
      imageUrl: 'assets/images/hackathons-work_image.png',
      category: 'Art',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
    Article(
      id: '4',
      title: 'IEEE memebership Renewal with EMBS membership',
      subtitle: 'You are never too old to set another goal',
      body:
          'Follow these steps: 1.Add IEEE membership to cart 2.Add Engineering in Medicine and Biology Society to cart.Change from Preferred to Essential membership 3.In payment tab, enter promo code EMBSSTU24 4.Proceed to checkout ',
      author: 'Sonal Iyyan',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 104,
      imageUrl: 'assets/images/IEE_EXAM.jpg',
      category: 'Examinations',
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    Article(
      id: '5',
      title: 'SPECTROSPECT',
      subtitle: 'Workshop for juniors',
      body:
          'Stay tuned for the revamped schedule! Your safety and enjoyment are our priorities, and we are committed to delivering an event that surpasses expectations.Thanks for your understanding, and let us make the rescheduled event even more spectacular! ',
      author: 'IEEE SB',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 1204,
      imageUrl: 'assets/images/artificial-intelligence-workshop.jpg',
      category: 'Art',
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    Article(
      id: '6',
      title: 'HACKATHON',
      subtitle: 'Workshop',
      body:
          'Stay tuned for the revamped schedule! Your safety and enjoyment are our priorities, and we are committed to delivering an event that surpasses expectations.Thanks for your understanding, and let us make the rescheduled event even more spectacular! ',
      author: 'IEEE',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 104,
      imageUrl: 'assets/images/IEESignalhackathon.jpeg',
      category: 'Workshop',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    Article(
      id: '7',
      title: 'INTERNAL EXAMS FOR S7',
      subtitle: 'Examination',
      body:
          'Exams for S7 computer science students will commense from may 26th ',
      author: 'Hod',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 104,
      imageUrl: 'assets/images/C24-Mock-Exams-Nov-21.webp',
      category: 'Examination',
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    Article(
      id: '8',
      title: 'Design Clash',
      subtitle: 'design comptetion',
      body:
          'Stay tuned for the revamped schedule! Your safety and enjoyment are our priorities, and we are committed to delivering an event that surpasses expectations.Thanks for your understanding, and let us make the rescheduled event even more spectacular! ',
      author: 'IEEE SB',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 10,
      imageUrl: 'assets/images/design-process.avif',
      category: 'Competition',
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    Article(
      id: '9',
      title: 'Reactify',
      subtitle: 'Your path to web development mastery',
      body:
          'Stay tuned for the revamped schedule! Your safety and enjoyment are our priorities, and we are committed to delivering an event that surpasses expectations.Thanks for your understanding, and let us make the rescheduled event even more spectacular! ',
      author: 'IEEE SB',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 1204,
      imageUrl: 'assets/images/vipanchika.jpg',
      category: 'Workshop',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    Article(
      id: '10',
      title: 'Pieverse:Design',
      subtitle: 'Competition',
      body:
          'Stay tuned for the revamped schedule! Your safety and enjoyment are our priorities, and we are committed to delivering an event that surpasses expectations.Thanks for your understanding, and let us make the rescheduled event even more spectacular! ',
      author: 'IEEE SB',
      authorImageUrl: 'assets/images/black-woman-withlaptop.jpg',
      views: 1204,
      imageUrl: 'assets/images/brainstorm.jpg',
      category: 'Art',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        createdAt,
      ];
}
