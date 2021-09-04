import React, { useEffect, useState } from 'react'

import isYoutube from './util/isYoutube'
import ExtensionPage from './components/ExtensionPage'
import Header from './components/Header'

function App() {
  const [url, setUrl] = useState('')
  const [onYoutubePage, setOnYoutubePage] = useState(false)
  const [queryInfo] = useState({ active: true, lastFocusedWindow: true })

  useEffect(() => {
    chrome.tabs && chrome.tabs.query(queryInfo, tabs => {
      setUrl(tabs[0].url)
    })
  }, [queryInfo])

  useEffect(() => {
    if (!!url) {
      setOnYoutubePage(isYoutube(url))
    }
  }, [url])

  return (
    <ExtensionPage>
      <Header />
      <h1>{url}</h1>
      {onYoutubePage && <p>Youtube</p>}
    </ExtensionPage>
  )
}

export default App
