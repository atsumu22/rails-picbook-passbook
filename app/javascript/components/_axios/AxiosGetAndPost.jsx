import axios from 'axios';
import React, { useEffect, useState } from 'react';
import styled from 'styled-components';
import BookCard from '../atoms/cards/BookCard';

const AxiosGetAndPost = (props) => {
  const { result } = props;
  const [ error, setError ] = useState(null);
  const [ isLoaded, setIsLoaded ] = useState(false);
  const [ book, setBook ] = useState();

  useEffect(() => {
    const fetchedData = axios.get(`https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?format=json&isbn=${result}&applicationId=1018371623494845154`).then((res) => {
      if (res.data.Items.length === 0) {
        fetchingFromOpenBD(result);
      } else {
        setIsLoaded(true);
        setBook({
          title: res.data.Items[0].Item.title,
          author: res.data.Items[0].Item.author,
          publisher: res.data.Items[0].Item.publisherName,
          imageUrl: res.data.Items[0].Item.mediumImageUrl,
          price: res.data.Items[0].Item.itemPrice
        });
      };
      // console.log(res.data.Items[0].Item);
    },
    (error) => {
      setIsLoaded(true);
      setError(error);
    });

    const fetchingFromOpenBD = (result) => {
      axios.get(`https://api.openbd.jp/v1/get?isbn=${result}`).then((res) => {
        if (res.data[0] === null) {
          // console.log("APIが存在しない")
          setIsLoaded(true);
          setBook(null);
        } else {
            setIsLoaded(true);
            setBook({
              title: res.data[0].summary.title,
              author: res.data[0].summary.author,
              publisher: res.data[0].summary.publisher,
              imageUrl: res.data[0].summary.cover,
              price: res.data[0].onix.ProductSupply.SupplyDetail.Price ? res.data[0].onix.ProductSupply.SupplyDetail.Price[0].PriceAmount : ""
              // priceのプロパティに演算子を設定。Price情報が存在するなら、価格詳細をプロパティ値としてセット、存在しない場合は"no-price"とかfalseを返すものをセット。あとで、ここの情報を取り出しやすいようにする。
            })
        }
      },
      (error) => {
        setIsLoaded(true);
        setError(error);
      });
    };
  }, []);


  if (error) {
    return <SError>エラー！読み込みに失敗しました。再度スキャンを試してください。</SError>
  } else if (!isLoaded) {
    return <SLoader>Loading...</SLoader>
  } else if (book === null ) {
    return <SError>Sorry...,本情報が取得できませんでした。キーワード検索をご利用ください。</SError>
  } else {
    return <BookCard book={book} />
  }
};

const SError = styled.h2`
  color: red;
  font-weight: bold;
`;

const SLoader = styled.h2`
  color: blue;
  font-weight: bold;
`;

export default AxiosGetAndPost;
