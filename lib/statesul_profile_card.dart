import 'package:flutter/material.dart';

class StatefulProfileCard extends StatefulWidget {
  const StatefulProfileCard({super.key});

  @override
  State<StatefulProfileCard> createState() => _StatefulProfileCardState();
}

class _StatefulProfileCardState extends State<StatefulProfileCard> {
  String _name = 'John Doe';
  String _description = 'Software Developer';
  String _imageUrl = 'https://i.pravatar.cc/300';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _descriptionController.text = _description;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    setState(() {
      _imageUrl = 'https://i.pravatar.cc/300?img=${DateTime.now().millisecondsSinceEpoch % 70}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(_imageUrl),
          ),
          const SizedBox(height: 20),
          Text(
            _name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            _description,
            textAlign: TextAlign.center,
          ),
          const Divider(height: 20),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: (val)=>setState(()=>_name=val),
          ),
          const Divider(height: 20),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            onChanged: (val)=>setState(()=>_description=val),
          ),
          const SizedBox(height: 20,),
          ElevatedButton.icon(
            onPressed: _updateProfile, 
            label: const Text("Changer de Photo"),
            icon: const Icon(Icons.refresh),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}