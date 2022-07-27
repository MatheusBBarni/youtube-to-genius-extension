import React, { useEffect, useState } from 'react'

import isYoutube from './util/isYoutube'
import ExtensionPage from './components/ExtensionPage'
import Header from './components/Header'
import OnYoutube from './pages/OnYoutube'
import NotOnYoutube from './pages/NotOnYoutube'
import { QUERY_INFO } from './config/constants'

type PageType = 'youtube' | 'not_youtube' | 'configuration'

interface PagesMap {
  [name: string]: JSX.Element
}

const pages: PagesMap = {
  'youtube': <OnYoutube />,
  'not_youtube': <NotOnYoutube />,
  'configuration': <NotOnYoutube />
}

function App() {
  const [url, setUrl] = useState<string>('')
  const [page, setPage] = useState<PageType>()
  const [onYoutubePage, setOnYoutubePage] = useState<boolean>(false)

  useEffect(() => {
    chrome.tabs && chrome.tabs.query(QUERY_INFO, tabs => {
      setUrl(tabs[0].url || '')
    })
  }, [])

  useEffect(() => {
    if (!!url) {
      const isOnYotube = isYoutube(url)
      setOnYoutubePage(isOnYotube)
      if (isOnYotube) {
        setPage('youtube')
      } else {
        setPage('not_youtube')
      }
    }
  }, [url])

  return (
    <ExtensionPage>
      <Header />
      {pages[page as string]}
    </ExtensionPage>
  )
}

export default App
