import 'package:flutter/material.dart';
import 'user_form.dart';

class UserCRUDScreen extends StatelessWidget {
  const UserCRUDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5, // Número de usuarios de ejemplo
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text('Usuario ${index + 1}'),
            subtitle: Text('user${index + 1}@example.com'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserForm(
                          user: {
                            'dni': '12345678',
                            'nombre': 'Nombre $index',
                            'apellido': 'Apellido $index',
                            'email': 'user$index@example.com',
                            'telefono': '123456789',
                            'usuario': 'user$index',
                            'rol': index % 2 == 0 ? 'Usuario' : 'Admin',
                            'puerta': 'Área ${index + 1}',
                          },
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.toggle_off, color: Colors.orange),
                  onPressed: () {
                    // Lógica para deshabilitar usuario
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}