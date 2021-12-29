class OnboardingContent {
  late String image;
  late String title;
  late String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: "assets/images/travelers.json",
      title: "Merhaba",
      description:
          "Şehir tanıtım uygulamasına hoşgeldin! \n Burada şehir ve şehirin önde gelen kişileri hakkında önemli bilgilere ulaşabilirsin. Haydi başlayalım!"),
  OnboardingContent(
      image: "assets/images/travelers2.json",
      title: "Tarihini öğren!",
      description:
          "Şehirde bulunan tarihi kişilikleri ziyaret et ve tarihe yüz tutmuş bilgileri öğren!"),
  OnboardingContent(
      image: "assets/images/travelers3.json",
      title: "Önemli yerleri ziyaret et!",
      description:
          "Şehirde bulunan önemli yerleri ziyaret et ve tarihini daha iyi öğren! \n Bulunan türbelerin lokasyonlarını öğren, sana uygun en kısa yoldan buraya ulaş."),
];
