.read data.sql


CREATE TABLE average_prices AS
  SELECT category as category, AVG(msrp) as average_price FROM products GROUP BY category;
  -- alternate solution
  -- SELECT category, SUM(msrp)/COUNT(*) FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory GROUP BY item;
  -- alternate solution
  -- SELECT * FROM inventory GROUP BY item HAVING MIN(price);


CREATE TABLE shopping_list AS
  SELECT name, store FROM products AS p, lowest_prices AS l
    WHERE l.item = p.name
    GROUP BY category HAVING MIN(MSRP/rating);


CREATE TABLE total_bandwidth AS
  SELECT SUM(s.mbs) FROM stores AS s, shopping_list AS sl WHERE s.store = sl.store;

