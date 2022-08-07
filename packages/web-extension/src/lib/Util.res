let isYoutube = (~tabUrl: string): bool => {
  open Theme.Constants

  let url = URL.make(tabUrl)
  let hostname = url->URL.getHostname
  let pathname = url->URL.getPathname
  let param = {
    let search = url->URL.getSearch
    let searchParams = URLSearchParams.make(search)
    searchParams->URLSearchParams.get(ytVideoParam)
  }

  switch hostname == ytHostname && pathname == ytPathName && param != "" {
  | true => true
  | false => false
  }
}
