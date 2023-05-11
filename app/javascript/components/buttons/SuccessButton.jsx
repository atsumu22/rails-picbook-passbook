import React from 'react';
import Button from '@mui/material/Button';

const SecondaryButton = (props) => {
  const { children } = props;

  return (
    <Button variant="outlined">{children}</Button>
  );
};

export default SecondaryButton;
