import React, { useState } from 'react';
import SuccessButton from '../../atoms/buttons/SuccessButton';
import SearchBar from '../../atoms/searches/SearchBar';
import PrimaryButton from '../../atoms/buttons/PrimaryButton';
import styled from 'styled-components';


const Query = () => {
  const [ titleSearch, setTitleSearch ] = useState(true);
  const [ authorSearch, setAuthorSearch ] = useState(false);
  const [ queryContent, setQueryContent ] = useState("");

  const onChangeText = (event) => setQueryContent(event.target.value);

  const onClickTitleSet = () => {
    titleSearch || setTitleSearch(true);
    authorSearch && setAuthorSearch(false);
  }

  const onClickAuthorSet = () => {
    titleSearch && setTitleSearch(false);
    authorSearch || setAuthorSearch(true);
  }

  const onClickTitleSearch = () => {
    console.log("title");
    console.log(queryContent);
  }

  const onClickAuthorSearch = () => {
    console.log("author");
    console.log(queryContent);
  }

  return (
    <>
      <SuccessButton onClick={onClickTitleSet}>タイトル</SuccessButton>
      <SSwitchObject className={ titleSearch || "unactive"}>
        <SearchBar placeholder={"本のタイトルで検索"} onChange={onChangeText} value={queryContent}></SearchBar>
        <PrimaryButton onClick={onClickTitleSearch}>検索</PrimaryButton>
      </SSwitchObject>

      <SuccessButton onClick={onClickAuthorSet}>著者</SuccessButton>
      <SSwitchObject className={ authorSearch || "unactive"}>
        <SearchBar placeholder={"著者名で検索"} onChange={onChangeText} value={queryContent}></SearchBar>
        <PrimaryButton onClick={onClickAuthorSearch}>検索</PrimaryButton>
      </SSwitchObject>
    </>
  );
};

const SSwitchObject = styled.div`
  &.unactive {
    display: none;
  }
`;

export default Query;
