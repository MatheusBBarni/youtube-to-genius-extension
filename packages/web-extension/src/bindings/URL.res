type t

@new external make: string => t = "URL"

@val external decodeURI: t => t = "decodeURIComponent"

@get external getHash: t => string = "hash"
@get external getHost: t => string = "host"
@get external getHostname: t => string = "hostname"
@get external getHref: t => string = "href"
@get external getOrigin: t => string = "origin"
@get external getPassword: t => string = "password"
@get external getPathname: t => string = "pathname"
@get external getPort: t => string = "port"
@get external getProtocol: t => string = "protocol"
@get external getSearch: t => string = "search"
@get external getUsername: t => string = "username"
@get external getSearchParams: t => URLSearchParams.t = "searchParams"
