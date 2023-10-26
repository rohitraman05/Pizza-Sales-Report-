Select * from pizza_sales;

Select SUM(total_price) As total_revenue from pizza_sales;  --The sum of total price of pizza order

Select SUM(total_price) / COUNT(distinct order_id) As AVG_ordervalue from pizza_sales;  --The average amount spend per order

Select SUM(quantity) As total_pizza_sold from pizza_sales; --The sum of quantites of all pizza sold

Select COUNT( distinct order_id) as total_orders from pizza_sales; --Total number of orders placed

Select Cast(Cast(SUM(quantity)AS decimal(10,2)) / cast(COUNT(distinct order_id)AS decimal(10,2)) AS decimal(10,2)) as avg_pizza_sold from pizza_sales;
--Average number of pizza sold per order.cast for Decimal upto 2 places.

Select DATENAME(DW, order_date) as order_day, COUNT(distinct order_id) As Total_orders from pizza_sales
Group by Datename(DW, order_date);  --Daily trends in total order

Select DATENAME(Month, order_date) As month_name, COUNT(distinct order_id) As total_orders from pizza_sales
group by DATENAME(month, order_date)
Order by total_orders DESC; --Mothly trend in order

Select pizza_category, SUM(total_price) as total_sales, SUM(total_price)*100 / (Select SUM(total_price) from pizza_sales) As pizza_sales_percentage from pizza_sales
--Where MONTH(order_date) = 1
group by pizza_category
order by pizza_sales_percentage;  --Percentage of sales by Pizza Category

Select pizza_size, SUM(total_price) as total_sales, SUM(total_price)*100 / (Select SUM(total_price) from pizza_sales) As pizza_sales_percentage from pizza_sales
--Where MONTH(order_date) = 1
group by pizza_size
order by pizza_sales_percentage;   --Percentage of sales by Pizza Size

---Top/Bottom 5 best sellers by revenue, total Quantity, total orders.

Select top 5 pizza_name, SUM(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue DESC;

Select top 5 pizza_name, SUM(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue;

Select top 5 pizza_name, SUM(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity;

Select top 5 pizza_name, SUM(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity DESC;







