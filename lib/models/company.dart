class Company {
  final String name;
  final int id;
  final String address;
  final String logo;
  final String departmentAccountable;
  final String departmentNumber;
  final String email;
  final String description;
  final String certificates;
  final int user;
  final int social;
  final int category;

  Company({
    required this.name,
    required this.id,
    required this.address,
    required this.logo,
    required this.departmentAccountable,
    required this.departmentNumber,
    required this.email,
    required this.description,
    required this.certificates,
    required this.user,
    required this.social,
    required this.category,
  });

  factory Company.getCompany(Map data) {
    return Company(
      name: data['name'],
      id: data['id'],
      address: data['address'],
      logo: data['logo'],
      departmentAccountable: data['department_accountable'],
      departmentNumber: data['department_number'],
      email: data['email'],
      description: data['description'],
      certificates: data['certificates'],
      user: data['user'],
      social: data['social'],
      category: data['category'],
    );
  }
}
