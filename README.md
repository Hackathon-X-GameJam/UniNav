# UniNav - Indoor Navigation for Universities

UniNav is an open-source mobile application designed to help students, staff, and visitors navigate the complex indoor environments of universities. Developed initially at Uni Ulm, UniNav aims to provide a user-friendly and efficient way to find lecture halls, rooms, toilets, and other points of interest within university buildings.

## Features

- Indoor navigation with detailed university maps
- Search for specific rooms, lecture halls, and facilities
- Get directions to your destination with step-by-step guidance
- Locate nearby amenities such as toilets, food and drink outlets, and PC pools
- Integration with public transport information for easy campus access
- Accessible and intuitive user interface

## Getting Started

To get started with UniNav, follow these steps:

1. Clone the repository:

2. Install the required dependencies:

```shell
flutter pub get
```

3. Run the code generator:

```shell
dart run build_runner build
```

4. Launch the app on your device:

```shell
flutter run
```



## Contributing

We welcome contributions from the community to help improve UniNav and expand its support to other universities. To contribute, please follow these guidelines:

1. Fork the repository and create a new branch for your feature or bug fix.
2. Make your changes, ensuring that the code is clean, well-documented, and follows the project's coding style.
3. Write tests to cover your changes and ensure that existing tests pass.
4. Submit a pull request, describing your changes and their benefits.

Before contributing, please review our [Contributing Guidelines](CONTRIBUTING.md) for more detailed information.

## Adapting to Other Universities

UniNav is designed to be adaptable to other universities and complex indoor navigation environments. If you would like to use UniNav for your university, follow these steps:

1. Prepare your university's map data in GeoJSON format, following the structure used in the `assets/data` directory.
2. Replace the existing map data files with your university's data.
3. Update the `lib/data/geo/model.dart` file to include any additional feature types specific to your university, if necessary.
4. Customize the app's theme and branding in the `lib/theme` directory to match your university's colors and logo.
5. Build and deploy the app for your university.

If you have any questions or need assistance with adapting UniNav to your university, please don't hesitate to reach out to our team.

## License

UniNav is released under the [MIT License](LICENSE). You are free to use, modify, and distribute the code for both commercial and non-commercial purposes.

## Contact

We look forward to hearing from you and working together to make indoor navigation more accessible and convenient for university communities worldwide!
