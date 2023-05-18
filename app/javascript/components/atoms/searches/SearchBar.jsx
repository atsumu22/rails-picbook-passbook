import React, { useState } from 'react';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';

const SearchBar = () => {
  const [ searchTitle, setSearchTitle ] = useState(true);
  const [ queryValue, setQueryValue ] = useState();
  const handleChange = (event) => {
    setQueryValue(event.currentTarget.value);
  };

  const onClickSearchTitle = () => {
    console.log("title")
  }

  const onClickSearchAuthor = () => {
    console.log("author")
  }

  return (
    <>

      <input className="form-search form-control" placeholder="本のタイトル、著者名" type="text" onChange={handleChange}/>
    </>
  );
};


export default SearchBar;
