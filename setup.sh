#!/bin/bash

# Nama project
APP_NAME="sayurku-app"

# Hapus project lama kalau ada
rm -rf $APP_NAME

# Buat project baru pake Vite (React + JS)
npm create vite@latest $APP_NAME -- --template react

# Masuk ke folder project
cd $APP_NAME

# Install dependency
npm install

# Install TailwindCSS + plugin
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# Konfigurasi tailwind.config.js
cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

# Buat index.css isi Tailwind
cat > src/index.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# Buat App.jsx sederhana
cat > src/App.jsx <<EOL
export default function App() {
  return (
    <div className="min-h-screen bg-green-50 p-4">
      <header className="text-center py-4 bg-green-600 text-white rounded-xl shadow-md">
        <h1 className="text-2xl font-bold">🌱 Sayurku</h1>
        <p className="text-sm">Belanja sayur segar, mudah & cepat!</p>
      </header>

      <main className="mt-6 grid grid-cols-2 gap-4">
        {[
          { name: "Bayam", price: "Rp5.000", emoji: "🥬" },
          { name: "Tomat", price: "Rp8.000", emoji: "🍅" },
          { name: "Wortel", price: "Rp10.000", emoji: "🥕" },
          { name: "Cabai", price: "Rp15.000", emoji: "🌶️" },
        ].map((item) => (
          <div
            key={item.name}
            className="bg-white p-4 rounded-xl shadow hover:scale-105 transition"
          >
            <div className="text-4xl">{item.emoji}</div>
            <h2 className="font-semibold">{item.name}</h2>
            <p className="text-green-600">{item.price}</p>
            <button className="mt-2 w-full bg-green-500 text-white rounded-lg py-1 hover:bg-green-700">
              Beli
            </button>
          </div>
        ))}
      </main>
    </div>
  );
}
EOL

# Jalankan dev server
npm run dev
