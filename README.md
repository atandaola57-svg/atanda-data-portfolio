# atanda-data-portfolio
Portfolio Data Engineering &amp; Analytics – Python, SQL, BigQuery, dbt, Power BI, Azure, Docker
# 📊 Marketing Campaign Analysis – SQL • BigQuery • Cohort • RFM

## 🎯 Objectif du projet
Ce projet a pour objectif d’analyser la performance de campagnes marketing direct en exploitant des données clients, commandes et contacts campagnes afin de :

- Mesurer l’efficacité des campagnes (conversion, revenu)
- Identifier les segments clients les plus rentables
- Analyser la rétention client dans le temps
- Construire une segmentation RFM exploitable par les équipes marketing

Ce projet simule un cas réel d’analyse marketing dans un contexte data-driven.

---

## 🛠️ Stack technique
- **Data Warehouse** : BigQuery
- **Langage** : SQL (CTE, agrégations, window functions)
- **Data Viz** : Power BI (screenshots)
- **Versioning** : GitHub
- **Approche** : ELT Analytics


## 📊 KPIs produits
- Taux de conversion campagne
- Uplift (test vs contrôle)
- Revenu par client contacté
- Rétention cohort mensuelle
- Segmentation RFM (Champions, Loyal, At Risk…)

## 📈 Analyses réalisées

### 1️⃣ Performance campagne
Analyse du taux de conversion et du revenu généré par les campagnes marketing.

➡️ Objectif : évaluer l’efficacité marketing et le ROI

### 2️⃣ Analyse Cohort
Construction d’une cohorte basée sur le mois de première commande pour mesurer la rétention client.

➡️ Objectif : comprendre la fidélisation

### 3️⃣ Segmentation RFM
Calcul des scores :
- **Recency**
- **Frequency**
- **Monetary**

➡️ Objectif : cibler les clients à forte valeur

## ▶️ Comment exécuter le projet

1. Créer les tables BigQuery avec `01_create_tables.sql`
2. Charger les CSV dans BigQuery
3. Exécuter les requêtes KPI `02_kpis.sql`
4. Exécuter cohort & RFM
5. Visualiser dans Power BI

## 🚀 Améliorations futures
- Ajout d’un test statistique A/B en Python
- Pipeline dbt incrémental
- Optimisation performances SQL
- Dashboard interactif Looker Studio

## 💡 Compétences démontrées
- Modélisation analytique SQL
- Analyse marketing data-driven
- Cohort analysis & RFM
- Data storytelling
- Structuration d’un projet analytics end-to-end

## 👨‍💻 Auteur
**Atanda Kitoyi**  
Data Engineer / Data Analyst  

📍 France  
📧 halikatanda92@yahoo.com  
🔗 Portfolio en cours de construction

