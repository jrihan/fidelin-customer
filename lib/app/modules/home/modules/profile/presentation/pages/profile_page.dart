import 'package:customer/shared/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  bool get wantKeepAlive => true;
  final UserStore _userStore = Modular.get<UserStore>();

  double picSize = 60.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
          children: [
            Container(
              height: constraints.maxWidth / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/fidelin-b1ad0.appspot.com/o/cards%2F2.png?alt=media&token=eec7dc73-898a-4eac-b244-1a90dd7d95d8"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: constraints.maxWidth / 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: picSize + 20),
                  Text(_userStore.user!.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0)),
                  Text(_userStore.user!.email, textAlign: TextAlign.center),
                  Expanded(
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Visibility(
                          visible: false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: ListTile(
                              onTap: () {
                                print("test");
                              },
                              leading: Icon(Icons.person),
                              title: Text('Editar Perfil'),
                            ),
                          ),
                        ),
                        Divider(height: 0),
                        Visibility(
                          visible: false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: ListTile(
                              leading: Icon(Icons.lock),
                              title: Text('Mudar Senha'),
                            ),
                          ),
                        ),
                        Divider(height: 1),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: ListTile(
                            leading: Icon(Icons.logout),
                            title: Text('Sair'),
                            onTap: () {
                              _userStore.removeUser();
                              Modular.to.navigate('/auth/');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: QrImageView(
                          backgroundColor: Colors.grey.shade100,
                          data: _userStore.user!.id,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: constraints.maxWidth / 5,
              left: constraints.maxWidth / 2 - picSize,
              child: CircleAvatar(
                radius: picSize,
                backgroundColor: Colors.black12,
                child: _userStore.user!.avatarUrl != ""
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: picSize - 2,
                        backgroundImage: NetworkImage(
                          _userStore.user!.avatarUrl!,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: picSize - 2,
                        child: Icon(
                          Icons.person,
                          size: 64,
                          color: Colors.black26,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
