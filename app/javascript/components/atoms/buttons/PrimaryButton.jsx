import React from 'react';
import Button from '@mui/material/Button';

const PrimaryButton = (props) => {
  const { children, onClick } = props;

  return (
    <Button onClick={onClick} variant="contained">{children}</Button>
  );
};

export default PrimaryButton;
