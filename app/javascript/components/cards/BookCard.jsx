import React, { useState } from 'react';
import styled from "styled-components";
import { BrowserRouter, Link } from "react-router-dom";
import axios from 'axios';


const BookCard = (props) => {
  const { book } = props;
  const [ isLoaded, setIsLoaded ] = useState(false);
  const [ bookToData, setBookToData ] = useState();
  const [ clicked, setClicked ] = useState(false);

  const onClickPostToLog = () => {
      book.status = 0;
      axios.get("http://localhost:3000/books").then((res) => {
        console.log(res)
      })
      // clicked || console.log(book);
      // clicked || axios.post('http://localhost:3000/logs', book).then(() => {});
      clicked || setClicked(true);
  }

  return (
    <SBookCard>
      <BrowserRouter>
        { book.imageUrl ? <img src={book.imageUrl} alt="book-image" /> : <SPlaceHolder /> }
        <div className="bookinfo">
          <div className="bookinfo__text">
            <p className="bookinfo__text__title">{book.title}</p>
            <p className="bookinfo__text__author">{book.author}</p>
            <p className="bookinfo__text__publisher">{book.publisher}</p>
            <p className="bookinfo__text__publisher d-none">¥{book.price.toLocaleString()}</p>
          </div>
          <div className="bookinfo__button">
            {/* <Link to="/books/new"><i class="fa-regular fa-square-plus"></i></Link> */}
            <SButton onClick={onClickPostToLog} className={clicked && "active"}><i className="fa-regular fa-square-plus"></i></SButton>
            <SButton><i className="fa-regular fa-bookmark"></i></SButton>
          </div>
        </div>
      </BrowserRouter>
    </SBookCard>
  );
};

const SBookCard = styled.div`
  background-color: #fff;
  height: 150px;
  box-shadow: 5px 5px 5px #7f7f7f;
  border-radius: 15px;
  padding: 10px 20px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  margin: 10px;
  & img {
    width: auto;
    height: 100%;
    background-color: gray;
    margin-right: 10px;
    object-fit: cover;
  }
  & .bookinfo {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 100%;
    &__text {
      &__title {
        font-weight: bold;
        margin: 0 0 3px 0;
      }
      &__author, &__publisher {
        margin: 0;
      }
    }
    &__button {
      text-align: right;
      display: flex;
      flex-direction: raw;
      justify-content: end;
    }
  }
`;

const SPlaceHolder = styled.div`
  background-color: gray;
  opacity: 0.7;
  width: 90px;
  height: 150px;
`;

const SButton = styled.button`
  background-color: white;
  color: blue;
  transition: all 0.3s;
  border: none;
  border-radius: 5px;
  &.active {
    background-color: blue;
    color: white;
  }
`;


export default BookCard;
