import 'package:flutter/material.dart';

class MyExpansionPanelList extends StatefulWidget {
  const MyExpansionPanelList({super.key});

  @override
  State<MyExpansionPanelList> createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  final List<Step> _steps = getSteps();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _renderSteps(),
      ),
    );
  }

  Widget _renderSteps() {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _steps[index].isExpanded = !isExpanded;
        });
      },
      children: _steps.map<ExpansionPanel>((Step step) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(step.title),
            );
          },
          body: ListTile(
            title: Text(step.body),
          ),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}

class Step {
  Step(this.title, this.body, [this.isExpanded = false]);
  String title;
  String body;
  bool isExpanded;
}

List<Step> getSteps() {
  return [
    Step('Step 0: Install Flutter',
        'Install Flutter development tools according to the official documentation.'),
    Step('Step 1: Create a project',
        'Open your terminal, run `flutter create <project_name>` to create a new project.'),
    Step('Step 2: Run the app',
        'Change your terminal directory to the project directory, enter `flutter run`.'),
  ];
}
