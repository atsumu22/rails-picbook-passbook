import React from 'react';
import styled from "styled-components";

const BookCard = (props) => {
  const { book } = props;

  return (
    <div className="bookcard">
      <div className="bookimg">
        <img src={book.imageUrl} alt="book-image" />
      </div>
      <div className="bookinfo">
        <p className="bookinfo__title">{book.title}</p>
        <p className="bookinfo__author">{book.author}</p>
        <p className="bookinfo__publisher">{book.publisher}</p>
        <div className="bookinfo__buttons">
        <button className="btn btn-primary">Detail</button>
        </div>
      </div>
    </div>
  );
};

const SBookCard = styled.div`

`;


export default BookCard;
