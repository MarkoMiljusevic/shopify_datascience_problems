-- Problem 6 : Based on your findings above, would you recommend building the new feature? Why or why not?
select p.id,p.name,year(placed_on), min(oi.price),
max(oi.price),max(oi.price) - min(oi.price)
from orders o,order_items oi, product_variations pv, products p
where p.id = pv.product and pv.id = oi.product_variation
and oi.order=o.id
group by p.id,p.name,year(placed_on)
having max(oi.price) - min(oi.price)=0
