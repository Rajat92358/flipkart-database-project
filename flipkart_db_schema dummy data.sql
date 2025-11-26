USE flipkart_db;

---------------------------
-- USERS
---------------------------
INSERT INTO users (username, email, password_hash, full_name, phone, role)
VALUES
('rahul123', 'rahul@example.com', 'HASH1', 'Rahul Sharma', '9876543210', 'customer'),
('seller_mobiles', 'seller1@example.com', 'HASH2', 'Mobile Store India', '9988776655', 'seller'),
('warehouse_guy', 'wh1@example.com', 'HASH3', 'Warehouse Staff 1', '9991112222', 'warehouse_staff'),
('admin01', 'admin@example.com', 'HASH4', 'Admin User', '9123456789', 'admin');

---------------------------
-- SELLERS
---------------------------
INSERT INTO sellers (user_id, business_name, gstin)
VALUES
(2, 'Mobile Store India Pvt Ltd', 'GSTIN12345');

---------------------------
-- CATEGORIES
---------------------------
INSERT INTO categories (parent_id, name, description)
VALUES
(NULL, 'Electronics', 'Electronic gadgets'),
(1, 'Mobiles', 'Smartphones and mobile phones'),
(NULL, 'Home Appliances', 'Appliances for home');

---------------------------
-- PRODUCTS
---------------------------
INSERT INTO products (seller_id, category_id, sku, title, description, price, mrp, weight_kg)
VALUES
(1, 2, 'SKU-MOB-001', 'Samsung Galaxy M14', '5G Smartphone', 14999, 16999, 0.350),
(1, 2, 'SKU-MOB-002', 'Redmi Note 12', 'Mid-range smartphone', 12999, 14999, 0.340),
(1, 1, 'SKU-ELEC-003', 'Boat Airdopes 161', 'Wireless earbuds', 1499, 1999, 0.050);

---------------------------
-- PRODUCT IMAGES
---------------------------
INSERT INTO product_images (product_id, url, alt_text, sort_order)
VALUES
(1, 'https://example.com/m14-1.jpg', 'Samsung Image 1', 1),
(2, 'https://example.com/redmi-1.jpg', 'Redmi Image 1', 1),
(3, 'https://example.com/airdopes.jpg', 'Boat Airdopes', 1);

---------------------------
-- SUPPLIERS
---------------------------
INSERT INTO suppliers (name, contact_name, phone, email, address)
VALUES
('Tech Distributors', 'Suresh Kumar', '9871234560', 'suresh@techdist.com', 'Delhi'),
('Electro Wholesale', 'Meena Gupta', '9988776655', 'contact@electrowh.com', 'Mumbai');

---------------------------
-- WAREHOUSES
---------------------------
INSERT INTO warehouses (name, address, phone, capacity)
VALUES
('Mumbai WH', 'Bhiwandi, Mumbai', '9000000001', 10000),
('Delhi WH', 'Dwarka, Delhi', '9000000002', 8000);

---------------------------
-- INVENTORY
---------------------------
INSERT INTO inventory (product_id, warehouse_id, quantity, reserved)
VALUES
(1, 1, 120, 10),
(1, 2, 80, 5),
(2, 1, 90, 2),
(3, 1, 200, 0);

---------------------------
-- PURCHASE ORDERS
---------------------------
INSERT INTO purchase_orders (supplier_id, warehouse_id, created_by, status, total_amount, expected_delivery_date)
VALUES
(1, 1, 3, 'ordered', 300000, '2025-02-05'),
(2, 2, 3, 'received', 150000, '2025-01-29');

---------------------------
-- PURCHASE ORDER ITEMS
---------------------------
INSERT INTO purchase_order_items (po_id, product_id, qty, unit_price, received_qty)
VALUES
(1, 1, 200, 14000, 150),
(1, 3, 100, 1200, 100),
(2, 2, 150, 12000, 150);

---------------------------
-- ORDERS
---------------------------
INSERT INTO orders (user_id, order_number, status, payment_status, total_amount, shipping_address)
VALUES
(1, 'ORD1001', 'confirmed', 'paid', 14999, 'Pune, Maharashtra'),
(1, 'ORD1002', 'shipped', 'paid', 12999, 'Pune, Maharashtra'),
(1, 'ORD1003', 'delivered', 'paid', 1499, 'Pune, Maharashtra');

---------------------------
-- ORDER ITEMS
---------------------------
INSERT INTO order_items (order_id, product_id, sku, quantity, unit_price, warehouse_id)
VALUES
(1, 1, 'SKU-MOB-001', 1, 14999, 1),
(2, 2, 'SKU-MOB-002', 1, 12999, 1),
(3, 3, 'SKU-ELEC-003', 1, 1499, 1);

---------------------------
-- CARRIERS
---------------------------
INSERT INTO carriers (name, phone, email)
VALUES
('BlueDart', '9000011111', 'support@bluedart.com'),
('Delhivery', '9000022222', 'help@delhivery.com');

---------------------------
-- SHIPMENTS
---------------------------
INSERT INTO shipments (order_id, carrier_id, tracking_number, shipped_at, expected_delivery)
VALUES
(2, 1, 'TRK123456', NOW(), DATE_ADD(NOW(), INTERVAL 4 DAY)),
(3, 2, 'TRK223344', NOW(), DATE_ADD(NOW(), INTERVAL 3 DAY));

---------------------------
-- LOGISTICS EVENTS
---------------------------
INSERT INTO logistics_events (shipment_id, location, event_type, remarks)
VALUES
(1, 'Mumbai Hub', 'Dispatched', 'Left warehouse'),
(1, 'Pune Hub', 'In Transit', 'Arriving soon'),
(2, 'Delhi Hub', 'Dispatched', 'Package shipped');

---------------------------
-- PAYMENTS
---------------------------
INSERT INTO payments (order_id, amount, method, status, transaction_ref)
VALUES
(1, 14999, 'upi', 'success', 'TXN-UPI-1111'),
(2, 12999, 'card', 'success', 'TXN-CARD-2222'),
(3, 1499, 'wallet', 'success', 'TXN-WALLET-3333');

---------------------------
-- RETURNS
---------------------------
INSERT INTO returns (order_item_id, reason, status)
VALUES
(2, 'Defective product', 'requested');

---------------------------
-- REVIEWS
---------------------------
INSERT INTO reviews (product_id, user_id, rating, title, body)
VALUES
(1, 1, 5, 'Amazing Phone', 'Battery life and performance are great!'),
(3, 1, 4, 'Good Earbuds', 'Decent sound quality for the price.');
