# 🍱 Luncheon Order - Lunch Coordination App

A mobile-first web application for coordinating daily lunch orders from WhatsApp menu messages, built with Next.js 14+, styled with Ant-Design Mobile, and Supabase.

## ✨ Features

- **Menu Parser**: Paste WhatsApp messages and automatically extract menu items
- **Auto-add "Nasi Putih"**: Always includes rice as the first item
- **Order Management**: Customers can easily select items with quantity pickers
- **Order Summary**: View all orders, track payments, and manage status
- **WhatsApp Integration**: Copy formatted order list to send to merchants
- **Order Control**: Admin can close orders to prevent new submissions
- **Multiple Orders**: One person can submit orders for multiple people
- **Vibrant Minimalist Design**: Professional, clean UI with vibrant colors

## 🚀 Setup Instructions

### 1. Supabase Setup

1. Create a free account at [supabase.com](https://supabase.com)
2. Create a new project
3. Go to **SQL Editor** and run the schema from `supabase-schema.sql`
4. Get your project credentials:
   - Go to **Settings** → **API**
   - Copy your **Project URL** and **anon/public API key**

### 2. Environment Variables

Create a `.env.local` file in the project root:

```env
NEXT_PUBLIC_SUPABASE_URL=your-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

Replace with your actual Supabase credentials.

### 3. Install Dependencies

```bash
npm install
```

### 4. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## 📱 How to Use

### For Admins (Creating Menu):

1. Visit the home page (`/create`)
2. Paste your WhatsApp menu message
3. Select the menu date (defaults to today)
4. Toggle "Order Status" if you want to close orders
5. Click "Create Menu"
6. Share the web link with your colleagues (it will automatically fetch latest menu)

### For Customers (Placing Orders):

1. Open the order link shared by admin
2. Enter your name
3. Select quantities for each item using +/- buttons
4. Add remarks (optional)
5. Click "Submit Order"
6. Click "View Order Summary" to view all currently placed order

### For Admins (Managing Orders):

1. Go to the summary page (`/summary/[menuId]`)
2. View all submitted orders
3. Mark orders as paid using checkboxes
4. Edit or delete orders as needed
5. Toggle "Close Orders" to prevent new submissions
6. Click "Copy to WhatsApp" to send the compiled list to the merchant

## 🎨 Color Scheme

The app uses a vibrant yet professional minimalist color palette:

- **Primary**: `#0EA5E9` (Sky Blue)
- **Success**: `#10B981` (Emerald Green)
- **Danger**: `#EF4444` (Red)
- **Warning**: `#F59E0B` (Amber)

## 📦 Tech Stack

- **Frontend**: Next.js 14+ (App Router)
- **Styling**: Tailwind CSS v4
- **Icons**: Lucide React
- **Database**: Supabase (PostgreSQL)
- **Deployment**: Vercel (free tier)

## 🌐 Deployment

### Vercel Deployment

1. Push your code to GitHub
2. Import your repository on [vercel.com](https://vercel.com)
3. Add environment variables in Vercel dashboard:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
4. Deploy!

## 📁 Project Structure

```
luncheon-hsgt/
├── app/
│   ├── page.tsx                    # Admin menu creation
│   ├── order/[menuId]/page.tsx     # Customer order form
│   ├── summary/[menuId]/page.tsx   # Order summary
│   ├── layout.tsx                  # Root layout
│   └── globals.css                 # Global styles
├── components/
│   ├── QuantityPicker.jsx          # +/- quantity selector
│   └── OrderCard.jsx               # Order display card
├── lib/
│   ├── supabase.js                 # Supabase client
│   └── utils.js                    # Utilities (parser, formatter)
└── supabase-schema.sql             # Database schema
```

## 🔧 Database Schema

- **menus**: Stores daily menus with date and closed status
- **menu_items**: Individual food items for each menu
- **orders**: Customer orders with name, remarks, and payment status
- **order_details**: Line items for each order with quantities

## 📝 License

MIT

## 🤝 Support

Created with ❤️ for easy lunch coordination!
