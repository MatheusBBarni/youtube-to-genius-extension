import React from 'react';

import SearchEngine from '../../components/SearchEngine'
import { Container } from './styles';

const OnYoutube: React.FC = () => {

  const onSearch = (items: Array<any>) => {
    console.log(items)
  }

  return (
    <Container>
      <SearchEngine onSearch={onSearch} />
    </Container>
  );
}

export default OnYoutube;