class Product {
  final String name;
  final String description;
  final String imageUrl;
  final String price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

List<Product> products = [
  Product(
    name: "Biogas Compressed Cylinder",
    description: "High-quality biogas compressed in an LPG cylinder...",
    imageUrl: "https://5.imimg.com/data5/FE/UV/MY-4515724/lpg-cylinder.jpg",
    price: "\$49.99",
  ),

  Product(
    name: "Biogas Manure Organic Fertilizer",
    description:
        "Nutrient-rich organic fertilizer produced from biogas manure...",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4cMaMnLyffk0CxXfxCRgcfMjNBB15Hj16tQ&usqp=CAU",
    price: "\$999.99",
  ),
  Product(
    name: "Liquid Slurry Manure Processing Kit",
    description: "Convert liquid slurry manure into valuable biogas...",
    imageUrl:
        "https://m.media-amazon.com/images/I/51U3YY-k8tL._SY445_SX342_QL70_FMwebp_.jpg",
    price: "\$149.99",
  ),
  Product(
    name: "Biomass Pellets 100 kg Bag",
    description: "Organic material to feed the cow",
    imageUrl:
        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRlR9R_qTBRAX2u03TkOKyHcCGs2IwonfMZq9_uT6YwSRvIDyVN",
    price: "\$549.99",
  ),
  Product(
    name: "Biogas Stove",
    description:
        " A compact biogas-powered generator suitable for providing electricity in off-grid or rural areas. It's a sustainable solution for powering small appliances and devices.",
    imageUrl:
        "https://www.tradeindia.com/_next/image/?url=https%3A%2F%2Fcpimg.tistatic.com%2F04750565%2Fb%2F4%2FBIOGAS-STOVE-MINI-Tuty-SINGLE-BURNER.jpg&w=750&q=75",
    price: "\$954.99",
  ),
  Product(
    name: "Biogas Water Heater",
    description:
        " An innovative water heater that uses biogas as its fuel source. Ideal for heating water for domestic use while reducing reliance on traditional energy sources.",
    imageUrl:
        "https://biogas.co.ke/wp-content/uploads/2018/06/BIOGAS-HEATER-300x233.jpg",
    price: "\$876.75",
  ),
  Product(
    name: "Biogas Testing Kit",
    description:
        "A testing kit designed to analyze the quality and composition of biogas produced by a digester. It helps users ensure optimal gas production and efficiency.",
    imageUrl:
        "https://images.zeald.com/site/associatedprocess/images/items/CSK%20MicroClip.jpg",
    price: "\$1000.75",
  ),
  Product(
      name: "Biogas Lamp",
      description:
          " A biogas-powered lamp that provides illumination using the produced biogas. It's ideal for areas with limited access to electricity.",
      imageUrl:
          "https://5.imimg.com/data5/JF/CD/PC/SELLER-2505588/biogas-lamp-500x500.jpg",
      price: "\$1500"),
  // Add more products as needed
];
