import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final Map<String, dynamic>? user;

  const UserForm({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    bool isEdit = user != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Editar Usuario' : 'Nuevo Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: isEdit ? user!['dni'] : '',
              decoration: const InputDecoration(labelText: 'DNI'),
            ),
            TextFormField(
              initialValue: isEdit ? user!['nombre'] : '',
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              initialValue: isEdit ? user!['apellido'] : '',
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            TextFormField(
              initialValue: isEdit ? user!['email'] : '',
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              initialValue: isEdit ? user!['telefono'] : '',
              decoration: const InputDecoration(labelText: 'Teléfono'),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              initialValue: isEdit ? user!['usuario'] : '',
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextFormField(
              initialValue: isEdit ? user!['password'] : '',
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            DropdownButtonFormField<String>(
              value: isEdit ? user!['rol'] : 'Usuario',
              items: ['Usuario', 'Administrador']
                  .map((role) => DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      ))
                  .toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Rol'),
            ),
            TextFormField(
              initialValue: isEdit ? user!['puerta'] : '',
              decoration: const InputDecoration(labelText: 'Área asignada'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Guardar usuario
                Navigator.pop(context);
              },
              child: Text(isEdit ? 'Actualizar' : 'Crear'),
            ),
          ],
        ),
      ),
    );
  }
}