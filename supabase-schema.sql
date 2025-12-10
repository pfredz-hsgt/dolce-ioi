-- Lunch Order Coordination App Database Schema
-- Run this in your Supabase SQL Editor

-- Menus table
CREATE TABLE menus (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  menu_date DATE NOT NULL,
  is_closed BOOLEAN DEFAULT FALSE
);

-- Menu items table
CREATE TABLE menu_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  menu_id UUID REFERENCES menus(id) ON DELETE CASCADE,
  item_name TEXT NOT NULL,
  price NUMERIC(10, 2) DEFAULT 0.00,
  category TEXT DEFAULT 'General Menu',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Orders table
CREATE TABLE orders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  menu_id UUID REFERENCES menus(id) ON DELETE CASCADE,
  customer_name TEXT NOT NULL,
  remarks TEXT,
  is_paid BOOLEAN DEFAULT FALSE,
  is_delivery BOOLEAN DEFAULT FALSE,
  delivery_address TEXT,
  phone_number TEXT,
  total_amount NUMERIC(10, 2) DEFAULT 0.00,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Order details table
CREATE TABLE order_details (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  item_name TEXT NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 1,
  price NUMERIC(10, 2) DEFAULT 0.00
);

-- Indexes for performance
CREATE INDEX idx_menu_items_menu_id ON menu_items(menu_id);
CREATE INDEX idx_orders_menu_id ON orders(menu_id);
CREATE INDEX idx_order_details_order_id ON order_details(order_id);
CREATE INDEX idx_menus_date ON menus(menu_date DESC);
