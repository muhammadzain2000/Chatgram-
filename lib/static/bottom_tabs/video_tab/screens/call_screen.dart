import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  List<String> images = [];
  List<String> names = [];
  CallScreen({this.images, this.names});
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool _isCameraEnabled = true;
  bool _isSpeakerEnabled = true;
  bool _isMicMute = false;
  // NAME SELECTOR
  Widget nameSelection(BuildContext context) {
    //THEMES
    TextStyle style = TextStyle(
        fontFamily: 'CenturyGothic',
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500);
    if (widget.names.length == 1) {
      return Text(
        widget.names[0],
        style: style,
      );
    } else if (widget.names.length == 2) {
      return Text(
        "${widget.names[0]}, ${widget.names[1]}",
        style: style,
      );
    } else if (widget.names.length == 3) {
      return Text(
        "${widget.names[0]}, ${widget.names[1]}, ${widget.names[2]}",
        style: style,
      );
    } else if (widget.names.length == 4) {
      return Text(
        "${widget.names[0]}, ${widget.names[1]}, ${widget.names[2]}, ${widget.names[3]}",
        style: style,
      );
    }
  }

  //IMages classification
  Widget imagesSelection() {
    if (widget.images.length == 1) {
      return Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.images[0],
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
        ],
      );
    } else if (widget.images.length == 2) {
      return Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.images[0],
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.images[1],
                      ),
                      fit: BoxFit.fill)),
            ),
          )
        ],
      );
    } else if (widget.images.length == 3) {
      return Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          widget.images[1],
                        ),
                        fit: BoxFit.fill)),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          widget.images[2],
                        ),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage(
          //               widget.images[0],
          //             ),
          //             fit: BoxFit.fill)),
          //   ),
          // ),
        ],
      );
    } else if (widget.images.length == 4) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.images[0],
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.images[1],
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.images[2],
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.images[3],
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEMES
    var theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: theme.accentColor,
              body: Column(
                children: [
                  Container(
                    height: 80,
                    color: theme.accentColor,
                  ),
                  nameSelection(context),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: 120,
                        top: 40,
                      ),
                      child: imagesSelection(),
                    ),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: _getActionsPanel(),
          ),
        ],
      ),
    );
  }

  Widget _getActionsPanel() {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32)),
        child: Container(
          padding: EdgeInsets.all(4),
          color: Colors.black26,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "Mute",
                  child: Icon(
                    Icons.mic,
                    color: _isMicMute ? Colors.grey : Colors.white,
                  ),
                  onPressed: () => _muteMic(),
                  backgroundColor: Colors.black38,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "Speacker",
                  child: Icon(
                    Icons.volume_up,
                    color: _isSpeakerEnabled ? Colors.white : Colors.grey,
                  ),
                  onPressed: () => _switchSpeaker(),
                  backgroundColor: Colors.black38,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "SwitchCamera",
                  child: Icon(
                    Icons.switch_video,
                    color: _isVideoEnabled() ? Colors.white : Colors.grey,
                  ),
                  onPressed: () => _switchCamera(),
                  backgroundColor: Colors.black38,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "ToggleCamera",
                  child: Icon(
                    Icons.videocam,
                    color: _isVideoEnabled() ? Colors.white : Colors.grey,
                  ),
                  onPressed: () => _toggleCamera(),
                  backgroundColor: Colors.black38,
                ),
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: FloatingActionButton(
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return Future.value(false);
  }

  _muteMic() {
    setState(() {
      _isMicMute = !_isMicMute;
    });
  }

  _switchCamera() {
    if (!_isVideoEnabled()) return;
  }

  _toggleCamera() {
    setState(() {
      _isCameraEnabled = !_isCameraEnabled;
    });
  }

  bool _isVideoEnabled() {
    return _isCameraEnabled;
  }

  _switchSpeaker() {
    setState(() {
      _isSpeakerEnabled = !_isSpeakerEnabled;
    });
  }
}
