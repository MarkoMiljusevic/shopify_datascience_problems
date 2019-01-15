-- Problem 1 : Are there incidences of shops are increasing their prices? Does it occur on a regular basis?
select product_id , name, year, count(year) from (
select p.id product_id, p.name, year(placed_on) year, oi.price, count(*)
from products p, order_items oi, orders o, product_variations pv WHERE p.id = pv.product and pv.id = oi.product_variation and oi.order = o.id group by p.id, p.name, year(placed_on), oi.price) orders_by_product
group by product_id , name, year
