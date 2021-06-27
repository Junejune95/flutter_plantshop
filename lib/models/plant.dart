class Plant {
  final String imageUrl;
  final String name;
  final String plant;
  final double rating;
  final String warmonth;
  final String description;
  final String height;
  final double amount;

  Plant(
      {this.imageUrl,
      this.name,
      this.rating,
      this.warmonth,
      this.plant,
      this.description,
      this.height,
      this.amount});
}

final List<Plant> plants = [
  Plant(
    imageUrl: 'assets/images/plant0.png',
    name: 'Outdoor Plant Large',
    plant: 'Italian',
    warmonth: '15',
    height: '22"',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
    rating: 4.5,
    amount: 20.8,
  ),
  Plant(
    imageUrl: 'assets/images/plant1.png',
    name: 'Outdoor Plant Large',
    plant: 'Italian',
    warmonth: '15',
    height: '22"',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
    rating: 4.5,
    amount: 38.8,
  ),
  Plant(
    imageUrl: 'assets/images/plant3.png',
    name: 'Outdoor Plant Large',
    plant: 'Italian',
    warmonth: '15',
    height: '22"',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
    rating: 4.5,
    amount: 48.8,
  ),
   Plant(
    imageUrl: 'assets/images/plant4.png',
    name: 'Outdoor Plant Large',
    plant: 'Italian',
    warmonth: '15',
    height: '22"',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
    rating: 4.5,
    amount: 48.8,
  )
];
