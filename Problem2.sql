-- Problem 2 : What is the  average annual price increase of products in this database, if any. 
select id,name, avg(price_increase) from
	(select p.id,p.name,year(placed_on) year,
		max(oi.price) - min(oi.price)  price_increase
		from orders o,order_items oi, product_variations pv, products p
		where p.id = pv.product and pv.id = oi.product_variation
			and oi.order=o.id
		group by p.id,p.name,year(placed_on))       product_price_increase_by_year
 group by id,name
