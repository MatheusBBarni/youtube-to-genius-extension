import styled, { createGlobalStyle } from 'styled-components';

export const GlobalStyle = createGlobalStyle`
  :root {
    --youtube-color: #FF0000;
    --genius-color: #FFFC64;
    --black: #101010;
    --background-color: var(--black);
    --text-color: var(---black);
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
