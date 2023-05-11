import React from 'react';
import styled from "styled-components";
import PrimaryButton from '../buttons/PrimaryButton';
import SecondaryButton from '../buttons/SuccessButton';
import TextButton from '../buttons/TextButton';

const BookCard = (props) => {
  const { book } = props;

  return (
    <SBookCard>
      <img src={book.imageUrl} alt="book-image" />
      <div className="bookinfo">
        <div className="bookinfo__text">
          <p className="bookinfo__text__title">{book.title}</p>
          <p className="bookinfo__text__author">{book.author}</p>
          <p className="bookinfo__text__publisher">{book.publisher}</p>
        </div>
        <div className="bookinfo__button">
          <TextButton><i class="fa-regular fa-square-plus"></i></TextButton>
          <TextButton><i class="fa-regular fa-bookmark"></i></TextButton>
        </div>
      </div>
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

export default BookCard;
