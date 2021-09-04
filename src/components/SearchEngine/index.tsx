/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useState } from 'react';
import { MUSIC_SELECTOR, QUERY_INFO } from '../../config/constants';

import { Button, Container, Input } from './styles';

export type SearchEngineProps = {
  onSearch: (items: Array<any>) => void
}

const SearchEngine: React.FC<SearchEngineProps> = ({ onSearch }) => {
  const [musicName, setMusicName] = useState<string>('')

  useEffect(() => {
    getMusicNameOnPage()
  }, [])

  function getInContentText() {
    return document.querySelector(MUSIC_SELECTOR)?.textContent
  }

  const getMusicNameOnPage = async () => {
    const [tab] = await chrome.tabs.query(QUERY_INFO);
    if (tab.id) {
      chrome.scripting.executeScript({
        target: { tabId: tab.id },
        func: getInContentText
      }, (result) => {
        for (let item in result) {
          const text = result[item].result
          if (!!text) {
            setMusicName(text)
            return
          }
        }
      });
    }
  }

  const search = () => {
    onSearch([])
  }

  const inputKeyPress = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === 'enter') {
      search()
    }
  }

  return (
    <Container>
      <Input
        value={musicName}
        onKeyPress={inputKeyPress}
        onChange={(event) => setMusicName(event.target.value)}
        placeholder="Type the name of the music that you want to search"
      />
      <Button onClick={search}>
        Search
      </Button>
    </Container>
  );
}

export default SearchEngine;