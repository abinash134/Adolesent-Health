class Dashboardmodel {
  String? name;
  String? imageUrl;

  Dashboardmodel({this.name, this.imageUrl});

  static List<Dashboardmodel> dashboardforchildren = [
    Dashboardmodel(
      name: "Teenage Maternity",
      imageUrl: "assests/images/pregnancy.png",
    ),
    Dashboardmodel(
      name: "HIV & STDs",
      imageUrl: "assests/images/hiv.png",
    ),
    Dashboardmodel(
      name: "Mental Health",
      imageUrl: "assests/images/mental_helth.png",
    ),
    Dashboardmodel(
      name: "Violence",
      imageUrl: "assests/images/violence.png",
    ),
    Dashboardmodel(
      name: "Alcohol & drug",
      imageUrl: "assests/images/flame-whisky.png",
    ),
    Dashboardmodel(
      name: "Injuries",
      imageUrl: "assests/images/injury.png",
    ),
    Dashboardmodel(
      name: "Malnutrition",
      imageUrl: "assests/images/malnutrition.png",
    ),
    Dashboardmodel(
      name: "Lack of Exercise",
      imageUrl: "assests/images/lack_of_exercise.png",
    ),
    Dashboardmodel(
      name: "Tobacoo Use",
      imageUrl: "assests/images/icons8-cigar-96.png",
    ),
    Dashboardmodel(
      name: "Extra Info",
      imageUrl: "assests/images/icons8-info-96.png",
    ),
  ];

  static List<Dashboardmodel> dashboardforparent = [
    Dashboardmodel(
      name: "Teenage Maternity",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "HIV & STDs",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "Mental Health",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "Violence",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "Alcohol & drug",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "Injuries",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "Malnutrition",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "Lack of Exercise",
      imageUrl: "",
    ),
    Dashboardmodel(
      name: "Tobacoo Use",
      imageUrl: "",
    ),
  ];

  static List<Dashboardmodel> badpagecontents = [
    Dashboardmodel(
      name: "Tobacco Use",
      imageUrl: "assests/images/icons8-cigar-96.png",
    ),
    Dashboardmodel(
      name: "Eating Junk Food",
      imageUrl: "assests/images/conifer-hamburger.png",
    ),
  ];
  static List<Dashboardmodel> extrainfocontent = [
    Dashboardmodel(
      name: "NGO",
      imageUrl: "assests/images/ngo mage.jpg",
    ),
    Dashboardmodel(
      name: "NGO for LGBTQ",
      imageUrl: "assests/images/ngo mage.jpg",
    ),
    Dashboardmodel(
      name: "Mental Health Helpline no.",
      imageUrl: "assests/images/ngo mage.jpg",
    ),
  ];
}
