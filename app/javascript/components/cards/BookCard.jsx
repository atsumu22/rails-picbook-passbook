import axios from 'axios';
import React, { useState } from 'react';

const BookCard = (props) => {
  const { result } = props;
  const [ book, setBook ] = useState({});

  const fetchedData = axios.get(`https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?format=json&isbn=${result}&applicationId=1018371623494845154`).then((res) => {
    res.data.Items.length === 0 ? console.log("APIが存在しない") : console.log(res.data.Items[0].Item.title);
    console.log(res.data.Items[0].Item);
    setBook({ title: res.data.Items[0].Item.title,
              author: res.data.Items[0].Item.author,
              publisher: res.data.Items[0].Item.publisherName,
              imageUrl: res.data.Items[0].Item.mediumImageUrl,
              price: res.data.Items[0].Item.itemPrice
            })
  });

  return (
    <div>
       <div class="bookcard">
        <div class="bookimg">
          <img src={book.imageUrl} alt="book-image" />
        </div>
        <div class="bookinfo">
          <p class="bookinfo__title">{book.title}</p>
          <p class="bookinfo__author">{book.author}</p>
          <p class="bookinfo__publisher">{book.publisher}</p>
          <div class="bookinfo__buttons">
          <button className="btn btn-primary">Detail</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BookCard;
