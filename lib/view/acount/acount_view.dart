import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/services/auth/auth_service.dart';
import 'package:delivery_food/view/acount/history_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcountView extends StatefulWidget {
  const AcountView({super.key});

  @override
  State<AcountView> createState() => _AcountViewState();
}

class _AcountViewState extends State<AcountView> {
  final AuthService _authService = AuthService();
  String? userName;

  void logout() {
    _authService.signOut();
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  Future<void> _loadUserData() async {
    userName = await _authService.getCurrentUserUsername();
    setState(() {}); // Cập nhật giao diện sau khi nhận dữ liệu
  }
  final txtOldPassword = TextEditingController();
  final txtNewPassword = TextEditingController();
  bool isObscureOldPassword = false;
  bool isObscureNewPassword = false;

  void openLocationBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text("Đổi mật khẩu"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: txtOldPassword,
                obscureText: !isObscureOldPassword,
                decoration: InputDecoration(
                  hintText: "Mật khẩu cũ",
                  suffixIcon: IconButton(
                    icon: Icon(isObscureOldPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isObscureOldPassword = !isObscureOldPassword;
                      });
                    },
                  ),
                ),
              ),
              TextField(
                controller: txtNewPassword,
                obscureText: !isObscureNewPassword,
                decoration: InputDecoration(
                  hintText: "Mật khẩu mới",
                  suffixIcon: IconButton(
                    icon: Icon(isObscureNewPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isObscureNewPassword = !isObscureNewPassword;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                txtNewPassword.clear();
                txtOldPassword.clear();
                Navigator.pop(context);
              },
              child: const Text("Hủy"),
            ),
            MaterialButton(
              onPressed: () async {
                bool oldPasswordCorrect = await _authService.verifyPassword(txtOldPassword.text);
                if(txtOldPassword.text.isNotEmpty && txtNewPassword.text.isNotEmpty){
                  if(oldPasswordCorrect){
                    _authService.changePassword(txtOldPassword.text, txtNewPassword.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green), // Thêm icon check
                            SizedBox(width: 8), // Khoảng cách giữa icon và text
                            Text(
                              'Đổi mật khẩu thành công',
                              style: TextStyle(fontSize: 18), // Chỉnh cỡ chữ
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    setState(() {
                      txtNewPassword.clear();
                      txtOldPassword.clear();
                      isObscureOldPassword = false; // Reset lại trạng thái ẩn/hiển thị mật khẩu
                      isObscureNewPassword = false; // Reset lại trạng thái ẩn/hiển thị mật khẩu
                    });
                    Navigator.pop(context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.warning, color: Colors.red), // Thêm icon check
                            SizedBox(width: 8), // Khoảng cách giữa icon và text
                            Text(
                              'Mật khẩu cũ không khớp !!!',
                              style: TextStyle(fontSize: 18), // Chỉnh cỡ chữ
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.info, color: Colors.blue), // Thêm icon check
                          SizedBox(width: 8), // Khoảng cách giữa icon và text
                          Text(
                            'Chưa nhập đủ thông tin !!!',
                            style: TextStyle(fontSize: 18), // Chỉnh cỡ chữ
                          ),
                        ],
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text("Lưu"),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.withOpacity(0.9),
          title: const Text("Tài khoản",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_account2.jpg"),
              fit: BoxFit.fill
            )
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  height: screenSize.height*0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: Column(
                    children: [
                      const Text("Chào bạn",style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrange
                      ),),
                      const SizedBox(height: 10),
                      Text(userName??"",style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                      ),),

                      // SizedBox(
                      //   width: 200,
                      //   child: ElevatedButton(
                      //     onPressed: (){
                      //
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      //       backgroundColor: Colors.red.withOpacity(0.7),
                      //       shape: const StadiumBorder()),
                      //     child: const Text("Sửa thông tin",style: TextStyle(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.w500,
                      //         color: Colors.white
                      //     ),),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.red,thickness: 1,),

                      const SizedBox(height: 20),
                      //Menu
                      //lịch sử mua hàng
                     ProfileMenu(
                         color: Colors.deepOrange.withOpacity(0.3),
                         title: "Lịch sử mua hàng",
                         icon: Icons.shopping_cart_checkout,
                         onPress: (){
                           Get.to(const HistoryOrder());
                         }
                     ),
                      const SizedBox(height: 15),
                      ProfileMenu(
                           color: Colors.deepOrange.withOpacity(0.3),
                          title: "Đổi mật khẩu",
                          icon: Icons.change_circle_sharp,
                          onPress: ()=>openLocationBox(context),
                      ),
                    const SizedBox(height: 95),

                      //đăng xuất
                      ProfileMenu(
                          color: Colors.deepOrange.withOpacity(0.8),
                          title: "Đăng xuất",
                          icon: Icons.logout,
                          onPress: (){
                            logout();
                          }
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final VoidCallback onPress;


  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: Colors.deepOrange.withOpacity(0.6),
          ),
          child: Icon(icon,color: Colors.white,),
        ),
        title: Text(title,style: const TextStyle(
          color: TColor.darkFontGrey,
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}

// TextButton(onPressed: (){
//   logout();
// }, child: Text("Lịch sử mua hàng")
// ),
// TextButton(onPressed: (){
//   logout();
// }, child: Text("Đăng xuất")
// ),