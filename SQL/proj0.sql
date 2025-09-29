CREATE TABLE skateshop (id INTEGER PRIMARY KEY, item TEXT, item_type TEXT, location TEXT, price INTEGER);

INSERT INTO skateshop VALUES(1, 'Element Skateboard Deck', 'Deck', 'Wall Display', 65);
INSERT INTO skateshop VALUES(2, 'Independent Trucks 139', 'Trucks', 'Shelf 2', 55);
INSERT INTO skateshop VALUES(3, 'Spitfire Formula Four Wheels 52mm', 'Wheels', 'Shelf 1', 40);
INSERT INTO skateshop VALUES(4, 'Bones Reds Bearings', 'Bearings', 'Counter Display', 20);
INSERT INTO skateshop VALUES(5, 'Jessup Grip Tape', 'Grip Tape', 'Wall Display', 10);
INSERT INTO skateshop VALUES(6, 'Santa Cruz Complete Skateboard', 'Complete', 'Rack', 120);
INSERT INTO skateshop VALUES(7, 'Vans Old Skool Shoes', 'Shoes', 'Shoe Wall', 75);
INSERT INTO skateshop VALUES(8, 'Thrasher Hoodie', 'Apparel', 'Clothing Rack', 65);
INSERT INTO skateshop VALUES(9, 'Helmet - Pro-Tec Classic', 'Safety Gear', 'Safety Section', 50);
INSERT INTO skateshop VALUES(10, 'Knee Pads - Triple Eight', 'Safety Gear', 'Safety Section', 45);
INSERT INTO skateshop VALUES(11, 'Skate Tool - Silver', 'Accessories', 'Shelf 2', 12);
INSERT INTO skateshop VALUES(12, 'Backpack - Nike SB RPM', 'Bags', 'Clothing Rack', 90);
INSERT INTO skateshop VALUES(13, 'Sticker Pack - Assorted Brands', 'Accessories', 'Counter Display', 5);
INSERT INTO skateshop VALUES(14, 'Powell Peralta Reissue Deck', 'Decks', 'Wall Display', 80);
INSERT INTO skateshop VALUES(15, 'Primitive T-Shirt', 'Apparel', 'Clothing Rack', 35);

SELECT * FROM skateshop ORDER BY price;

/* Count all items in each category, return total item count */
SELECT item_type, COUNT(*) AS total_items FROM skateshop GROUP BY item_type;
SELECT COUNT(*) AS Total_inventory_count FROM skateshop;