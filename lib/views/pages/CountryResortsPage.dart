import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class CountryResortsPage extends StatefulWidget {
  @override
  _CountryResortsPageState createState() => _CountryResortsPageState();
}

class _CountryResortsPageState extends State<CountryResortsPage> {
  Map<String, List<String>> countryResorts = {};
  List<String> filteredCountries = [];
  String searchCountryText = '';

  Future<void> loadCsvData() async {
    final String csvData = await rootBundle.loadString(
      'assets/images/countries_resorts.csv',
    );

    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);
    Map<String, List<String>> tempCountryResorts = {};

    for (int i = 1; i < csvTable.length; i++) {
      String country = csvTable[i][2].toString();
      String resort = csvTable[i][1].toString();

      if (tempCountryResorts.containsKey(country)) {
        tempCountryResorts[country]?.add(resort);
      } else {
        tempCountryResorts[country] = [resort];
      }
    }

    setState(() {
      countryResorts = tempCountryResorts;
      filteredCountries = countryResorts.keys.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  void filterCountries(String searchText) {
    setState(() {
      searchCountryText = searchText;
      filteredCountries =
          countryResorts.keys
              .where(
                (country) =>
                    country.toLowerCase().contains(searchText.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0D17),
      appBar: AppBar(
        title: Text('Países e Resorts', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0B0D17),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar País',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                fillColor: Color(0xFF1E1E2C),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                filterCountries(value);
              },
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child:
                filteredCountries.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView(
                      children:
                          filteredCountries.map((country) {
                            return ListTile(
                              title: Text(
                                country,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => ResortsPage(
                                          country: country,
                                          resorts: countryResorts[country]!,
                                        ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    ),
          ),
        ],
      ),
    );
  }
}

class ResortsPage extends StatefulWidget {
  final String country;
  final List<String> resorts;

  ResortsPage({required this.country, required this.resorts});

  @override
  _ResortsPageState createState() => _ResortsPageState();
}

class _ResortsPageState extends State<ResortsPage> {
  List<String> filteredResorts = [];
  String searchResortText = '';

  @override
  void initState() {
    super.initState();
    filteredResorts = widget.resorts;
  }

  void filterResorts(String searchText) {
    setState(() {
      searchResortText = searchText;
      filteredResorts =
          widget.resorts
              .where(
                (resort) =>
                    resort.toLowerCase().contains(searchText.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0D17),
      appBar: AppBar(
        title: Text(
          'Resorts em ${widget.country}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0B0D17),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar Resort',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                fillColor: Color(0xFF1E1E2C),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                filterResorts(value);
              },
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child:
                filteredResorts.isEmpty
                    ? Center(
                      child: Text(
                        "Nenhum resort encontrado",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    : ListView.builder(
                      itemCount: filteredResorts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  filteredResorts[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.lightBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text('Reservar'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
