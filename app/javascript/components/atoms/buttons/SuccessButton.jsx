import React from 'react';
import Button from '@mui/material/Button';

const SecondaryButton = (props) => {
  const { children, onClick } = props;

  return (
    <Button variant="outlined" onClick={onClick}>{children}</Button>
  );
};

export default SecondaryButton;
