#### The plugin checks if there is the following import
#### If it is present -> extract type/parameters information from the accompanying docsonnet definition
local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

#####
##### If docsonnet support is enabled, type information has higher precedence that the actual symbol definition
#####

[
  #####
  ##### What is possible to encoding using docsonnet?
  #####

  #####
  ##### It is possible to specify type of a value
  #####
  {
    "#numberValue": d.val(d.T.integer),
    numberValue: 'numberValue',  // you can invoke Quick Documentation and see the value's type
  },
  {
    "#stringValue": d.val(d.T.string),
    stringValue: 'stringValue',  // you can invoke Quick Documentation and see the value's type
  },


  #####
  ##### It is possible to describe arguments of a function.
  ##### The plugin will use that information while checking the function usage
  #####
  {
    '#functionDef': d.fn('Function description', args=[d.arg('param1', d.T.string), d.arg('param2', d.T.string)]),
    functionDef: 'functionDefinition',
    functionUsage: $.functionDef(),
  },

  {
    '#methodDef': d.fn('method doc', args=[d.arg('param1', d.T.bool)]),
    methodDef: 'someMethodDef',
    methodDefUsage: $.methodDef(),  // you can see Quick Documentation, also plugin tries to extract parameters from the accompanying definition
  },


  #####
  ##### Objects descriptions
  #####
  {
    "#myObj": d.obj('myObj holds my functions'),
    myObj:: {
      "#myFunc": d.fn('myFunc greets you', [d.arg('who', d.T.string)]),
      myFunc(who):: 'hello %s!' % who,
    },
    myObjUsage: $.myObj
  },
]


#####
##### Docsonnet doesn't encode information about optional/required arguments.
##### Default approach is to treat every parameter as required
#####