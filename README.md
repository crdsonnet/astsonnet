# ASTsonnet

> [!WARNING]
> This library is in an experimental state.

This is a Jsonnet library to generate jsonnet code. This library implements functions to create the Jsonnet expressions as represented in the Abstract Syntax. This allows us to generate valid Jsonnet programmatically.

> [!NOTE]
> This library supersedes https://github.com/Duologic/jsonnet-libsonnet, the library is partially generated with itself from a JSON schema representing the Jsonnet AST.

## Install

```
jb install github.com/crdsonnet/astsonnet
```

## Usage

```jsonnet filename="example.jsonnet"
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

a.object.new([
  a.field.new(
    a.id.new('hello'),
    a.string.new('world'),
  ),
]).toString()
```

Execute it like so:

```
$ jsonnet -S example.jsonnet | jsonnetfmt -

{ hello: 'world' }
```

Or execute the resulting jsonnet directly:

```
$ jsonnet -S example.jsonnet | jsonnet -

{
   "hello": "world"
}
```
