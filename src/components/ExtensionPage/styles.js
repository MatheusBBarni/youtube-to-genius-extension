import styled, { createGlobalStyle } from 'styled-components';

export const GlobalStyle = createGlobalStyle`
  :root {
    --youtube-color: #FF0000;
    --genius-color: #FFFC64;
    --font: 'Noto Sans JP', sans-serif;
  }
  * {
    font-family: var(--font);
  }
`

export const Container = styled.div`
  width: 500px;
  height: 500px;
`;
