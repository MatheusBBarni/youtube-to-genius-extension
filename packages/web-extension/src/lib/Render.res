let s = React.string

let map = (elements, fn) => elements->Belt.Array.map(element => fn(element))->React.array

let mapi = (elements, fn) =>
  elements->Belt.Array.mapWithIndex((key, element) => fn(element, key))->React.array
