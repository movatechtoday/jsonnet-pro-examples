#### The standard docsonnet library  cannot encode optional parameter information
#### The patched version adds a new field -- optional
local d = import 'github.com/movatechtoday/docsonnet/doc-util/main.libsonnet';

### if you generate the output
### you will see that required and optional parameters have the same representation
### in the next file you will find the solution
{
  '#required_parameter': d.fn(
    help='',
    args=[
      d.arg('param1', d.T.string, optional=false),
    ]
  ),
  '#optional_parameter': d.fn(
    help='',
    args=[
      d.arg('param1', d.T.string, default=null, optional=true),
    ]
  ),

  #### now it is possible to extract parameters information
  required_parameter:: function() 42,
  optional_parameter:: function() 42,

  req_usage: $.required_parameter(), // the inspection sees that the parameter is required
  optional_usage: $.optional_parameter() // the inspection sees that the parameter is optional
}




