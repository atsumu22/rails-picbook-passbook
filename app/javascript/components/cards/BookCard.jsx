import axios from 'axios';
import React from 'react';

const BookCard = (props) => {
  const { result } = props;

  const fetchedData = axios.get(`https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?format=json&isbn=${result}&applicationId=1018371623494845154`).then((res) => {
    res.data.Items.length === 0 ? console.log("APIが存在しない") : console.log(res.data.Items[0].Item.title);
  });

  return (
    <div>
       <div class="bookcard">
        <div class="bookimg">
          <span></span>
        </div>
        <div class="bookinfo">
          <p class="bookinfo__title">{}</p>
          <p class="bookinfo__author"> book.author</p>
          <p class="bookinfo__publisher"> book.publisher</p>
          <div class="bookinfo__buttons">
          <button className="btn btn-primary">Detail</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BookCard;
