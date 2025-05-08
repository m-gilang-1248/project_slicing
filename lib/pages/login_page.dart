import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Instagram', style: TextStyle(fontFamily: 'Billabong', fontSize: 48)),
            SizedBox(height: 32),
            TextField(decoration: InputDecoration(hintText: 'Username')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(hintText: 'Password'), obscureText: true),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text('Forgot password?', style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              child: Text('Log in'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            ),
            SizedBox(height: 16),
            Text('OR'),
            SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.facebook, color: Colors.blue),
              label: Text('Log in with Facebook', style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text('Sign up.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}