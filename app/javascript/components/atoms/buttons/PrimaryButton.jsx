import React from 'react';
import Button from '@mui/material/Button';

const PrimaryButton = (props) => {
  const { children } = props;

  return (
    <Button variant="contained">{children}</Button>
  );
};

export default PrimaryButton;
