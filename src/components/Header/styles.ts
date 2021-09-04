import styled, { css } from 'styled-components'

type ColumnType = 'genius' | 'youtube' | 'normal'
type ColumnPosition = 'center'

const getBackgroundColor = (type: ColumnType) => {
  if (type === 'genius') {
    return 'var(--genius-color)'
  }
  if (type === 'youtube') {
    return 'var(--youtube-color)'
  }

  return 'var(--background-color)'
}

export const Container = styled.div`
  width: 100%;
  display: flex;
`;

export const Column = styled.div<{
  type: ColumnType
  position?: ColumnPosition
}>`
  ${({ type, position }) => css`
    width: ${position === 'center' ? '15%' : '42.5%'};
    padding: 5px;
    display: flex;
    justify-content: center;
    background-color: ${getBackgroundColor(type)};

    ${position === 'center' && css`
      @keyframes slide_to_right {
        0%,
        100% {
          transform: translate(0, 0);
        }

        50% {
          transform: translate(10px, 0);
        }
      }
      svg {
        animation: slide_to_right 1s ease-in-out infinite;
      }
    `}
  `}
`
