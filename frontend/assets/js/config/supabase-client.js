// Client officiel Supabase pour Alipax
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { SUPABASE_URL, SUPABASE_ANON_KEY } from './env.js';

if (!SUPABASE_URL || !SUPABASE_ANON_KEY || SUPABASE_URL.includes('VOTRE_PROJET_ID')) {
  console.warn('[Supabase] Identifiants non configurés. Mettez à jour frontend/assets/js/config/env.js');
}

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    persistSession: true,
    autoRefreshToken: true
  }
});
