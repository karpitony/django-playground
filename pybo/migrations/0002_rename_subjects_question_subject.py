# Generated by Django 5.2.4 on 2025-07-07 08:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pybo', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='question',
            old_name='subjects',
            new_name='subject',
        ),
    ]
