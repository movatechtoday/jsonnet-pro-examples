Here I am experimenting with the new Grafonnet version. 

# Findings

The old library (grafonnet-lib) defines everything manually: every object, function, method, etc. 
The plugin can parse it and provides you with code completion variants.

The new one uses another approach. 
Under the hood, it dynamically generates all the definitions for helper functions/methods/objects/values. 
These definitions are dynamic(generated when you interpret the code).  

Internally the new Grafonnet library uses the crdsonnet library for dynamically rendering all 
helper functions. These functions are available only when you try to render the code 
(when you interpret it).


# What to do?

I see 2 ways:
1. Pre-generate completion-data
2. Pass the code everytime through the interpreter and extract the type info. 

I have chosen the first approach. 


# How does Jsonnet Pro understand that you use Grafonnet and inject completion data?

When a file contains the following import:

```jsonnet
local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

```

the IDE automatically injects completion data.


# Where are types?

Type Engine re-uses type information from the pre-generated completion-data. Grafonnet internally 
uses [Docsonnet library](https://github.com/jsonnet-libs/docsonnet) to document types. 

Some type info is pre-generated too. But not all. I have found the following issues inside Grafonnet + Docsonnet:

- [ ] Pre-generated methods may be without any type info attached.   
      In this case Jsonnet Pro cannot understand the type and will mark the method usage as invalid. 
- [ ] The docsonnet model cannot encode optional/named arguments. 
      It is not possible to understand is a function parameter is positional or named. Type Engine cannot help here too. 
- [ ] The docsonnet model cannot encode high-order functions: functions that return functions.
- [ ] Types used inside the docsonnet model are the same as in Json/Jsonnet.  
      What problems here? It is not possible to understand what `null` means:   
      1. Is it an optional parameter?
      2. Is it a field that can accept `null` values?
      3. Is it an object field that can accept any type(string, boolean, object, etc)