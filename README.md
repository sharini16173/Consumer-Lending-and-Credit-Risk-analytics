# Consumer Lending Portfolio & Credit Risk Analytics

## 📖 Project Summary

This project analyses 38,576 bank loan applications (~$435.8M funded, $473.1M received) to evaluate lending performance and credit risk. Raw data was cleaned and analysed in MySQL, then visualised in an interactive 3-page Power BI dashboard (Summary, Overview, Details).

It tracks key KPIs such as total applications, funded and received amounts, average interest rate and DTI, with MTD and MoM comparisons. Loans are classified as Good (Fully Paid/Current) or Bad (Charged Off), showing 86.2% good loans and 13.8% bad loans. The analysis also breaks down lending by month, state, term, employment length, loan purpose and home ownership to help the bank spot trends and manage risk.

---

## 🎯 Objectives

- Monitor lending performance with MTD (Dec 2021) and MoM KPIs
- Separate good loans from bad loans and measure the financial impact
- Identify where lending is concentrated by month, state, term, employment length, purpose and home ownership

## 🛠️ Tools & Technologies

| Area | Tools |
|------|-------|
| Database & Analysis | MySQL |
| Visualisation | Power BI Desktop, DAX |
| Concepts | Data cleaning, aggregation, CASE logic, date functions, KPI design |

## 📂 Repository Structure

```
├── bank_loan-project.sql      # Data cleaning + KPI + analysis queries
├── Bank_Loan_Report.pbix      # Power BI dashboard
├── screenshots/
│   ├── summary.png
│   ├── overview.png
│   └── details.png
└── README.md
```

## 🧹 Data Cleaning (SQL)

- Fixed the corrupted `id` column header caused by a BOM character
- Converted text dates to `DATE` using `STR_TO_DATE` (issue, last credit pull, last payment and next payment dates)
- Trimmed whitespace in the `term` column
- Replaced blank `emp_title` values with `'Unknown'`

## 📊 KPIs Calculated

| KPI | Definition |
|-----|-----------|
| Total Loan Applications | Count of loans, with MTD and PMTD (Dec vs Nov 2021) |
| Total Funded Amount | Sum of `loan_amount` |
| Total Amount Received | Sum of `total_payment` |
| Average Interest Rate | Average of `int_rate` × 100 |
| Average DTI | Average debt-to-income ratio × 100 |
| Good Loan % | Fully Paid + Current loans ÷ all loans |
| Bad Loan % | Charged Off loans ÷ all loans |

## 🔎 Analysis Performed

- Good vs bad loan: applications, funded amount and amount received
- Loan status breakdown (applications, funded, received, interest rate, DTI)
- Monthly trend of applications, funded and received amounts
- Analysis by state, term, employment length, purpose and home ownership

## 📈 Dashboard Pages

### 1. Summary
<img width="1330" height="740" alt="image" src="https://github.com/user-attachments/assets/5d0c39eb-84b3-4dbd-8ca0-f679f5e9e06e" />

### 2. Overview
<img width="1327" height="745" alt="image" src="https://github.com/user-attachments/assets/5aaafa7a-4b85-48d7-8fa3-192d5da9e3a9" />

### 3. Details
<img width="1330" height="742" alt="image" src="https://github.com/user-attachments/assets/5aa8a803-8900-4af2-b182-d27a000cb7e4" />

## 💡 Key Insights

- **38.6K applications** led to **$435.8M funded** and **$473.1M received**
- **86.2%** of loans are good; **13.8%** (5,333 loans) are charged off
- Charged-off loans: **$65.5M funded** but only **$37.3M recovered**
- December 2021 funding reached **$54.0M**, up **13.0% MoM**; monthly funding rose from about $25M in January
- **Debt consolidation** is the largest loan purpose (~$0.23bn)
- **36-month** loans make up ~62.7% of funded amount, **60-month** loans ~37.3%
- Borrowers with **10+ years** of employment have the highest funded amount ($116M)
- Mortgage ($219.3M) and Rent ($185.8M) borrowers dominate home ownership
- Charged-off loans carry a higher average interest rate (13.88%) than fully paid loans (11.64%)

## 🚀 How to Run

1. Load the loan dataset into MySQL as `bank_loan_db.bank_loan_data`
2. Run `bank_loan-project.sql` (cleaning section first, then the analysis queries)
3. Open `Bank_Loan_Report.pbix` in Power BI Desktop and refresh the data source

## 🎯 Skills Demonstrated

SQL data cleaning · Aggregations and GROUP BY · CASE expressions · Date functions · KPI design (MTD/PMTD/MoM) · Power BI dashboard design · Data storytelling

## 📬 Contact

**[Sharini G]** · [www.linkedin.com/in/sharini-g-571546382] · [g.sharini1601@gmail.com]

