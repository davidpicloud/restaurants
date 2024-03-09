String restaurantsJson = '''
    {
      "restaurants": [
        {
          "id": 1,
          "name": "Tengerparti Trattoria",
          "type": "Olasz",
          "location": "Budapest",
          "ratings": [4, 5],
          "reviews": [
            {"user": "Anna", "comment": "Nagyszerű tenger gyümölcsei, kellemes környezet."},
            {"user": "Péter", "comment": "A pizza fantasztikus, de az árak magasak."}
          ]
        },
        {
          "id": 2,
          "name": "Zöld Oázis",
          "type": "Vegetáriánus",
          "location": "Debrecen",
          "ratings": [4, 4, 4, 5],
          "reviews": [
            {"user": "Lilla", "comment": "Kreatív vegetáriánus ételek, barátságos személyzet."},
            {"user": "Tamás", "comment": "Nagyszerű választék, de a várakozási idő hosszú volt."}
          ]
        },
        {
          "id": 3,
          "name": "Hagyományok Háza",
          "type": "Magyar",
          "location": "Pécs",
          "ratings": [5, 4, 5, 5],
          "reviews": [
            {"user": "Éva", "comment": "Autentikus magyar konyha, csak ajánlani tudom."},
            {"user": "Gábor", "comment": "Kiváló ízek, de a hely kicsit zsúfolt."}
          ]
        }
      ]
    }
  ''';
