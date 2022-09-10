%%raw("import './styles.css'")

let root = ReactDOM.querySelector("#app")

let () = switch root {
| Some(element) =>
  ReactDOM.render(
    <React.StrictMode> <PageContext.Provider> <App /> </PageContext.Provider> </React.StrictMode>,
    element,
  )
| None => Js.Exn.raiseError("Root not found!")
}
