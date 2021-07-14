import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation/colorsfile.dart';
import 'package:flutter_meditation/sleep/provider/meditation_provider.dart';
import 'package:flutter_meditation/sleep/sound_details.dart';
import 'package:provider/provider.dart';

class SettingRadioButtons extends StatefulWidget {
  final double height;
  final double width;

  const SettingRadioButtons({
    this.height,
    this.width,
  });
  @override
  _SettingRadioButtonsState createState() => _SettingRadioButtonsState();
}

class _SettingRadioButtonsState extends State<SettingRadioButtons> {
  String text = '';
  String chipsText = '', chipsT2 = '', chipsT3 = '';

  setSelectedRadio(int val) {
    setState(() {
      MeditationProvider provider =
          Provider.of<MeditationProvider>(context, listen: false);
      provider.value = val;
      provider.isplaying = true;
      provider.isSongSelected = true;
      provider.meditaionsPressed = false;
      provider.isChipSelected = false;
      print('isSongSelected : ${provider.isSongSelected}');
      setDetails();
    });
  }

  void setDetails() {
    MeditationProvider provider =
        Provider.of<MeditationProvider>(context, listen: false);
    switch (provider.value) {
      case 1:
        setState(() {
          text = 'Guided';
        });
        break;
      case 2:
        setState(() {
          text = 'Unguided';
        });
        break;
      case 3:
        setState(() {
          text = 'Timer Only';
        });
        break;
      default:
        Text('Wrong Input');
    }
  }

  void showAlert() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext _) {
          return AlertDialog(
            backgroundColor: o1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            title: AlertContent(
              text: text,
            ),
            content: Text(
              'Confirm?',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: kActiveIconColor,
                    fontSize: widget.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  setState(() {
                    var provider =
                        Provider.of<MeditationProvider>(context, listen: false);
                    provider.value == 1
                        ? provider.chipsTxt = '-'
                        : provider.value == 2
                            ? provider.chipsT2 = '-'
                            : provider.chipsT3 = '-';

                    provider.value = 0;
                    provider.isSongSelected = false;
                    provider.isChipSelected = false;
                  });
                },
                splashColor: o1,
                child: Text(
                  'NO',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: kActiveIconColor,
                        fontSize: widget.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              RaisedButton(
                onPressed: () {
                  var provider =
                      Provider.of<MeditationProvider>(context, listen: false);
                  if (provider.isChipSelected) {
                    Navigator.of(context).pop(true);
                    setState(() {
                      provider.value == 1
                          ? chipsText = provider.chipsTxt
                          : provider.value == 2
                              ? chipsT2 = provider.chipsT2
                              : chipsT3 = provider.chipsT3;
                    });
                  }
                },
                color: kActiveIconColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  'YES',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: o2,
                        fontSize: widget.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
            scrollable: true,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MeditationProvider>(context, listen: false);
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: kActiveIconColor,
      ),
      child: Column(
        children: [
          RadioListTile(
            value: 1,
            groupValue: provider.value,
            onChanged: (val) {
              setSelectedRadio(val);
              showAlert();
            },
            title: Text(
              'Guided',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: widget.width * 0.08,
                    color: kActiveIconColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Loto',
                  ),
            ),
            subtitle: Text(
              'Teacher and Music',
              style: Theme.of(context).textTheme.overline.copyWith(
                    fontSize: widget.width * 0.05,
                    color: sleep,
                    fontFamily: 'Loto',
                  ),
            ),
            secondary: Text(
              provider.value == 1 ? provider.chipsTxt : '--',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: widget.width * 0.04,
                    color: kActiveIconColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            activeColor: kActiveIconColor,
          ),
          RadioListTile(
            value: 2,
            groupValue: provider.value,
            onChanged: (val) {
              setSelectedRadio(val);
              showAlert();
            },
            title: Text(
              'Unguided',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: widget.width * 0.08,
                    color: kActiveIconColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Loto',
                  ),
            ),
            subtitle: Text(
              'Only Music',
              style: Theme.of(context).textTheme.overline.copyWith(
                    fontSize: widget.width * 0.05,
                    color: sleep,
                    fontFamily: 'Loto',
                  ),
            ),
            secondary: Text(
              provider.value == 2 ? provider.chipsT2 : '--',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: widget.width * 0.04,
                    color: kActiveIconColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            activeColor: kActiveIconColor,
          ),
          RadioListTile(
            value: 3,
            groupValue: provider.value,
            onChanged: (val) {
              setSelectedRadio(val);
              showAlert();
            },
            title: Text(
              'Timer Only',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: widget.width * 0.08,
                    color: kActiveIconColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Loto',
                  ),
            ),
            subtitle: Text(''),
            secondary: Text(
              provider.value == 3 ? provider.chipsT3 : '--',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: widget.width * 0.04,
                    color: kActiveIconColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            activeColor: kActiveIconColor,
          ),
        ],
      ),
    );
  }
}

class AlertContent extends StatefulWidget {
  final String text;
  AlertContent({this.text});

  @override
  _AlertContentState createState() => _AlertContentState();
}

class _AlertContentState extends State<AlertContent> {
  int tag = 9;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MeditationProvider>(context, listen: false);
    return Card(
      color: o2,
      elevation: 1,
      margin: EdgeInsets.all(1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            color: kActiveIconColor,
            child: Center(
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: o2,
                    ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ChipsChoice<int>.single(
              value: tag,
              onChanged: (val) {
                setState(() {
                  tag = val;
                  provider.isChipSelected = true;
                });
                provider.assign(val);
                provider.getDuration();
                provider.songsTimer();
              },
              choiceItems: provider.value == 1
                  ? C2Choice.listFrom<int, Sounds>(
                      source: provider.sounds,
                      value: (i, v) => i,
                      label: (i, v) => v.title,
                      tooltip: (i, v) => v.title,
                    )
                  : provider.value == 2
                      ? C2Choice.listFrom<int, Sounds>(
                          source: provider.sounds1,
                          value: (i, v) => i,
                          label: (i, v) => v.title,
                          tooltip: (i, v) => v.title,
                        )
                      : C2Choice.listFrom<int, String>(
                          source: provider.timer,
                          value: (i, v) => i,
                          label: (i, v) => v,
                        ),
              wrapped: true,
              choiceStyle: C2ChoiceStyle(
                labelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: kActiveIconColor,
                    ),
                color: kActiveIconColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              choiceActiveStyle: C2ChoiceStyle(
                color: kActiveIconColor,
                labelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kActiveIconColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
