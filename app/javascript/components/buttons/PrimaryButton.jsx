import React from 'react';
import Button from '@mui/material/Button';


const PrimaryButton = (props) => {
  const { text } = props;

  return (
    <Button variant="contained">{text}</Button>
  );
};

export default PrimaryButton;
