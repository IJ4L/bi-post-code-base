CREATE TABLE
    Produk (
        id_produk SERIAL PRIMARY KEY,
        nama_produk VARCHAR(100) NOT NULL,
        harga DECIMAL(10, 2) NOT NULL,
        stok INT NOT NULL,
        kategori VARCHAR(50) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    );