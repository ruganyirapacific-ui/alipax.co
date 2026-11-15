# Alipax 🚀

Plateforme officielle **Alipax** bâtie sur une architecture Jamstack / Serverless moderne et haute performance.

## 🛠 Stack Technique

- **Frontend** : HTML5 sémantique, CSS3 modulaire, JavaScript Vanilla (ES Modules)
- **Hébergement & CDN** : [Cloudflare Pages](https://pages.cloudflare.com/) (Routage d'URLs propres via `_redirects`, sécurité avancée via `_headers`)
- **Backend-as-a-Service** : [Supabase](https://supabase.com/) (PostgreSQL, Auth, Storage, Row-Level Security)
- **SEO & Performances** : Sitemap XML complet, `robots.txt`, Web App Manifest PWA

## 📁 Architecture du Projet

```text
├── .env.example                       # Variables d'environnement de référence
├── supabase/                          # Schéma de base de données & migrations CLI
│   ├── config.toml                    # Configuration Supabase CLI
│   ├── migrations/                    # Scripts SQL horodatés (tables + politiques RLS)
│   └── seed.sql                       # Données initiales de test
├── frontend/                          # Racine du site déployé sur Cloudflare Pages
│   ├── index.html                     # Page d'accueil officielle
│   ├── _redirects                     # Réécritures d'URLs propres sans extension .html
│   ├── _headers                       # En-têtes HTTP de sécurité (CSP, HSTS, cache)
│   ├── robots.txt                     # Règles d'indexation pour les moteurs de recherche
│   ├── sitemap.xml                    # Plan du site SEO
│   ├── manifest.json                  # Manifest PWA
│   ├── pages/                         # Pages publiques du site
│   ├── admin/                         # Interface d'administration
│   └── assets/                        # Ressources statiques (css, js, images, polices)
│       └── js/config/                 # Configuration et client Supabase
└── docs/                              # Documentation technique
```

## 🚀 Démarrage Rapide

1. Cloner le dépôt :
   ```bash
   git clone https://github.com/ruganyirapacific-ui/alipax.co.git
   cd alipax.co
   ```
2. Configurer vos identifiants Supabase dans `frontend/assets/js/config/env.js`.
3. Appliquer les migrations de base de données :
   ```bash
   npx supabase db push
   ```
4. Déployer sur Cloudflare Pages en ciblant le répertoire `frontend`.
