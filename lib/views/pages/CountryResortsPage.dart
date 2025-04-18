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

  // Função para carregar e processar o arquivo CSV
  Future<void> loadCsvData() async {
    final String csvData = await rootBundle.loadString(
      'assets/images/countries_resorts.csv',
    );

    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    Map<String, List<String>> tempCountryResorts = {};

    // Processar os dados do CSV
    for (int i = 1; i < csvTable.length; i++) {
      String country =
          csvTable[i][2].toString(); // A coluna "Country" está na posição 2
      String resort =
          csvTable[i][1].toString(); // A coluna "Name" está na posição 1

      if (tempCountryResorts.containsKey(country)) {
        tempCountryResorts[country]?.add(resort);
      } else {
        tempCountryResorts[country] = [resort];
      }
    }

    setState(() {
      countryResorts = tempCountryResorts;
      filteredCountries =
          countryResorts.keys
              .toList(); // Inicializa a lista de países filtrados
    });
  }

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  // Função para filtrar os países com base no texto da pesquisa
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
      backgroundColor: const Color(0xFF0B0D17), // Fundo escuro
      appBar: AppBar(
        title: Text('Países e Resorts', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0B0D17),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Cor clara para o ícone de voltar
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
                filterCountries(value); // Filtra os países conforme digita
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
                                // Quando clicar em um país, exibe os resorts
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
    filteredResorts = widget.resorts; // Inicializa com todos os resorts
  }

  // Função para filtrar os resorts com base no texto da pesquisa
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
      backgroundColor: const Color(0xFF0B0D17), // Fundo escuro
      appBar: AppBar(
        title: Text(
          'Resorts em ${widget.country}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0B0D17),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Cor clara para o ícone de voltar
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
                filterResorts(value); // Filtra os resorts conforme digita
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
                                // Garante que o nome do resort ocupe o espaço disponível
                                child: Text(
                                  filteredResorts[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    overflow:
                                        TextOverflow
                                            .ellipsis, // Adiciona reticências se o nome for muito grande
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Ação do botão de reserva (sem funcionalidade por enquanto)
                                },
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

void main() {
  runApp(MaterialApp(home: CountryResortsPage()));
}
