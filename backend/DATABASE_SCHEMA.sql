CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(190) UNIQUE,
  phone VARCHAR(40) UNIQUE,
  password VARCHAR(255) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'active',
  email_verified_at TIMESTAMP NULL,
  phone_verified_at TIMESTAMP NULL,
  remember_token VARCHAR(100),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE user_profiles (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  avatar_path VARCHAR(255),
  date_of_birth DATE,
  gender VARCHAR(30),
  locale VARCHAR(10) NOT NULL DEFAULT 'en',
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE personal_access_tokens (
  id BIGSERIAL PRIMARY KEY,
  tokenable_type VARCHAR(190) NOT NULL,
  tokenable_id BIGINT NOT NULL,
  name VARCHAR(255) NOT NULL,
  token VARCHAR(64) UNIQUE NOT NULL,
  abilities TEXT,
  last_used_at TIMESTAMP NULL,
  expires_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE permissions (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  guard_name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  UNIQUE(name, guard_name)
);

CREATE TABLE roles (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  guard_name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  UNIQUE(name, guard_name)
);

CREATE TABLE model_has_permissions (
  permission_id BIGINT NOT NULL REFERENCES permissions(id) ON DELETE CASCADE,
  model_type VARCHAR(255) NOT NULL,
  model_id BIGINT NOT NULL,
  PRIMARY KEY(permission_id, model_id, model_type)
);

CREATE TABLE model_has_roles (
  role_id BIGINT NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
  model_type VARCHAR(255) NOT NULL,
  model_id BIGINT NOT NULL,
  PRIMARY KEY(role_id, model_id, model_type)
);

CREATE TABLE role_has_permissions (
  permission_id BIGINT NOT NULL REFERENCES permissions(id) ON DELETE CASCADE,
  role_id BIGINT NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
  PRIMARY KEY(permission_id, role_id)
);

CREATE TABLE customer_addresses (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  label VARCHAR(80),
  address_line TEXT NOT NULL,
  city VARCHAR(120) NOT NULL,
  district VARCHAR(120),
  latitude NUMERIC(10,7) NOT NULL,
  longitude NUMERIC(10,7) NOT NULL,
  is_default BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE restaurants (
  id BIGSERIAL PRIMARY KEY,
  owner_id BIGINT NOT NULL REFERENCES users(id),
  name VARCHAR(180) NOT NULL,
  slug VARCHAR(220) UNIQUE NOT NULL,
  description TEXT,
  logo_path VARCHAR(255),
  cover_path VARCHAR(255),
  status VARCHAR(30) NOT NULL DEFAULT 'pending',
  default_commission_rate NUMERIC(5,2) NOT NULL DEFAULT 20.00,
  rating NUMERIC(3,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE restaurant_branches (
  id BIGSERIAL PRIMARY KEY,
  restaurant_id BIGINT NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
  name VARCHAR(180) NOT NULL,
  phone VARCHAR(40),
  address TEXT NOT NULL,
  city VARCHAR(120) NOT NULL,
  latitude NUMERIC(10,7) NOT NULL,
  longitude NUMERIC(10,7) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'active',
  is_open BOOLEAN NOT NULL DEFAULT false,
  min_order_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  avg_preparation_minutes INTEGER NOT NULL DEFAULT 30,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE categories (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  slug VARCHAR(150) UNIQUE NOT NULL,
  type VARCHAR(40) NOT NULL DEFAULT 'restaurant',
  icon_path VARCHAR(255),
  is_active BOOLEAN NOT NULL DEFAULT true,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE restaurant_categories (
  restaurant_id BIGINT NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
  category_id BIGINT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  PRIMARY KEY (restaurant_id, category_id)
);

CREATE TABLE menus (
  id BIGSERIAL PRIMARY KEY,
  branch_id BIGINT NOT NULL REFERENCES restaurant_branches(id) ON DELETE CASCADE,
  name VARCHAR(150) NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE menu_sections (
  id BIGSERIAL PRIMARY KEY,
  menu_id BIGINT NOT NULL REFERENCES menus(id) ON DELETE CASCADE,
  name VARCHAR(150) NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE products (
  id BIGSERIAL PRIMARY KEY,
  branch_id BIGINT NOT NULL REFERENCES restaurant_branches(id) ON DELETE CASCADE,
  menu_section_id BIGINT NULL REFERENCES menu_sections(id) ON DELETE SET NULL,
  name VARCHAR(180) NOT NULL,
  description TEXT,
  price NUMERIC(12,2) NOT NULL,
  sale_price NUMERIC(12,2),
  status VARCHAR(30) NOT NULL DEFAULT 'active',
  is_available BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE product_images (
  id BIGSERIAL PRIMARY KEY,
  product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  path VARCHAR(255) NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE product_sizes (
  id BIGSERIAL PRIMARY KEY,
  product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  name VARCHAR(120) NOT NULL,
  price NUMERIC(12,2) NOT NULL,
  sale_price NUMERIC(12,2),
  is_default BOOLEAN NOT NULL DEFAULT false,
  is_available BOOLEAN NOT NULL DEFAULT true,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE product_options (
  id BIGSERIAL PRIMARY KEY,
  product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  name VARCHAR(150) NOT NULL,
  min_select INTEGER NOT NULL DEFAULT 0,
  max_select INTEGER NOT NULL DEFAULT 1,
  is_required BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE product_option_values (
  id BIGSERIAL PRIMARY KEY,
  product_option_id BIGINT NOT NULL REFERENCES product_options(id) ON DELETE CASCADE,
  name VARCHAR(150) NOT NULL,
  price_delta NUMERIC(12,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE carts (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  branch_id BIGINT NOT NULL REFERENCES restaurant_branches(id) ON DELETE CASCADE,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  UNIQUE(user_id, branch_id)
);

CREATE TABLE cart_items (
  id BIGSERIAL PRIMARY KEY,
  cart_id BIGINT NOT NULL REFERENCES carts(id) ON DELETE CASCADE,
  product_id BIGINT NOT NULL REFERENCES products(id),
  quantity INTEGER NOT NULL,
  unit_price NUMERIC(12,2) NOT NULL,
  options JSONB,
  notes TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE drivers (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  status VARCHAR(30) NOT NULL DEFAULT 'pending',
  vehicle_type VARCHAR(40),
  is_available BOOLEAN NOT NULL DEFAULT false,
  current_latitude NUMERIC(10,7),
  current_longitude NUMERIC(10,7),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE orders (
  id BIGSERIAL PRIMARY KEY,
  order_number VARCHAR(40) UNIQUE NOT NULL,
  customer_id BIGINT NOT NULL REFERENCES users(id),
  branch_id BIGINT NOT NULL REFERENCES restaurant_branches(id),
  driver_id BIGINT NULL REFERENCES drivers(id),
  address_id BIGINT NULL REFERENCES customer_addresses(id),
  status VARCHAR(40) NOT NULL DEFAULT 'pending',
  subtotal NUMERIC(12,2) NOT NULL,
  delivery_fee NUMERIC(12,2) NOT NULL DEFAULT 0,
  discount_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  tax_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  total_amount NUMERIC(12,2) NOT NULL,
  payment_status VARCHAR(30) NOT NULL DEFAULT 'pending',
  payment_method VARCHAR(40) NOT NULL DEFAULT 'cash',
  notes TEXT,
  placed_at TIMESTAMP NULL,
  accepted_at TIMESTAMP NULL,
  delivered_at TIMESTAMP NULL,
  cancelled_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE order_items (
  id BIGSERIAL PRIMARY KEY,
  order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id BIGINT NULL REFERENCES products(id) ON DELETE SET NULL,
  product_name VARCHAR(180) NOT NULL,
  quantity INTEGER NOT NULL,
  unit_price NUMERIC(12,2) NOT NULL,
  total_price NUMERIC(12,2) NOT NULL,
  options JSONB,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE order_status_histories (
  id BIGSERIAL PRIMARY KEY,
  order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  actor_id BIGINT NULL REFERENCES users(id) ON DELETE SET NULL,
  status VARCHAR(40) NOT NULL,
  note TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE payments (
  id BIGSERIAL PRIMARY KEY,
  order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  provider VARCHAR(80),
  amount NUMERIC(12,2) NOT NULL,
  currency VARCHAR(3) NOT NULL DEFAULT 'SAR',
  status VARCHAR(30) NOT NULL DEFAULT 'pending',
  provider_reference VARCHAR(190),
  paid_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE coupons (
  id BIGSERIAL PRIMARY KEY,
  code VARCHAR(80) UNIQUE NOT NULL,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  discount_type VARCHAR(30) NOT NULL,
  discount_value NUMERIC(12,2) NOT NULL,
  max_discount_amount NUMERIC(12,2),
  min_order_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  usage_limit INTEGER,
  usage_limit_per_user INTEGER,
  starts_at TIMESTAMP NULL,
  ends_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'active',
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE coupon_usages (
  id BIGSERIAL PRIMARY KEY,
  coupon_id BIGINT NOT NULL REFERENCES coupons(id) ON DELETE CASCADE,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  order_id BIGINT NULL REFERENCES orders(id) ON DELETE SET NULL,
  discount_amount NUMERIC(12,2) NOT NULL,
  used_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  UNIQUE(coupon_id, order_id)
);

CREATE TABLE favorite_restaurants (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  restaurant_id BIGINT NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  UNIQUE(user_id, restaurant_id)
);

CREATE TABLE favorite_products (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  UNIQUE(user_id, product_id)
);

CREATE TABLE reward_points (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  balance INTEGER NOT NULL DEFAULT 0,
  lifetime_earned INTEGER NOT NULL DEFAULT 0,
  lifetime_redeemed INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE reward_transactions (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  order_id BIGINT NULL REFERENCES orders(id) ON DELETE SET NULL,
  type VARCHAR(30) NOT NULL,
  points INTEGER NOT NULL,
  balance_after INTEGER NOT NULL,
  reason VARCHAR(190),
  expires_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE referrals (
  id BIGSERIAL PRIMARY KEY,
  referrer_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  referred_id BIGINT NULL REFERENCES users(id) ON DELETE SET NULL,
  code VARCHAR(40) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pending',
  qualified_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE referral_rewards (
  id BIGSERIAL PRIMARY KEY,
  referral_id BIGINT NOT NULL REFERENCES referrals(id) ON DELETE CASCADE,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  reward_type VARCHAR(30) NOT NULL,
  reward_value NUMERIC(12,2) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pending',
  granted_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE subscription_plans (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  code VARCHAR(80) UNIQUE NOT NULL,
  price NUMERIC(12,2) NOT NULL,
  billing_cycle VARCHAR(30) NOT NULL DEFAULT 'monthly',
  commission_rate NUMERIC(5,2),
  features JSONB,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE restaurant_subscriptions (
  id BIGSERIAL PRIMARY KEY,
  restaurant_id BIGINT NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
  subscription_plan_id BIGINT NOT NULL REFERENCES subscription_plans(id),
  status VARCHAR(30) NOT NULL DEFAULT 'active',
  starts_at TIMESTAMP NOT NULL,
  ends_at TIMESTAMP NULL,
  renews_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE commission_rules (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  scope VARCHAR(40) NOT NULL DEFAULT 'platform',
  restaurant_id BIGINT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
  subscription_plan_id BIGINT NULL REFERENCES subscription_plans(id) ON DELETE SET NULL,
  commission_type VARCHAR(30) NOT NULL DEFAULT 'percentage',
  commission_value NUMERIC(12,2) NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT true,
  starts_at TIMESTAMP NULL,
  ends_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE order_commissions (
  id BIGSERIAL PRIMARY KEY,
  order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  restaurant_id BIGINT NOT NULL REFERENCES restaurants(id),
  rule_id BIGINT NULL REFERENCES commission_rules(id) ON DELETE SET NULL,
  gross_amount NUMERIC(12,2) NOT NULL,
  platform_commission NUMERIC(12,2) NOT NULL,
  restaurant_net_amount NUMERIC(12,2) NOT NULL,
  driver_earning NUMERIC(12,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE driver_earnings (
  id BIGSERIAL PRIMARY KEY,
  driver_id BIGINT NOT NULL REFERENCES drivers(id) ON DELETE CASCADE,
  order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  base_amount NUMERIC(12,2) NOT NULL,
  bonus_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  total_amount NUMERIC(12,2) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE settlements (
  id BIGSERIAL PRIMARY KEY,
  settlement_number VARCHAR(40) UNIQUE NOT NULL,
  type VARCHAR(30) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'draft',
  period_start DATE NOT NULL,
  period_end DATE NOT NULL,
  total_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  approved_at TIMESTAMP NULL,
  paid_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE settlement_items (
  id BIGSERIAL PRIMARY KEY,
  settlement_id BIGINT NOT NULL REFERENCES settlements(id) ON DELETE CASCADE,
  order_id BIGINT NULL REFERENCES orders(id) ON DELETE SET NULL,
  restaurant_id BIGINT NULL REFERENCES restaurants(id) ON DELETE SET NULL,
  driver_id BIGINT NULL REFERENCES drivers(id) ON DELETE SET NULL,
  amount NUMERIC(12,2) NOT NULL,
  item_type VARCHAR(30) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  type VARCHAR(190) NOT NULL,
  notifiable_type VARCHAR(190) NOT NULL,
  notifiable_id BIGINT NOT NULL,
  data JSONB NOT NULL,
  read_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE device_tokens (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token VARCHAR(255) NOT NULL,
  platform VARCHAR(30) NOT NULL,
  device_name VARCHAR(120),
  last_used_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  UNIQUE(user_id, token)
);

CREATE TABLE reviews (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  order_id BIGINT NULL REFERENCES orders(id) ON DELETE SET NULL,
  restaurant_id BIGINT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
  product_id BIGINT NULL REFERENCES products(id) ON DELETE CASCADE,
  driver_id BIGINT NULL REFERENCES drivers(id) ON DELETE SET NULL,
  rating INTEGER NOT NULL,
  comment TEXT,
  status VARCHAR(30) NOT NULL DEFAULT 'published',
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE review_images (
  id BIGSERIAL PRIMARY KEY,
  review_id BIGINT NOT NULL REFERENCES reviews(id) ON DELETE CASCADE,
  path VARCHAR(255) NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE support_tickets (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  order_id BIGINT NULL REFERENCES orders(id) ON DELETE SET NULL,
  subject VARCHAR(190) NOT NULL,
  category VARCHAR(80) NOT NULL,
  priority VARCHAR(30) NOT NULL DEFAULT 'normal',
  status VARCHAR(30) NOT NULL DEFAULT 'open',
  assigned_to BIGINT NULL REFERENCES users(id) ON DELETE SET NULL,
  closed_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE ticket_messages (
  id BIGSERIAL PRIMARY KEY,
  support_ticket_id BIGINT NOT NULL REFERENCES support_tickets(id) ON DELETE CASCADE,
  sender_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  message TEXT NOT NULL,
  attachments JSONB,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE complaints (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  order_id BIGINT NULL REFERENCES orders(id) ON DELETE SET NULL,
  restaurant_id BIGINT NULL REFERENCES restaurants(id) ON DELETE SET NULL,
  driver_id BIGINT NULL REFERENCES drivers(id) ON DELETE SET NULL,
  complaint_type VARCHAR(80) NOT NULL,
  description TEXT NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'open',
  resolution TEXT,
  resolved_at TIMESTAMP NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE audit_logs (
  id BIGSERIAL PRIMARY KEY,
  actor_id BIGINT NULL REFERENCES users(id) ON DELETE SET NULL,
  auditable_type VARCHAR(190),
  auditable_id BIGINT,
  event VARCHAR(80) NOT NULL,
  old_values JSONB,
  new_values JSONB,
  ip_address VARCHAR(64),
  user_agent TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE INDEX idx_orders_customer_status ON orders(customer_id, status);
CREATE INDEX idx_orders_branch_status ON orders(branch_id, status);
CREATE INDEX idx_driver_earnings_status ON driver_earnings(status);
CREATE INDEX idx_reward_transactions_user ON reward_transactions(user_id, created_at);
CREATE INDEX idx_coupon_usages_user ON coupon_usages(user_id, used_at);
CREATE INDEX idx_notifications_notifiable ON notifications(notifiable_type, notifiable_id);
CREATE INDEX idx_reviews_targets ON reviews(restaurant_id, product_id, driver_id);
CREATE INDEX idx_support_tickets_status ON support_tickets(status, priority);
CREATE INDEX idx_audit_logs_auditable ON audit_logs(auditable_type, auditable_id);
