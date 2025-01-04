import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FilterModal extends StatefulHookWidget {
  final Function(Map<String, String?> filters) onApply;
  final void Function() onClear;
  final String? initialStatus;
  final String? initialGender;

  const FilterModal(
      {super.key,
      required this.onApply,
      required this.onClear,
      this.initialStatus,
      this.initialGender});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  @override
  Widget build(BuildContext context) {
    final selectedStatus = useState(widget.initialStatus);
    final selectedGender = useState(widget.initialGender);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter By',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
              value: selectedStatus.value,
              hint: const Text('Select Status'),
              dropdownColor: Colors.white,
              items: ['Alive', 'Dead', 'unknown']
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => selectedStatus.value = value),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            value: selectedGender.value,
            hint: const Text('Select Gender'),
            dropdownColor: Colors.white,
            items: ['Male', 'Female', 'unknown']
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            decoration: const InputDecoration(
              labelText: 'Gender',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => selectedGender.value = value,
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onApply({
                  'status': selectedStatus.value,
                  'gender': selectedGender.value,
                });
                Navigator.pop(context);
              },
              child: const Text('Apply Filters'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onClear,
              child: const Text('clear Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
