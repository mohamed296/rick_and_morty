import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';

class CharacterInfoSection extends StatelessWidget {
  final Character character;

  const CharacterInfoSection({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.05),
      child: Column(
        children: [
          InfoRow(
            label: 'Status',
            value: character.status,
            icon: character.status == "Alive"
                ? Icons.circle
                : character.status == "Dead"
                    ? Icons.cancel
                    : Icons.help_outline,
            iconColor: character.status == "Alive"
                ? Colors.green
                : character.status == "Dead"
                    ? Colors.red
                    : Colors.grey,
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
          InfoRow(
            label: 'Species',
            value: character.species,
            icon: Icons.person_outline,
            iconColor: Colors.blue,
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
          InfoRow(
            label: 'Gender',
            value: character.gender,
            icon: character.gender == 'Male' ? Icons.male : Icons.female,
            iconColor: Colors.purple,
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
          if (character.type.isNotEmpty)
            InfoRow(
              label: 'Type',
              value: character.type,
              icon: Icons.category_outlined,
            ),
          if (character.type.isNotEmpty)
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
          InfoRow(
            label: 'Origin',
            value: character.origin.name,
            icon: Icons.public,
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
          InfoRow(
            label: 'Location',
            value: character.location.name,
            icon: Icons.location_on,
            iconColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow(
      {super.key,
      required this.label,
      required this.value,
      this.icon,
      this.iconColor});

  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Container(
              decoration: BoxDecoration(
                color:
                    iconColor?.withOpacity(0.1) ?? Colors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, size: 20.0, color: iconColor ?? Colors.black),
            ),
          const SizedBox(width: 12.0),
          SizedBox(
            width: 80.0,
            child: Text(
              '$label ',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
