import React from 'react';

import { Container } from './styles';

function Dropdown({ children }) {
  return (
    <Container>
      {children}
    </Container>
  );
}

export default Dropdown;