local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

#####
##### If docsonnet support is enabled, type information has higher precedence that the actual symbol definition
#####


{
  "#kubeVela": d.val(d.T.integer),
  kubeVela: "kubeVela", // you can invoke Quick Documentation and the plugin will try to extract its type from docsonnet definition


  '#methodDef': d.fn('method doc', args=[d.arg("param1", d.T.string)]),
  methodDef: "someMethodDef",
  methodDefUsage: $.methodDef() // you can see Quick Documentation, also plugin tries to extract parameters from the accompanying definition
}



#####
##### Docsonnet doesn't encode information about optional/required arguments.
##### Default approach is to treat every parameter as required
#####