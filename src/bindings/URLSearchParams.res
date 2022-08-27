type t

type pair<'a> = (string, 'a)

module Iter = {
  type t
  type s<'a> = {
    value: 'a,
    done_: bool,
  }

  @get external value: s<'a> => 'a = "value"
  @get external done_: s<'a> => bool = "done"

  @send.pipe(: t) external next: unit => s<'a> = "next"
}

@new external make: string => t = "URLSearchParams"

@new
external makeWithObject: Js.t<{..}> => t = "URLSearchParams"

@new external makeWithArray: array<pair<'a>> => t = "URLSearchParams"

@send.pipe(: t) external append: (string, string) => unit = "append"
@send.pipe(: t) external delete: string => unit = "delete"
@send.pipe(: t) external entries: unit => Iter.t = "entries"
@send.pipe(: t) external forEach: (pair<'a> => 'b) => unit = "forEach"
@send external get: (t, string) => string = "get"
@send.pipe(: t) external getAll: string => array<'a> = "getAll"
@send.pipe(: t) external has: string => bool = "has"
@send.pipe(: t) external keys: unit => Iter.t = "keys"
@send.pipe(: t) external set: string => string = "set"
@send external sort: t => unit = "sort"
@send external toString: t => string = "toString"
@send.pipe(: t) external values: unit => Iter.t = "values"
