# Customer Segmentation Analysis using SQL

---

## 🎯 Objective
Analyze customer purchasing behavior and classify customers into value segments (High, Medium, Low) based on their total spending. This project helps identify high-value customers and highlights inactive or low-value customers for targeted business strategies.

---

## 🗃 Dataset Description

### customers Table
| Column | Type |
|--------|------|
| id     | INTEGER |
| name   | TEXT |

### orders Table
| Column       | Type |
|--------------|------|
| id           | INTEGER |
| customer_id  | INTEGER |
| amount       | INTEGER |

---

## ⚙️ SQL Analysis

### Step 1: Create Tables
```sql
CREATE TABLE customers (
    id INTEGER,
    name TEXT
);

CREATE TABLE orders (
    id INTEGER,
    customer_id INTEGER,
    amount INTEGER
);
```

### Step 2: Insert Sample Data
```sql
INSERT INTO customers VALUES
(1, 'Ali'),
(2, 'Sara'),
(3, 'Ahmed'),
(4, 'Ayesha'),
(5, 'Bilal'),
(6, 'Hamza');

INSERT INTO orders VALUES
(1, 1, 500),
(2, 2, 700),
(3, 1, 300),
(4, 4, 900),
(5, 2, 400);
```

### Step 3: Customer Segmentation Query
```sql
SELECT 
    c.name AS customer_name, 
    COUNT(o.id) AS order_count,
    COALESCE(SUM(o.amount), 0) AS total_amount,
    COALESCE(AVG(o.amount), 0) AS avg_order_value,
    CASE
        WHEN COALESCE(SUM(o.amount), 0) >= 800 THEN 'High Value'
        WHEN COALESCE(SUM(o.amount), 0) >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS category
FROM customers c
LEFT JOIN orders o 
ON c.id = o.customer_id
GROUP BY c.id, c.name;
```

---

## 📊 Key Metrics
- **Total Spending per Customer** – shows revenue contribution  
- **Number of Orders** – indicates engagement level  
- **Average Order Value** – measures customer purchasing behavior  

---

## 🔍 Insights
- High-value customers (**Ali, Sara, Ayesha**) contribute the majority of revenue  
- Several customers (**Ahmed, Bilal, Hamza**) have no orders → potential inactive users  
- No medium-value customers observed → indicates pricing or engagement gap  

---

## 💡 Business Recommendations
- Target low-value or inactive customers with promotions or discounts  
- Retain high-value customers with loyalty programs and personalized offers  
- Investigate why some customers are inactive (surveys, engagement campaigns)  

---

## 📂 Project Structure
```
customer-segmentation-sql/
│
├── README.md        # Project description and insights
├── schema.sql       # Table structure
├── data.sql         # Sample data insertion
└── analysis.sql     # Main segmentation query
```

---

## 🚀 How to Run
1. Open your SQL environment (MySQL, SQLite, PostgreSQL)  
2. Run `schema.sql` to create tables  
3. Run `data.sql` to insert sample data  
4. Run `analysis.sql` to generate segmentation results  
5. Review insights and metrics in the results  

---

## 📌 Sample Output

| customer_name | order_count | total_amount | avg_order_value | category   |
|---------------|------------|--------------|-----------------|-----------|
| Ali           | 2          | 800          | 400             | High Value |
| Sara          | 2          | 1100         | 550             | High Value |
| Ayesha        | 1          | 900          | 900             | High Value |
| Ahmed         | 0          | 0            | 0               | Low Value  |
| Bilal         | 0          | 0            | 0               | Low Value  |
| Hamza         | 0          | 0            | 0               | Low Value  |

---

## 🔗 Optional Enhancements
- Export results to CSV for visualization in Power BI or Tableau  
- Use Python (Pandas) to generate charts from SQL output  
- Extend dataset (products, regions, time) for deeper segmentation  
