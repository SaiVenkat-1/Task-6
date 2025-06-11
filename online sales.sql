use abc

select * from online_sales

alter table online_sales
alter column [date] Date

select [product category] ,sum([total revenue]) as 'maximum sales' from online_sales
group by [Product category]
order by sum([total revenue]) desc

--extracting month and year for displaying their individual sales revenue
select 
       year([date]) as order_year,
       month([date]) as order_month,
	   sum([total revenue]) as total_revenue,
	   count([transaction id]) as order_count  from online_sales
	   where [date] between '2024-01-01' and '2024-12-31'
	   group by
	    year([date]), month([date])
		order by order_year,order_month 

-- top 5 product sales with region
select  top 5  [region],[product name] ,sum([total revenue]) as total_revenue from online_sales
group by [region],[product name]
order by total_revenue desc

--  total units sold by product category
select [product category],sum([units sold]) as total_units_sold from online_sales
group by [product category]
order by total_units_sold desc

-- total revenue by payment method
select [payment method],sum([total revenue]) as total_revenue from online_sales
group by [payment method]
order by total_revenue desc


--Average order value by month
SELECT
    YEAR([Date]) AS order_year,
    MONTH([Date]) AS order_month,
    SUM([Total Revenue]) / COUNT(DISTINCT [Transaction ID]) AS avg_order_value
FROM
    online_sales
WHERE
    [Date] IS NOT NULL
GROUP BY
    YEAR([Date]),MONTH([Date])
ORDER BY
    order_year,order_month