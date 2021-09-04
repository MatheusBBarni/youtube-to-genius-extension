/* eslint-disable no-undef */
import React, { useEffect, useState } from 'react'

import ExtensionPage from './components/ExtensionPage'
import isYoutube from './util/isYoutube'

function App() {
  const [url, setUrl] = useState('')
  const [onYoutubePage, setOnYoutubePage] = useState(false)
  const [queryInfo] = useState({ active: true, lastFocusedWindow: true })

  useEffect(() => {
    chrome.tabs && chrome.tabs.query(queryInfo, tabs => {
      const url = tabs[0].url
      setUrl(url)
    })
  }, [queryInfo])

  useEffect(() => {
    if (!!url) {
      setOnYoutubePage(isYoutube(url))
    }
  }, [url])

  return (
    <ExtensionPage>
      <h1>{url}</h1>
      {onYoutubePage && <p>Youtube</p>}
    </ExtensionPage>
  )
}

export default App
