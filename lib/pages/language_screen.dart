// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../generated/l10n.dart';
// import 'model/model.dart';
// import 'provider/localization_provider.dart';
//
// class LanguageScreen extends StatelessWidget {
//   const LanguageScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LocalizationProvider>(
//         builder: (context, localizationProvider, child) {
//       var groupValue = localizationProvider.locale.languageCode;
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(S.current.language),
//         ),
//         body: ListView.builder(
//           itemCount: languageModel.length,
//           itemBuilder: (context, index) {
//             var item = languageModel[index];
//             return RadioListTile(
//               value: item.languageCode,
//               groupValue: groupValue,
//               title: Text(item.language),
//               subtitle: Text(item.subLanguage),
//               onChanged: (value) {
//                 groupValue = value.toString();
//                 localizationProvider.setLocale(Locale(item.languageCode));
//               },
//             );
//           },
//         ),
//       );
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import 'model/model.dart';
import 'provider/localization_provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, child) {
      var selectedValue = localizationProvider.locale.languageCode;

      return Scaffold(
        appBar: AppBar(
          title: Text(S.current.language),
          actions: [
            // Add IconButton to AppBar for Dropdown

            // Using PopupMenuButton to show dropdown options
            PopupMenuButton<String>(
              icon:
                  const Icon(Icons.language), // Shows an icon for the dropdown
              onSelected: (String newValue) {
                // Change locale on selection
                localizationProvider.setLocale(Locale(newValue));
              },
              itemBuilder: (BuildContext context) {
                return languageModel.map((item) {
                  return PopupMenuItem<String>(
                    value: item.languageCode,
                    child: Text('${item.language} (${item.subLanguage})'),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   S.current.select_language,
              //   style: Theme.of(context).textTheme.headline6,
              // ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                items: languageModel.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.languageCode,
                    child: Text('${item.language} (${item.subLanguage})'),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // Update the selected value and change the locale
                    localizationProvider.setLocale(Locale(newValue));
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
