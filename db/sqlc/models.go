// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0

package db

import (
	"time"
)

type Produk struct {
	IDProduk   int32     `json:"id_produk"`
	NamaProduk string    `json:"nama_produk"`
	Harga      string    `json:"harga"`
	Stok       int32     `json:"stok"`
	Kategori   string    `json:"kategori"`
	CreatedAt  time.Time `json:"created_at"`
}