import 'package:flutter/material.dart';

class AdminHistoryScreen extends StatelessWidget {
  const AdminHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: 'Día',
                  items: ['Día', 'Mes', 'Año']
                      .map((period) => DropdownMenuItem(
                            value: period,
                            child: Text(period),
                          ))
                      .toList(),
                  onChanged: (value) {},
                  decoration: const InputDecoration(labelText: 'Filtrar por'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Fecha',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text('Usuario ${index + 1}'),
                subtitle: Text('${index % 2 == 0 ? 'Entrada' : 'Salida'} - ${DateTime.now().subtract(Duration(hours: index))}'),
                trailing: Icon(
                  index % 2 == 0 ? Icons.login : Icons.logout,
                  color: index % 2 == 0 ? Colors.green : Colors.red,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}