const http = require("http");

const host = 'localhost';
const port = 8080;

http.createServer((req, res) => {
  console.log(`${req.method} ${req.url}`)
  console.log(req.body)

  res.setHeader('Access-Control-Allow-Origin', '*')

  switch(req.url) {
    case '/user':      return user(req, res)
    case '/provision': return provision(req, res)
    case '/dashboard': return dashboard(req, res)
  }

}).listen(port, host, () => (
  console.log(`Server is running on http://${host}:${port}`)
))

const user = (req, res) => {
  res.setHeader('Content-Type', 'application/json')
  res.end(JSON.stringify({ uuid: "test-uuid", link: "http://localhost:8080/dashboard?token=abcdef" }))
}

const provision = (req, res) => {
  res.setHeader('Content-Type', 'application/json')
  res.end(JSON.stringify('{}'))
}

const dashboard = (req, res) => {
  res.setHeader('Content-Type', 'text/html')
  res.writeHead(200)
  res.end("<html><div>Hello world, this is a dashboard!</html>")
}
