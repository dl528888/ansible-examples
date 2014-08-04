var app = require('{{ node_dir }}/node-{{ node_version }}/lib/node_modules/express/index')()
app.get('/', function (req, res) {
  res.send('Node install success!\n')
})
app.listen({{ node_port }})
