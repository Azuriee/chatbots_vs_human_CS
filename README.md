# 🛠️ Customer Service Analytics — dbt · BigQuery · Looker Studio  
### AI Chatbots vs Human Agents — Strategic Insights & Hybrid Support Recommendation  
**Team : Alexandra Merli, Inês Merce, Fabiana Barahona, Elise Gonthier**

---

## 📌 Project Overview

Shopzilla is considering partially replacing Human Customer Success agents with AI chatbots.  
Our goal was to deliver a **data-driven evaluation** of performance, cost, satisfaction, and market readiness.

This project combines:

- **dbt** → modeling & transformations  
- **BigQuery** → warehouse  
- **Looker Studio** → final dashboard (with drilldowns)  
- **Multi-source analysis** (AI provider, Shopzilla, global survey, Google Trends)

---

## 📥 Data Sources

We integrated **four datasets**, each providing a different perspective:

### 1. 🤖 AI Company Dataset (US-based)
- Chatbot interaction logs  
- Response time  
- CSAT  
- Status (resolved / pending / escalated)

Used to benchmark **AI performance**.

### 2. 🛍️ Shopzilla Customer Service Dataset
- Human agent interactions  
- Product categories  
- Orders, returns, refunds  
- Customer demographics  
- CSAT & response time  

Used to evaluate **Human agent performance**.

### 3. 🌍 Global AI Sentiment Survey
- AI approval  
- Privacy distrust  
- Country segmentation (India, China, Canada)

Used for **market readiness analysis**.

### 4. 📈 Google Trends (CSV exports)
- “Chatbots” (2022)  
- “Customer Service” (2022)

Used to assess **public interest trends**.

---

## 🧱 dbt Modeling

All data **cleaning, standardization, joining and transformation work** was performed in dbt.

The project follows a **staging → intermediate → mart** architecture:
- **staging** → structural cleaning & renaming  
- **intermediate** → business logic, joins, metrics  
- **mart** → final analytical models consumed by Looker Studio  

As this was an **ad-hoc analytical project** (no orchestration or automation), a full suite of tests was not required.  
However, we set up the correct dbt structure (**schema.yml, sources, tests folder**) to remain compliant with analytics engineering best practices and **ready for future automation if needed**.


---

## 🗂️ BigQuery Warehouse

BigQuery acted as:

### ✔ A storage layer  
- Hosting raw datasets  
- Hosting dbt-generated transformed tables  

### ✔ A connection layer  
- Feeding Looker Studio directly through the dbt-managed tables  

Final mart models include:

- `mart_ai_company.sql`  
- `mart_ai_general_survey.sql`  
- `mart_merge_ai_human.sql`  
- `mart_product_trad_company.sql`  
- `mart_trad_company_seg.sql`

---

## 📊 Dashboard Summary (Looker Studio)

### 1. Performance — AI vs Human
- Equivalent CSAT between AI and Humans
- AI response time: **1.5–4.3 minutes**  
- Human response time: **~176 minutes**
➡️ AI = **much faster**  

---

### 2. Cost Comparison
- AI cost: **~$3–4 per interaction**  
- Human cost: **~$7–10**  
➡️ AI offers **significant cost advantages** for repetitive tasks.

---

### 3. Category Insights
- Humans overloaded with returns, refunds, product queries  
- AI strongest on technical basics & password resets  
➡️ Response time is the **key driver** of CSAT.

---

### 4. Market Readiness
- High AI approval rates (China, India, Canada)  
- Google Trends confirms rising interest  
➡️ Global markets are ready for AI support.

---

## 🎯 Final Recommendation — Hybrid Support Model

### Use AI for:
- Password resets  
- Technical basics  
- Order updates  
- Billing questions  
- FAQs  

### Use Humans for:
- Escalations  
- Refunds  
- Complex / emotional issues  
- High-value customers  

### Expected Impact
- **5× faster** response time on targeted categories  
- **2× cheaper** on low-complexity interactions  
- Increased agent productivity  
- Potential **+0.10 CSAT improvement**

---

## 📁 Repository Structure (Actual)

```bash
.
├── analyses/
├── macros/
├── models/
│   ├── intermediate/
│   ├── mart/
│   │   ├── mart_ai_company.sql
│   │   ├── mart_ai_general_survey.sql
│   │   ├── mart_merge_ai_human.sql
│   │   ├── mart_product_trad_company.sql
│   │   ├── mart_trad_company_seg.sql
│   ├── staging/
├── seeds/
├── snapshots/
├── tests/
├── .gitignore
├── README.md
└── dbt_project.yml


