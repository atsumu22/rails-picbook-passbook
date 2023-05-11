import axios from 'axios';
import React, { useState } from 'react';
import BookCard from './BookCard';

const BookCardResult = (props) => {
  const { result } = props;
  const [ book, setBook ] = useState();

  const fetchedData = axios.get(`https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?format=json&isbn=${result}&applicationId=1018371623494845154`).then((res) => {
    if (res.data.Items.length === 0) {
      fetchingFromOpenBD(result);
    } else {
      setBook({
        title: res.data.Items[0].Item.title,
        author: res.data.Items[0].Item.author,
        publisher: res.data.Items[0].Item.publisherName,
        imageUrl: res.data.Items[0].Item.mediumImageUrl,
        price: res.data.Items[0].Item.itemPrice
      })
    };
    // console.log(res.data.Items[0].Item);
  });

  const fetchingFromOpenBD = (result) => {
    axios.get(`https://api.openbd.jp/v1/get?isbn=${result}`).then((res) => {
      if (res.data[0] === null) {
        // console.log("APIが存在しない")
        setBook(null)
      } else {
        if (res.data[0].onix.ProductSupply.SupplyDetail.Price) {
          console.log(res.data[0].onix.ProductSupply.SupplyDetail.Price[0].PriceAmount);
          setBook({
            title: res.data[0].summary.title,
            author: res.data[0].summary.author,
            publisher: res.data[0].summary.publisher,
            imageUrl: res.data[0].summary.cover,
            price: res.data[0].onix.ProductSupply.SupplyDetail.Price[0].PriceAmount
            // priceのプロパティに演算子を設定。Price情報が存在するなら、価格詳細をプロパティ値としてセット、存在しない場合は"no-price"とかfalseを返すものをセット。あとで、ここの情報を取り出しやすいようにする。
          })
        } else {
          console.log("価格情報が存在しません");
          // 上の実装ができれば、ここのブロックは削除可能。
        }
      }
    })
  };

  return (
    <div>
      { book ?  <BookCard book={book} /> : <div className="bookcard"><h2>本情報が取得できませんでした。キーワード検索をご利用ください。</h2></div> }
    </div>
  );
};

export default BookCardResult;
