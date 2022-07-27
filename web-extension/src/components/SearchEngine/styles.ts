import styled, { css } from 'styled-components';

const fontStyles = css`
  color: var(--black);
  font-family: var(--font);
`

export const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: space-around;
  margin-top: 15px;
`;

export const Input = styled.input`
  width: 350px;
  height: 35px;
  border-radius: 8px;
  border-color: var(--black);
  font-size: 15px;
  padding: 0 5px;
  ${fontStyles};

  &::placeholder {
    font-size: 10px;
  }
`

export const Button = styled.button`
  width: 100px;
  height: 35px;
  background-color: var(--genius-color);
  border-color: var(--black);
  border-radius: 8px;
  ${fontStyles};
  font-weight: bold;

  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;

  transition: background-color .6s ease;
  &:hover {
    background-color: var(--youtube-color);
  }
`
