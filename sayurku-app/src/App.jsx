import { useState } from "react";

function App() {
  const [cart, setCart] = useState([]);

  const products = [
    { id: 1, name: "Bayam", price: 5000, emoji: "🥬" },
    { id: 2, name: "Tomat", price: 8000, emoji: "🍅" },
    { id: 3, name: "Wortel", price: 10000, emoji: "🥕" },
    { id: 4, name: "Cabai", price: 12000, emoji: "🌶️" },
  ];

  const addToCart = (product) => {
    setCart([...cart, product]);
    alert(`${product.name} ditambahkan ke keranjang 🛒`);
  };

  return (
    <div className="min-h-screen bg-green-50 p-4">
      <header className="text-center mb-6">
        <h1 className="text-3xl font-bold text-green-700 flex items-center justify-center gap-2">
          🌱 Sayurku
        </h1>
        <p className="text-gray-600">Belanja sayur segar, mudah & cepat!</p>
      </header>

      <div className="grid grid-cols-2 sm:grid-cols-3 gap-4">
        {products.map((item) => (
          <div
            key={item.id}
            className="bg-white shadow-md rounded-xl p-4 flex flex-col items-center"
          >
            <div className="text-5xl">{item.emoji}</div>
            <h2 className="text-lg font-semibold mt-2">{item.name}</h2>
            <p className="text-green-600 font-medium">
              Rp{item.price.toLocaleString()}
            </p>
            <button
              onClick={() => addToCart(item)}
              className="mt-3 bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded-lg w-full"
            >
              Beli
            </button>
          </div>
        ))}
      </div>

      <footer className="fixed bottom-0 left-0 right-0 bg-white shadow-lg p-3 flex justify-between items-center">
        <span className="font-medium text-gray-700">🛒 Keranjang</span>
        <span className="text-green-600 font-bold">
          {cart.length} item
        </span>
      </footer>
    </div>
  );
}

export default App;
