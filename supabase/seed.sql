-- Données de test initiales Alipax

INSERT INTO technologies (nom, categorie, icone_url, description, ordre) VALUES
('JavaScript', 'frontend', '/assets/images/technologies/javascript.svg', 'Langage web standard moderne ES6+', 1),
('Cloudflare Pages', 'devops', '/assets/images/technologies/cloudflare.svg', 'Hébergement Jamstack Edge ultra-rapide', 2),
('Supabase', 'backend', '/assets/images/technologies/supabase.svg', 'Backend BaaS PostgreSQL avec Auth et RLS', 3),
('HTML5 / CSS3', 'frontend', '/assets/images/technologies/html5.svg', 'Structure sémantique et style responsive', 4)
ON CONFLICT DO NOTHING;

INSERT INTO projets (titre, slug, description, client, en_vedette, technologies) VALUES
('Refonte Plateforme Alipax', 'refonte-alipax', 'Architecture moderne Serverless et Jamstack haute performance.', 'Alipax', true, ARRAY['Cloudflare', 'Supabase', 'JavaScript'])
ON CONFLICT DO NOTHING;
