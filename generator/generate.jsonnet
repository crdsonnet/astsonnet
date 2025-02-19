local helpers = import 'github.com/crdsonnet/crdsonnet/crdsonnet/helpers.libsonnet';
local crdsonnet = import 'github.com/crdsonnet/crdsonnet/crdsonnet/main.libsonnet';
local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

local a = import '../main.libsonnet';
local autils = import '../utils.libsonnet';

local processor =
  crdsonnet.processor.new('ast')
  + {
    local engine = self.renderEngine.engine,
    render(name, schema):
      local parsedSchema = self.parse(name, schema);
      local required = std.get(parsedSchema[name], 'required', []);
      autils.deepMergeObjects([
        a.object.new([
          a.field.new(
            a.id.new(name),
            a.object.new([
              a.field.new(
                a.string.new('#new'),
                a.literal.new(
                  std.manifestJsonEx(
                    d.func.new('', [
                      local p = parsedSchema[name].properties[property];
                      local propertyType =
                        if 'type' in p
                        then p.type
                        else
                          local t = helpers.getSchemaTypes(p);
                          if t == ['string'] then ['object'] else t;
                      d.argument.new(
                        property,
                        (propertyType),
                        std.get(p, 'default'),
                        std.get(p, 'enum'),
                      )
                      for property in required
                    ])
                    , '', ''
                  ),
                ),
              ),
              a.field_function.new(
                a.id.new('new'),
                a.binary_sum.new(
                  [
                    a.functioncall.new(
                      a.fieldaccess.new(
                        [a.id.new('self')],
                        a.id.new(engine.functionName('type')),
                      )
                    ),
                    a.functioncall.new(
                      a.id.new('withToStringFunction'),
                    ),
                  ]
                  + [
                    a.functioncall.new(
                      a.fieldaccess.new(
                        [a.id.new('self')],
                        a.id.new(engine.functionName(property)),
                      )
                    )
                    + a.functioncall.withArgs(
                      a.arg.new(a.id.new(property))
                    )
                    for property in required
                  ]
                ),
              )
              + a.field_function.withParams(
                a.params.new([
                  a.param.new(a.id.new(property))
                  for property in required
                ])
              ),
            ])
          ),
        ]),
        super.render(name, schema),
      ]),
  };

function(
  astschema=import '../schema.libsonnet',
  packagedoc=d.package.new(
    'ASTsonnet',
    'github.com/crdsonnet/astsonnet',
    'Jsonnet library to generate jsonnet code.',
    'main.libsonnet',
    'main',
  ),
)
  local asts = [
    local schema = astschema['$defs'][field];
    crdsonnet.schema.render(field, schema, processor)
    for field in std.objectFields(astschema['$defs'])
    if field != 'expr'
  ];

  local docstring =
    a.object.new([
      a.field.new(
        a.string.new('#'),
        a.literal.new(
          std.manifestJsonEx(packagedoc, '  ', '\n'),
        ),
      ),
    ]);

  '// DO NOT EDIT: generated by generator/generate.jsonnet\n'
  + (
    a.local_bind.new(
      a.bind.new(
        a.id.new('astschema'),
        a.import_statement.new('./schema.libsonnet')
      ),
      autils.deepMergeObjects([docstring] + asts),
    )
    + a.local_bind.withAdditionalBinds([
      a.bind_function.new(
        a.id.new('withToStringFunction'),
        a.object.new([
          a.field_function.new(
            a.id.new('toString'),
            a.functioncall.new(
              a.fieldaccess.new(
                [a.id.new('astschema')],
                a.id.new('objectToString')
              )
            )
            + a.functioncall.withArgs([
              a.arg.new(a.id.new('self')),
            ])
          )
          + a.field_function.withHidden(),
        ]),
      ),
    ])
  ).toString()
