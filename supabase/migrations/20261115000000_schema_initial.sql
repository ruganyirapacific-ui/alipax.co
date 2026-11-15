-- ==============================================================================
-- Migration initiale Alipax
-- Tables : projets, articles, commandes, contacts, technologies, equipe, vues
-- Sécurité : RLS activé sur toutes les tables
-- ==============================================================================

-- Extension UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Table Projets
CREATE TABLE IF NOT EXISTS projets (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    titre TEXT NOT NULL,
    slug TEXT UNIQUE,
    description TEXT,
    client TEXT,
    image_url TEXT,
    lien_projet TEXT,
    technologies TEXT[],
    en_vedette BOOLEAN DEFAULT false,
    vues INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE projets ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Lecture publique des projets" ON projets FOR SELECT USING (true);
CREATE POLICY "Gestion admin des projets" ON projets FOR ALL USING (auth.role() = 'authenticated');

-- 2. Table Articles (Blog)
CREATE TABLE IF NOT EXISTS articles (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    titre TEXT NOT NULL,
    slug TEXT UNIQUE,
    extrait TEXT,
    contenu TEXT,
    image_couverture TEXT,
    auteur TEXT,
    publie BOOLEAN DEFAULT false,
    vues INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Lecture publique des articles publiés" ON articles FOR SELECT USING (publie = true);
CREATE POLICY "Gestion admin des articles" ON articles FOR ALL USING (auth.role() = 'authenticated');

-- 3. Table Commandes / Devis
CREATE TABLE IF NOT EXISTS commandes (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    client_nom TEXT NOT NULL,
    client_email TEXT NOT NULL,
    client_telephone TEXT,
    service_demande TEXT NOT NULL,
    budget TEXT,
    details TEXT,
    statut TEXT DEFAULT 'en_attente', -- en_attente, en_cours, termine, annule
    created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE commandes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Création de commande publique" ON commandes FOR INSERT WITH CHECK (true);
CREATE POLICY "Gestion admin des commandes" ON commandes FOR ALL USING (auth.role() = 'authenticated');

-- 4. Table Messages de Contact
CREATE TABLE IF NOT EXISTS contacts (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nom TEXT NOT NULL,
    email TEXT NOT NULL,
    sujet TEXT,
    message TEXT NOT NULL,
    lu BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Envoi de message public" ON contacts FOR INSERT WITH CHECK (true);
CREATE POLICY "Gestion admin des messages" ON contacts FOR ALL USING (auth.role() = 'authenticated');

-- 5. Table Technologies
CREATE TABLE IF NOT EXISTS technologies (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nom TEXT NOT NULL,
    categorie TEXT, -- frontend, backend, devops, mobile, etc.
    icone_url TEXT,
    description TEXT,
    ordre INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE technologies ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Lecture publique des technologies" ON technologies FOR SELECT USING (true);
CREATE POLICY "Gestion admin des technologies" ON technologies FOR ALL USING (auth.role() = 'authenticated');

-- 6. Table Équipe
CREATE TABLE IF NOT EXISTS equipe (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nom TEXT NOT NULL,
    role TEXT NOT NULL,
    bio TEXT,
    photo_url TEXT,
    email TEXT,
    ordre INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE equipe ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Lecture publique de l'equipe" ON equipe FOR SELECT USING (true);
CREATE POLICY "Gestion admin de l'equipe" ON equipe FOR ALL USING (auth.role() = 'authenticated');

-- 7. Table Analytique / Vues
CREATE TABLE IF NOT EXISTS vues (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    page TEXT NOT NULL,
    ip_hash TEXT,
    user_agent TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE vues ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Enregistrement anonyme de vue" ON vues FOR INSERT WITH CHECK (true);
CREATE POLICY "Lecture des vues par admin" ON vues FOR SELECT USING (auth.role() = 'authenticated');
