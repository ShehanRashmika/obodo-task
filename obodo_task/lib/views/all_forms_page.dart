import 'package:flutter/material.dart';
import 'package:obodo_task/components/form_item_card.dart';
import 'package:obodo_task/providers/information_provider.dart';
import 'package:provider/provider.dart';

class AllFormsPage extends StatefulWidget {
  static const routeName = "/all-forms-page";

  @override
  _AllFormsPageState createState() => _AllFormsPageState();
}

class _AllFormsPageState extends State<AllFormsPage> {
  @override
  void initState() {
    getForms();
    super.initState();
  }

  void getForms() async {
    await Provider.of<InformationProvider>(context, listen: false).fetchForms();
  }

  Future<void> onRefresh() async {
    await getForms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms"),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Consumer<InformationProvider>(
          builder: (ctx, provider, child) {
            return ListView.builder(
                itemCount: provider.forms.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              provider.forms[index].informationItems.length,
                          itemBuilder: (ctx, index2) {
                            return FormItemCard(
                                label: provider.forms[index]
                                    .informationItems[index2].label,
                                data: provider.forms[index]
                                    .informationItems[index2].data);
                          }),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
