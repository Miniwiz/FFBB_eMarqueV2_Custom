# E_Marque_v2_custom

Application NW.js (emarquev2-mobile).

## Contenu du dépôt

- `www/` — code source de l'application (HTML/JS/CSS)
- `package.json`, `manifest.json`, `build.js` — configuration et script de build NW.js
- `icon.ico` — icône de l'application

Le runtime NW.js prébuilt (`nw.dll`, `node.dll`, les fichiers `.pak`/`.bin`, `locales/`, `swiftshader/`, l'exécutable final, etc.) n'est **pas versionné** : ce sont des binaires tiers téléchargés automatiquement par `nw-builder`, pas du code du projet.

## Build

```bash
npm install
node build.js
```

Cela télécharge le runtime NW.js (version définie dans `build.js`) et génère l'exécutable Windows complet à la racine du projet.
