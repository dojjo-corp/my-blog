class BlogModel {
  String title;
  String author;
  String content;
  String imgPath;

  BlogModel({
    required this.title,
    required this.author,
    required this.content,
    required this.imgPath,
    int likes = 0,
    List<String> comments = const [],
  });
}

const content =
    'Amet officia et adipisicing reprehenderit. Qui laborum ea sunt et minim aute enim nostrud aliqua anim excepteur eiusmod. Anim elit reprehenderit magna fugiat elit deserunt. Sit exercitation qui elit ex sint ipsum aliquip laboris et. Proident mollit voluptate dolore ad exercitation eu reprehenderit ipsum. Et duis magna ipsum incididunt commodo mollit culpa.';
final blogList = [
  BlogModel(title: 'title_1', author: 'dojjo', content: content, imgPath: 'assets/copywriting.png'),
  BlogModel(title: 'title_2', author: 'joshua', content: content, imgPath: 'assets/influencer (1).png'),
  BlogModel(title: 'title_3', author: 'dojjo', content: content, imgPath: 'assets/influencer (2).png'),
  BlogModel(title: 'title_4', author: 'joshua', content: content, imgPath: 'assets/influencer.png'),
];
