import '../screens/associated_temples_list_screen/model/temple_data.dart';

class AppGlobal {
  static final Map<String, List<TempleData>> samajWiseTemples = {
    "Gujarati": [
      const TempleData(
        name: "Swaminarayan Mandir",
        location: "Ahmedabad, Gujarat",
        developerName: "Gujarat Samaj Trust",
      ),
      const TempleData(
        name: "ISKCON Temple",
        location: "Rajkot, Gujarat",
        developerName: "Vaishnav Samaj",
      ),
      const TempleData(
        name: "Swaminarayan Akshardham",
        location: "Gandhinagar, Gujarat",
        developerName: "BAPS",
      ),
      const TempleData(
        name: "Dwarkadhish Temple",
        location: "Dwarka, Gujarat",
        developerName: "Dwarka Mandir Trust",
      ),
      const TempleData(
        name: "Somnath Temple",
        location: "Veraval, Gujarat",
        developerName: "Shree Somnath Trust",
      ),
    ],
    "Rajasthani": [
      const TempleData(
        name: "Shree Nathji Temple",
        location: "Nathdwara, Rajasthan",
        developerName: "Rajasthan Mandir Committee",
      ),
      const TempleData(
        name: "Birla Mandir",
        location: "Jaipur, Rajasthan",
        developerName: "Birla Trust",
      ),
      const TempleData(
        name: "Karni Mata Temple",
        location: "Deshnoke, Rajasthan",
        developerName: "Karni Mata Committee",
      ),
    ],
    "Sindhi": [
      const TempleData(
        name: "Jhulelal Temple",
        location: "Ulhasnagar, Maharashtra",
        developerName: "Sindhi Panchayat",
      ),
      const TempleData(
        name: "Puj Chaliha Sahib Mandir",
        location: "Sukkur, Sindh (Pakistan)",
        developerName: "Jhulelal Trust",
      ),
      const TempleData(
        name: "Sai Jhulelal Temple",
        location: "Ahmedabad, Gujarat",
        developerName: "Sindhi Samaj",
      ),
    ],
    "Other": [],
  };

  static List<TempleData> getTemplesBySamaj(String samajName) {
    return samajWiseTemples[samajName] ?? [];
  }
}
