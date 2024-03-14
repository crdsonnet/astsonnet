{
  local root = self,
  objectToString(obj):: root['$defs'][obj.type].toString(obj),

  '$defs': {
    expr: {
      type: 'object',
      // Should be a oneOf in case of validation but this is intended for code generation so leaving it out for now.
    },
    literal: {
      type: 'object',
      properties: {
        type: { const: 'literal' },
        literal: {
          oneOf: [
            {
              type: [
                'number',
                'integer',
                'boolean',
                'null',
              ],
            },
            {
              enum: [
                'self',
                'dollar',
                '$',
              ],
            },
          ],
        },
      },
      required: ['literal'],
      toString(obj)::
        std.toString(obj.literal),
    },
    string: {
      type: 'object',
      properties: {
        type: { const: 'string' },
        string: { type: 'string' },
      },
      required: ['string'],
      toString(obj)::
        std.toString("'%s'" % obj.string),
    },
    parenthesis: {
      type: 'object',
      properties: {
        type: { const: 'parenthesis' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: ['expr'],
      toString(obj)::
        '(' + root.objectToString(obj.expr) + ')',
    },
    object: {
      type: 'object',
      properties: {
        type: { const: 'object' },
        members: {
          type: 'array',
          items: {
            oneOf: [
              { '$ref': '#/$defs/object_local' },
              { '$ref': '#/$defs/assertion' },
              { '$ref': '#/$defs/field' },
              { '$ref': '#/$defs/field_function' },
            ],
          },
        },
      },
      required: ['members'],
      toString(obj)::
        local linebreak =
          (if std.length(obj.members) > 1
              || (std.length(obj.members) == 1 && std.member(root.objectToString(obj.members[0]), '\n'))
           then '\n'
           else '');
        std.join('', [
          '{',
          linebreak,
          std.join(
            ',' + linebreak,
            [
              root.objectToString(member)
              for member in obj.members
            ]
          ),
          linebreak,
          '}',
        ]),
    },
    object_forloop: {
      type: 'object',
      properties: {
        type: { const: 'object_forloop' },
        fieldname_expr: { '$ref': '#/$defs/fieldname_expr' },
        expr: { '$ref': '#/$defs/expr' },
        forspec: { '$ref': '#/$defs/forspec' },
        compspec: { '$ref': '#/$defs/compspec' },
      },
      required: [
        'fieldname_expr',
        'expr',
        'forspec',
      ],
      toString(obj)::
        std.join(
          '\n',
          [
            '{',
            root['$defs'].field.toString({
              fieldname: obj.fieldname_expr,
              expr: obj.expr,
            }),
            root.objectToString(obj.forspec),
          ]
          + (if 'compspec' in obj
             then [root.objectToString(obj.compspec)]
             else [])
          + ['}'],
        ),
    },
    array: {
      type: 'object',
      properties: {
        type: { const: 'array' },
        items: {
          type: 'array',
          items: { '$ref': '#/$defs/expr' },
        },
      },
      required: ['items'],
      toString(obj)::
        local linebreak =
          (if std.length(obj.items) > 1
           then '\n'
           else '');
        std.join('', [
          '[',
          linebreak,
          std.join(
            ',' + linebreak,
            [
              root.objectToString(item)
              for item in obj.items
            ]
          ),
          linebreak,
          ']',
        ]),
    },
    forloop: {
      type: 'object',
      properties: {
        type: { const: 'forloop' },
        expr: { '$ref': '#/$defs/expr' },
        forspec: { '$ref': '#/$defs/forspec' },
        compspec: { '$ref': '#/$defs/compspec' },
      },
      required: [
        'expr',
        'forspec',
      ],
      toString(obj)::
        std.join(
          '\n',
          [
            '[',
            root.objectToString(obj.expr),
            root.objectToString(obj.forspec),
          ]
          + (if 'compspec' in obj
             then [root.objectToString(obj.compspec)]
             else [])
          + [']']
        ),
    },
    fieldaccess: {
      type: 'object',
      properties: {
        type: { const: 'fieldaccess' },
        exprs: {
          type: 'array',
          items: { '$ref': '#/$defs/expr' },
        },
        id: { '$ref': '#/$defs/id' },
      },
      required: [
        'exprs',
        'id',
      ],
      toString(obj)::
        std.join(
          '.',
          [
            root.objectToString(expr)
            for expr in obj.exprs
          ]
          + [
            root.objectToString(obj.id),
          ]
        ),
    },
    indexing: {
      type: 'object',
      properties: {
        type: { const: 'indexing' },
        expr: { '$ref': '#/$defs/expr' },
        exprs: {
          type: 'array',
          items: { '$ref': '#/$defs/expr' },
          minItems: 1,
          maxItems: 3,
        },
      },
      required: [
        'expr',
        'exprs',
      ],
      toString(obj)::
        std.join('', [
          root.objectToString(obj.expr),
          '[',
          std.join(':', [
            root.objectToString(expr)
            for expr in obj.exprs
          ]),
          ']',
        ]),
    },
    fieldaccess_super: {
      type: 'object',
      properties: {
        type: { const: 'fieldaccess_super' },
        id: { '$ref': '#/$defs/id' },
      },
      required: ['id'],
      toString(obj)::
        'super.' + root.objectToString(obj.id),
    },
    indexing_super: {
      type: 'object',
      properties: {
        type: { const: 'indexing_super' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: ['expr'],
      toString(obj)::
        'super[' + root.objectToString(obj.expr) + ']',
    },
    functioncall: {
      type: 'object',
      properties: {
        type: { const: 'functioncall' },
        expr: { '$ref': '#/$defs/expr' },
        args: {
          type: 'array',
          items: { '$ref': '#/$defs/arg' },
        },
      },
      required: ['expr'],
      toString(obj)::
        std.join('', [
          root.objectToString(obj.expr),
          '(',
          std.join(', ', [
            root.objectToString(arg)
            for arg in std.get(obj, 'args', [])
          ]),
          ')',
        ]),
    },
    id: {
      type: 'object',
      properties: {
        type: { const: 'id' },
        id: { type: 'string' },
      },
      required: ['id'],
      toString(obj)::
        std.toString(obj.id),
    },
    local_bind: {
      type: 'object',
      properties: {
        type: { const: 'local_bind' },
        bind: { '$ref': '#/$defs/bind' },
        expr: { '$ref': '#/$defs/expr' },
        additional_binds: {
          type: 'array',
          items: { '$ref': '#/$defs/bind' },
        },
      },
      required: [
        'bind',
        'expr',
      ],
      toString(obj)::
        std.join('', [
          'local ',
          std.join(
            ',\n', [
              root.objectToString(bind)
              for bind in [obj.bind] + std.get(obj, 'additional_binds', [])
            ]
          ),
          ';\n',
          root.objectToString(obj.expr),
        ]),
    },
    conditional: {
      type: 'object',
      properties: {
        type: { const: 'conditional' },
        if_expr: { '$ref': '#/$defs/expr' },
        then_expr: { '$ref': '#/$defs/expr' },
        else_expr: { '$ref': '#/$defs/expr' },
      },
      required: [
        'if_expr',
        'then_expr',
      ],
      toString(obj)::
        std.join(
          '',
          [
            '(if ',
            root.objectToString(obj.if_expr),
            '\n',
            ' then ',
            root.objectToString(obj.then_expr),
          ]
          + (if 'else_expr' in obj
             then [
               '\n',
               ' else ',
               root.objectToString(obj.else_expr),
             ]
             else [])
          + [')']
        ),
    },
    binary: {
      type: 'object',
      properties: {
        type: { const: 'binary' },
        binaryop: {
          enum: [
            '*',
            '/',
            '%',
            '+',
            '-',
            '<<',
            '>>',
            '<',
            '<=',
            '>',
            '>=',
            '==',
            '!=',
            'in',
            '&',
            '^',
            '|',
            '&&',
            '||',
          ],
        },
        left_expr: { '$ref': '#/$defs/expr' },
        right_expr: { '$ref': '#/$defs/expr' },
      },
      required: [
        'binaryop',
        'left_expr',
        'right_expr',
      ],
      toString(obj)::
        std.join(' ', [
          root.objectToString(obj.left_expr),
          obj.binaryop,
          root.objectToString(obj.right_expr),
        ]),
    },
    binary_sum: {
      type: 'object',
      properties: {
        type: { const: 'binary_sum' },
        exprs: {
          type: 'array',
          items: { '$ref': '#/$defs/expr' },
        },
      },
      required: [
        'exprs',
      ],
      toString(obj)::
        std.join('\n+ ', [
          root.objectToString(expr)
          for expr in obj.exprs
        ]),
    },
    unary: {
      type: 'object',
      properties: {
        type: { const: 'unary' },
        unaryop: {
          enum: [
            '-',
            '+',
            '!',
            '~',
          ],
        },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: [
        'unaryop',
        'expr',
      ],
      toString(obj)::
        obj.unaryop + root.objectToString(obj.expr),
    },
    anonymous_function: {
      type: 'object',
      properties: {
        type: { const: 'anonymous_function' },
        expr: { '$ref': '#/$defs/expr' },
        params: { '$ref': '#/$defs/params' },
      },
      required: ['expr'],
      toString(obj)::
        std.join('', [
          'function',
          '(',
          (if 'params' in obj
           then root.objectToString(obj.params)
           else ''),
          ')\n',
          root.objectToString(obj.expr),
        ]),
    },
    assertion_expr: {
      type: 'object',
      properties: {
        type: { const: 'assertion_expr' },
        assertion: { '$ref': '#/$defs/assertion' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: [
        'assertion',
        'expr',
      ],
      toString(obj)::
        std.join(';', [
          root.objectToString(obj.assertion),
          root.objectToString(obj.expr),
        ]),
    },
    import_statement: {
      type: 'object',
      properties: {
        type: { const: 'import_statement' },
        path: { type: 'string' },
      },
      required: ['path'],
      toString(obj)::
        std.join('', [
          'import ',
          root['$defs'].string.toString({ string: obj.path }),
        ]),
    },
    importstr_statement: {
      type: 'object',
      properties: {
        type: { const: 'importstr_statement' },
        path: { type: 'string' },
      },
      required: ['path'],
      toString(obj)::
        std.join('', [
          'importstr ',
          root['$defs'].string.toString({ string: obj.path }),
        ]),
    },
    importbin_statement: {
      type: 'object',
      properties: {
        type: { const: 'importbin_statement' },
        path: { type: 'string' },
      },
      required: ['path'],
      toString(obj)::
        std.join('', [
          'importbin ',
          root['$defs'].string.toString({ string: obj.path }),
        ]),
    },
    error_expr: {
      type: 'object',
      properties: {
        type: { const: 'error_expr' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: ['expr'],
      toString(obj)::
        std.join('', [
          'error ',
          root.objectToString(obj.expr),
        ]),
    },
    expr_in_super: {
      type: 'object',
      properties: {
        type: { const: 'expr_in_super' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: ['expr'],
      toString(obj)::
        std.join('', [
          root.objectToString(obj.expr),
          ' in super',
        ]),
    },
    field: {
      type: 'object',
      properties: {
        type: { const: 'field' },
        fieldname: {
          oneOf: [
            { '$ref': '#/$defs/id' },
            { '$ref': '#/$defs/string' },
            { '$ref': '#/$defs/fieldname_expr' },
          ],
        },
        expr: { '$ref': '#/$defs/expr' },
        additive: { type: 'boolean', default: false },
        hidden: { type: 'boolean', default: false },
      },
      required: [
        'fieldname',
        'expr',
      ],
      toString(obj)::
        std.join('', [
          root.objectToString(obj.fieldname),
          (if std.get(obj, 'additive', false)
           then '+'
           else ''),
          (if std.get(obj, 'hidden', false)
           then '::'
           else ':'),
          (if std.member(root.objectToString(obj.expr), '\n')
           then '\n'
           else ''),
          root.objectToString(obj.expr),
        ]),
    },
    field_function: {
      type: 'object',
      properties: {
        type: { const: 'field_function' },
        fieldname: {
          oneOf: [
            { '$ref': '#/$defs/id' },
            { '$ref': '#/$defs/string' },
            { '$ref': '#/$defs/fieldname_expr' },
          ],
        },
        expr: { '$ref': '#/$defs/expr' },
        params: { '$ref': '#/$defs/params' },
        hidden: { type: 'boolean', default: false },
      },
      required: [
        'fieldname',
        'expr',
      ],
      toString(obj)::
        std.join('', [
          root.objectToString(obj.fieldname),
          '(',
          (if 'params' in obj
           then root.objectToString(obj.params)
           else ''),
          ')',
          (if std.get(obj, 'hidden', false)
           then '::'
           else ':'),
          (if std.member(root.objectToString(obj.expr), '\n')
           then '\n'
           else ''),
          root.objectToString(obj.expr),
        ]),
    },
    object_local: {
      type: 'object',
      properties: {
        type: { const: 'object_local' },
        bind: { '$ref': '#/$defs/bind' },
      },
      required: ['bind'],
      toString(obj)::
        std.join(' ', [
          'local ',
          root.objectToString(obj.bind),
        ]),
    },
    compspec: {
      type: 'object',
      properties: {
        type: { const: 'compspec' },
        items: {
          type: 'array',
          items: {
            oneOf: [
              { '$ref': '#/$defs/forspec' },
              { '$ref': '#/$defs/ifspec' },
            ],
          },
        },
      },
      required: ['items'],
      toString(obj)::
        std.join('\n', [
          root.objectToString(item)
          for item in obj.items
        ]),
    },
    forspec: {
      type: 'object',
      properties: {
        type: { const: 'forspec' },
        id: { '$ref': '#/$defs/id' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: [
        'id',
        'expr',
      ],
      toString(obj)::
        std.join(' ', [
          'for',
          root.objectToString(obj.id),
          'in',
          root.objectToString(obj.expr),
        ]),
    },
    ifspec: {
      type: 'object',
      properties: {
        type: { const: 'ifspec' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: ['expr'],
      toString(obj)::
        'if ' + root.objectToString(obj.expr),
    },
    fieldname_expr: {
      type: 'object',
      properties: {
        type: { const: 'fieldname_expr' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: ['expr'],
      toString(obj)::
        '[' + root.objectToString(obj.expr) + ']',
    },
    assertion: {
      type: 'object',
      properties: {
        type: { const: 'assertion' },
        expr: { '$ref': '#/$defs/expr' },
        return_expr: { '$ref': '#/$defs/expr' },
      },
      required: ['expr'],
      toString(obj)::
        std.join(
          ' ',
          [
            'assert',
            root.objectToString(obj.expr),
          ]
          + (if 'return_expr' in obj
             then [':', root.objectToString(obj.return_expr)]
             else [])
        ),
    },
    bind: {
      type: 'object',
      properties: {
        type: { const: 'bind' },
        id: { '$ref': '#/$defs/id' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: [
        'id',
        'expr',
      ],
      toString(obj)::
        std.join(' = ', [
          root.objectToString(obj.id),
          root.objectToString(obj.expr),
        ]),
    },
    bind_function: {
      type: 'object',
      properties: {
        type: { const: 'bind_function' },
        id: { '$ref': '#/$defs/id' },
        expr: { '$ref': '#/$defs/expr' },
        params: { '$ref': '#/$defs/params' },
      },
      required: [
        'id',
        'expr',
      ],
      toString(obj)::
        std.join('', [
          root.objectToString(obj.id),
          '(',
          (if 'params' in obj
           then root.objectToString(obj.params)
           else ''),
          ')',
          '=',
          (if std.member(root.objectToString(obj.expr), '\n')
           then '\n'
           else ''),
          root.objectToString(obj.expr),
        ]),
    },
    arg: {
      type: 'object',
      properties: {
        type: { const: 'arg' },
        id: { '$ref': '#/$defs/id' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: [
        'expr',
      ],
      toString(obj)::
        (if 'id' in obj
         then root.objectToString(obj.id) + '='
         else '')
        + root.objectToString(obj.expr),
    },
    params: {
      type: 'object',
      properties: {
        type: { const: 'params' },
        params: {
          type: 'array',
          items: { '$ref': '#/$defs/param' },
        },
      },
      required: ['params'],
      toString(obj)::
        std.join(
          ', ',
          [
            root.objectToString(param)
            for param in obj.params
          ]
        ),
    },
    param: {
      type: 'object',
      properties: {
        type: { const: 'param' },
        id: { '$ref': '#/$defs/id' },
        expr: { '$ref': '#/$defs/expr' },
      },
      required: ['id'],
      toString(obj)::
        root.objectToString(obj.id)
        + (if 'expr' in obj
           then '=' + root.objectToString(obj.expr)
           else ''),
    },
  },
}
