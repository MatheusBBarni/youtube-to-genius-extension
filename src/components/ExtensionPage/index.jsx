import React from 'react';

import { ResetCSS } from './resetCSS'
import { Container, GlobalStyle } from './styles'

function ExtensionPage({ children }) {
  return (
    <>
      <ResetCSS />
      <GlobalStyle />
      <Container>
        {children}
      </Container>
    </>
  )
}

export default ExtensionPage