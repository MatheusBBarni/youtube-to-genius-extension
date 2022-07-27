import React from 'react';
import { Sad as SadIcon } from '@styled-icons/boxicons-solid/Sad'

import { Container, Text } from './styles';

const NotOnYoutube: React.FC = () => {
  return (
    <Container>
      <Text>
        This extension only works on youtube videos.
      </Text>
      <SadIcon size={100} color="var(--text-color)" />
    </Container>
  );
}

export default NotOnYoutube;