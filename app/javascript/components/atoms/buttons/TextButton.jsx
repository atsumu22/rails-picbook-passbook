import React from 'react';
import Button from '@mui/material/Button';

const TextButton = (props) => {
  const { children } = props;

  return (
    <Button variant="text">{children}</Button>
  );
};

export default TextButton;
