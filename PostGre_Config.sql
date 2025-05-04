
## Create connection PG : 

Name : Kestra PG

Host name : postgres
Port	  : 5432
Maintenance DB :	kestra
Username       :	kestra
Password       :	k3str4


## Creation de la table de control PG : 

CREATE TABLE wine_quality_control (
  id SERIAL PRIMARY KEY,
  run_timestamp TIMESTAMP NOT NULL,
  -- ERP
  erp_nb_lignes INTEGER,
  erp_rmv_dub_nb_lignes INTEGER,
  erp_cleaned_nb_lines INTEGER,
  erp_nb_duplicates INTEGER,
  -- Web
  web_nb_lignes INTEGER,
  web_rmv_dub_nb_lignes INTEGER,
  web_cleaned_nb_lines INTEGER,
  web_nb_duplicates_lines INTEGER,
  -- Liaison
  liaison_nb_lignes INTEGER,
  liaison_rmv_dub_nb_lignes INTEGER,
  liaison_cleaned_nb_lines INTEGER,
  liaison_nb_duplicates_lines INTEGER,
  -- Fichier fusionné
  fusion_rows INTEGER,
  fusion_nb_duplicates INTEGER,
  no_duplicates_final BOOLEAN,
  -- Métriques business
  total_ca NUMERIC(12,2),
  premium_count INTEGER,
  ordinary_count INTEGER,
  -- Tests de qualité
  test_no_nulls BOOLEAN,
  test_join_coherence BOOLEAN,
  test_ca_positive BOOLEAN,
  test_zscore_ok BOOLEAN,
  -- Résultat global
  tests_success BOOLEAN
);


