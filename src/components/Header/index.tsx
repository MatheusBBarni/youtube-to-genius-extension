import React from 'react';
import { Youtube as YoutubeIcon } from '@styled-icons/bootstrap/Youtube'
import { Genius as GeniusIcon } from '@styled-icons/simple-icons/Genius'
import { ArrowRight as ArrowRightIcon } from '@styled-icons/fa-solid/ArrowRight'

import { ICON_SIZE } from '../../config/constants'
import { Column, Container } from './styles';

function Header() {
  return (
    <Container>
      <Column type="youtube">
        <YoutubeIcon size={ICON_SIZE} />
      </Column>
      <Column type="normal" position="center">
        <ArrowRightIcon size={ICON_SIZE} color="#ffffff" />
      </Column>
      <Column type="genius">
        <GeniusIcon size={ICON_SIZE} />
      </Column>
    </Container>
  );
}

export default Header;