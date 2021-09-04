/* eslint-disable no-undef */
import { useEffect, useState } from "react/cjs/react.production.min";
import Dropdown from "./components/Dropdown";

function App() {
  const [url, setUrl] = useState('');

  useEffect(() => {
    const queryInfo = { active: true, lastFocusedWindow: true };

    chrome.tabs && chrome.tabs.query(queryInfo, tabs => {
      const url = tabs[0].url;
      setUrl(url);
    });
  }, []);

  return (
    <Dropdown className="App">
      <h1>{url}</h1>
    </Dropdown>
  );
}

export default App;
