
use restaurent_orders;
select * from menu_items; 
select * from  order_details ; 

-- write a Query to find total No of items on Menu 
select  count(item_name) as total_items  from menu_items; 

-- what are the least & most expensive items on menu ?

select item_name ,  price as most_expensive_price   from menu_items 
order by 2 desc 
limit 1;

select item_name ,  price as least_expensive_price  from menu_items 
order by 2 
limit 1;

-- How many Itelian Dishes are on menu ? what are the least & most expensive italian dishes on menu ?

select   count(item_name)  as total_items from menu_items 
where category = 'italian' ;


select *   from menu_items 
where category = 'italian' 
order by price  desc
limit 1;

select *   from menu_items 
where category = 'italian' 
order by price 
limit 1;

-- How Many dishes are in each category ? what is the average dish price within each category ?

select category , count(item_name) as total_dishes , round(avg(price),2)   as avg_price  from menu_items 
group by 1;  

--  what is the date range of the table ?
select min(order_date)  as order_start_date , max(order_date) as order_end_date from order_details;

-- How Many orders were made within this date range ?

select count( distinct order_id)  as total_orders from order_details;

--  which orders had the most number_of_items ? 
select order_id , count(item_id)  as orders from order_details
group by 1
order by orders desc;

-- how many orders having more than 12 items ?
select count(order_id)  as num_orders  from
(select order_id , count(item_id)  as orders from order_details
group by 1
having  orders > 12 ) as orders;

--  combine Menu Items & order detail tables into a single table 
select * from  menu_items m  
right  join order_details o on m.ï»¿menu_item_id = o.item_id;

--   what were the least & most ordered items ?  what categories where they in ?
select m.item_name , m.category,  count(order_id)  as most_orderd_items   from  menu_items m  
right join order_details o on m.ï»¿menu_item_id = o.item_id
group by 1 ,2 
order  by 3 desc 
limit 1;

select m.item_name ,  m.category , count(order_id)  as least_orderd_items   from  menu_items m  
right join order_details o on m.ï»¿menu_item_id = o.item_id
group by 1 , 2
order  by 3
limit 1;

--  what are the top 5 orders that spent the Most Money ?

select  d.order_id , round(sum(m.price),0) as Most_spending  from order_details d 
left  join menu_items m on m.ï»¿menu_item_id = d.item_id
group by 1
order by 2 desc 
limit 5;

-- view the details of the highest spend order ?  what insights can you gather from  the result ?

select d.order_id ,  m.category ,  round(sum(m.price),0) as Most_spending  from order_details d 
left  join menu_items m on m.ï»¿menu_item_id = d.item_id
group by 1,2
order by 3 desc 
limit 1;

-- view the details of the top 5 highest spend orders ? what insights can you gather  from the result ?

select d.order_id ,  m.category ,  round(sum(m.price),0) as Most_spending  from order_details d 
left  join menu_items m on m.ï»¿menu_item_id = d.item_id
group by 1,2
order by 3 desc 
limit 5






















