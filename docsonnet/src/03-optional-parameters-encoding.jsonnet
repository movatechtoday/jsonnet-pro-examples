#### The standard docsonnet library  cannot encode optional parameter information
local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

### if you generate the output
### you will see that required and optional parameters have the same representation
### in the next file you will find the solution
[
  {
    '#required_parameter': d.fn(
      help='',
      args=[
        d.arg('param1', d.T.string),
      ]
    ),
    '#optional_parameter': d.fn(
      help='',
      args=[
        d.arg('param1', d.T.string, default=null),
      ]
    ),
  },
]