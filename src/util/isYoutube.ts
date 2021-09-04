import { YT_HOSTNAME, YT_PATHNAME, YT_VIDEO_PARAM } from '../config/constants'

const isYoutube = (tabUrl: string): boolean => {
  const url = new URL(tabUrl)
  const { hostname, searchParams, pathname } = url

  if (
    hostname === YT_HOSTNAME &&
    pathname === YT_PATHNAME &&
    searchParams.get(YT_VIDEO_PARAM)
  ) {
    return true
  }

  return false
}

export default isYoutube