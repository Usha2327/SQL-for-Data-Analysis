-- 1. Total Sales by Region
SELECT g.Region, SUM(s.Amount) AS TotalSales
FROM sales s
JOIN geo g ON s.GeoID = g.GeoID
GROUP BY g.Region
ORDER BY TotalSales DESC;

-- 2. Top 5 Products by Sales Amount
SELECT p.Product, SUM(s.Amount) AS TotalSales
FROM sales s
JOIN products p ON s.PID = p.PID
GROUP BY p.Product
ORDER BY TotalSales DESC
LIMIT 5;

-- 3. Average Boxes Sold Per Salesperson
SELECT sp.Salesperson, AVG(s.Boxes) AS AvgBoxes
FROM sales s
JOIN people sp ON s.SPID = sp.SPID
GROUP BY sp.Salesperson
ORDER BY AvgBoxes DESC;

-- 4. Sales by Product Category (Subquery filtering > 100000)
SELECT Category, TotalSales FROM (
  SELECT p.Category, SUM(s.Amount) AS TotalSales
  FROM sales s
  JOIN products p ON s.PID = p.PID
  GROUP BY p.Category
) AS CategorySales
WHERE TotalSales > 100000;

-- 5. LEFT JOIN: Products with or without sales
SELECT p.Product, SUM(s.Amount) AS TotalSales
FROM products p
LEFT JOIN sales s ON p.PID = s.PID
GROUP BY p.Product;

-- 6. RIGHT JOIN: Geos with sales (if using MySQL)
SELECT g.Geo, SUM(s.Amount) AS TotalSales
FROM geo g
RIGHT JOIN sales s ON s.GeoID = g.GeoID
GROUP BY g.Geo;

