# ASTsonnet

Jsonnet library to generate jsonnet code.
## Install

```
jb install github.com/crdsonnet/astsonnet@main
```

## Usage

```jsonnet
local ASTsonnet = import "github.com/crdsonnet/astsonnet/main.libsonnet"
```


## Index

* [`obj anonymous_function`](#obj-anonymous_function)
  * [`fn new(expr)`](#fn-anonymous_functionnew)
  * [`fn withExpr(value)`](#fn-anonymous_functionwithexpr)
  * [`fn withParams(value)`](#fn-anonymous_functionwithparams)
  * [`fn withType()`](#fn-anonymous_functionwithtype)
* [`obj arg`](#obj-arg)
  * [`fn new(expr)`](#fn-argnew)
  * [`fn withExpr(value)`](#fn-argwithexpr)
  * [`fn withId(value)`](#fn-argwithid)
  * [`fn withType()`](#fn-argwithtype)
* [`obj array`](#obj-array)
  * [`fn new(items)`](#fn-arraynew)
  * [`fn withItems(value)`](#fn-arraywithitems)
  * [`fn withItemsMixin(value)`](#fn-arraywithitemsmixin)
  * [`fn withType()`](#fn-arraywithtype)
* [`obj assertion`](#obj-assertion)
  * [`fn new(expr)`](#fn-assertionnew)
  * [`fn withExpr(value)`](#fn-assertionwithexpr)
  * [`fn withReturnExpr(value)`](#fn-assertionwithreturnexpr)
  * [`fn withType()`](#fn-assertionwithtype)
* [`obj assertion_expr`](#obj-assertion_expr)
  * [`fn new(assertion, expr)`](#fn-assertion_exprnew)
  * [`fn withAssertion(value)`](#fn-assertion_exprwithassertion)
  * [`fn withExpr(value)`](#fn-assertion_exprwithexpr)
  * [`fn withType()`](#fn-assertion_exprwithtype)
* [`obj binary`](#obj-binary)
  * [`fn new(binaryop, left_expr, right_expr)`](#fn-binarynew)
  * [`fn withBinaryop(value)`](#fn-binarywithbinaryop)
  * [`fn withLeftExpr(value)`](#fn-binarywithleftexpr)
  * [`fn withRightExpr(value)`](#fn-binarywithrightexpr)
  * [`fn withType()`](#fn-binarywithtype)
* [`obj binary_sum`](#obj-binary_sum)
  * [`fn new(exprs)`](#fn-binary_sumnew)
  * [`fn withExprs(value)`](#fn-binary_sumwithexprs)
  * [`fn withExprsMixin(value)`](#fn-binary_sumwithexprsmixin)
  * [`fn withType()`](#fn-binary_sumwithtype)
* [`obj bind`](#obj-bind)
  * [`fn new(id, expr)`](#fn-bindnew)
  * [`fn withExpr(value)`](#fn-bindwithexpr)
  * [`fn withId(value)`](#fn-bindwithid)
  * [`fn withType()`](#fn-bindwithtype)
* [`obj bind_function`](#obj-bind_function)
  * [`fn new(id, expr)`](#fn-bind_functionnew)
  * [`fn withExpr(value)`](#fn-bind_functionwithexpr)
  * [`fn withId(value)`](#fn-bind_functionwithid)
  * [`fn withParams(value)`](#fn-bind_functionwithparams)
  * [`fn withType()`](#fn-bind_functionwithtype)
* [`obj boolean`](#obj-boolean)
  * [`fn new(boolean)`](#fn-booleannew)
  * [`fn withBoolean(value)`](#fn-booleanwithboolean)
  * [`fn withType()`](#fn-booleanwithtype)
* [`obj compspec`](#obj-compspec)
  * [`fn new(items)`](#fn-compspecnew)
  * [`fn withItems(value)`](#fn-compspecwithitems)
  * [`fn withItemsMixin(value)`](#fn-compspecwithitemsmixin)
  * [`fn withType()`](#fn-compspecwithtype)
* [`obj conditional`](#obj-conditional)
  * [`fn new(if_expr, then_expr)`](#fn-conditionalnew)
  * [`fn withElseExpr(value)`](#fn-conditionalwithelseexpr)
  * [`fn withIfExpr(value)`](#fn-conditionalwithifexpr)
  * [`fn withThenExpr(value)`](#fn-conditionalwiththenexpr)
  * [`fn withType()`](#fn-conditionalwithtype)
* [`obj error_expr`](#obj-error_expr)
  * [`fn new(expr)`](#fn-error_exprnew)
  * [`fn withExpr(value)`](#fn-error_exprwithexpr)
  * [`fn withType()`](#fn-error_exprwithtype)
* [`obj expr_in_super`](#obj-expr_in_super)
  * [`fn new(expr)`](#fn-expr_in_supernew)
  * [`fn withExpr(value)`](#fn-expr_in_superwithexpr)
  * [`fn withType()`](#fn-expr_in_superwithtype)
* [`obj field`](#obj-field)
  * [`fn new(fieldname, expr)`](#fn-fieldnew)
  * [`fn withAdditive(value=true)`](#fn-fieldwithadditive)
  * [`fn withExpr(value)`](#fn-fieldwithexpr)
  * [`fn withFieldname(value)`](#fn-fieldwithfieldname)
  * [`fn withFieldnameMixin(value)`](#fn-fieldwithfieldnamemixin)
  * [`fn withH(value=":")`](#fn-fieldwithh)
  * [`fn withHidden(value=true)`](#fn-fieldwithhidden)
  * [`fn withType()`](#fn-fieldwithtype)
  * [`obj fieldname`](#obj-fieldfieldname)
    * [`fn withFieldnameExpr(value)`](#fn-fieldfieldnamewithfieldnameexpr)
    * [`fn withId(value)`](#fn-fieldfieldnamewithid)
    * [`fn withString(value)`](#fn-fieldfieldnamewithstring)
* [`obj field_function`](#obj-field_function)
  * [`fn new(fieldname, expr)`](#fn-field_functionnew)
  * [`fn withExpr(value)`](#fn-field_functionwithexpr)
  * [`fn withFieldname(value)`](#fn-field_functionwithfieldname)
  * [`fn withFieldnameMixin(value)`](#fn-field_functionwithfieldnamemixin)
  * [`fn withH(value=":")`](#fn-field_functionwithh)
  * [`fn withHidden(value=true)`](#fn-field_functionwithhidden)
  * [`fn withParams(value)`](#fn-field_functionwithparams)
  * [`fn withType()`](#fn-field_functionwithtype)
  * [`obj fieldname`](#obj-field_functionfieldname)
    * [`fn withFieldnameExpr(value)`](#fn-field_functionfieldnamewithfieldnameexpr)
    * [`fn withId(value)`](#fn-field_functionfieldnamewithid)
    * [`fn withString(value)`](#fn-field_functionfieldnamewithstring)
* [`obj fieldaccess`](#obj-fieldaccess)
  * [`fn new(exprs, id)`](#fn-fieldaccessnew)
  * [`fn withExprs(value)`](#fn-fieldaccesswithexprs)
  * [`fn withExprsMixin(value)`](#fn-fieldaccesswithexprsmixin)
  * [`fn withId(value)`](#fn-fieldaccesswithid)
  * [`fn withType()`](#fn-fieldaccesswithtype)
* [`obj fieldaccess_super`](#obj-fieldaccess_super)
  * [`fn new(id)`](#fn-fieldaccess_supernew)
  * [`fn withId(value)`](#fn-fieldaccess_superwithid)
  * [`fn withType()`](#fn-fieldaccess_superwithtype)
* [`obj fieldname_expr`](#obj-fieldname_expr)
  * [`fn new(expr)`](#fn-fieldname_exprnew)
  * [`fn withExpr(value)`](#fn-fieldname_exprwithexpr)
  * [`fn withType()`](#fn-fieldname_exprwithtype)
* [`obj forloop`](#obj-forloop)
  * [`fn new(expr, forspec)`](#fn-forloopnew)
  * [`fn withCompspec(value)`](#fn-forloopwithcompspec)
  * [`fn withExpr(value)`](#fn-forloopwithexpr)
  * [`fn withForspec(value)`](#fn-forloopwithforspec)
  * [`fn withType()`](#fn-forloopwithtype)
* [`obj forspec`](#obj-forspec)
  * [`fn new(id, expr)`](#fn-forspecnew)
  * [`fn withExpr(value)`](#fn-forspecwithexpr)
  * [`fn withId(value)`](#fn-forspecwithid)
  * [`fn withType()`](#fn-forspecwithtype)
* [`obj functioncall`](#obj-functioncall)
  * [`fn new(expr)`](#fn-functioncallnew)
  * [`fn withArgs(value)`](#fn-functioncallwithargs)
  * [`fn withArgsMixin(value)`](#fn-functioncallwithargsmixin)
  * [`fn withExpr(value)`](#fn-functioncallwithexpr)
  * [`fn withType()`](#fn-functioncallwithtype)
* [`obj id`](#obj-id)
  * [`fn new(id)`](#fn-idnew)
  * [`fn withId(value)`](#fn-idwithid)
  * [`fn withType()`](#fn-idwithtype)
* [`obj ifspec`](#obj-ifspec)
  * [`fn new(expr)`](#fn-ifspecnew)
  * [`fn withExpr(value)`](#fn-ifspecwithexpr)
  * [`fn withType()`](#fn-ifspecwithtype)
* [`obj implicit_plus`](#obj-implicit_plus)
  * [`fn new(expr, object)`](#fn-implicit_plusnew)
  * [`fn withExpr(value)`](#fn-implicit_pluswithexpr)
  * [`fn withObject(value)`](#fn-implicit_pluswithobject)
  * [`fn withObjectMixin(value)`](#fn-implicit_pluswithobjectmixin)
  * [`fn withType()`](#fn-implicit_pluswithtype)
  * [`obj object`](#obj-implicit_plusobject)
    * [`fn withObject(value)`](#fn-implicit_plusobjectwithobject)
    * [`fn withObjectForloop(value)`](#fn-implicit_plusobjectwithobjectforloop)
* [`obj import_statement`](#obj-import_statement)
  * [`fn new(path)`](#fn-import_statementnew)
  * [`fn withPath(value)`](#fn-import_statementwithpath)
  * [`fn withType()`](#fn-import_statementwithtype)
* [`obj importbin_statement`](#obj-importbin_statement)
  * [`fn new(path)`](#fn-importbin_statementnew)
  * [`fn withPath(value)`](#fn-importbin_statementwithpath)
  * [`fn withType()`](#fn-importbin_statementwithtype)
* [`obj importstr_statement`](#obj-importstr_statement)
  * [`fn new(path)`](#fn-importstr_statementnew)
  * [`fn withPath(value)`](#fn-importstr_statementwithpath)
  * [`fn withType()`](#fn-importstr_statementwithtype)
* [`obj indexing`](#obj-indexing)
  * [`fn new(expr, exprs)`](#fn-indexingnew)
  * [`fn withExpr(value)`](#fn-indexingwithexpr)
  * [`fn withExprs(value)`](#fn-indexingwithexprs)
  * [`fn withExprsMixin(value)`](#fn-indexingwithexprsmixin)
  * [`fn withType()`](#fn-indexingwithtype)
* [`obj indexing_super`](#obj-indexing_super)
  * [`fn new(expr)`](#fn-indexing_supernew)
  * [`fn withExpr(value)`](#fn-indexing_superwithexpr)
  * [`fn withType()`](#fn-indexing_superwithtype)
* [`obj literal`](#obj-literal)
  * [`fn new(literal)`](#fn-literalnew)
  * [`fn withLiteral(value)`](#fn-literalwithliteral)
  * [`fn withType()`](#fn-literalwithtype)
* [`obj local_bind`](#obj-local_bind)
  * [`fn new(bind, expr)`](#fn-local_bindnew)
  * [`fn withAdditionalBinds(value)`](#fn-local_bindwithadditionalbinds)
  * [`fn withAdditionalBindsMixin(value)`](#fn-local_bindwithadditionalbindsmixin)
  * [`fn withBind(value)`](#fn-local_bindwithbind)
  * [`fn withExpr(value)`](#fn-local_bindwithexpr)
  * [`fn withType()`](#fn-local_bindwithtype)
* [`obj number`](#obj-number)
  * [`fn new(number)`](#fn-numbernew)
  * [`fn withNumber(value)`](#fn-numberwithnumber)
  * [`fn withType()`](#fn-numberwithtype)
* [`obj object`](#obj-object)
  * [`fn new(members)`](#fn-objectnew)
  * [`fn withMembers(value)`](#fn-objectwithmembers)
  * [`fn withMembersMixin(value)`](#fn-objectwithmembersmixin)
  * [`fn withType()`](#fn-objectwithtype)
* [`obj object_forloop`](#obj-object_forloop)
  * [`fn new(field, forspec)`](#fn-object_forloopnew)
  * [`fn withCompspec(value)`](#fn-object_forloopwithcompspec)
  * [`fn withField(value)`](#fn-object_forloopwithfield)
  * [`fn withFieldMixin(value)`](#fn-object_forloopwithfieldmixin)
  * [`fn withForspec(value)`](#fn-object_forloopwithforspec)
  * [`fn withLeftObjectLocals(value)`](#fn-object_forloopwithleftobjectlocals)
  * [`fn withLeftObjectLocalsMixin(value)`](#fn-object_forloopwithleftobjectlocalsmixin)
  * [`fn withRightObjectLocals(value)`](#fn-object_forloopwithrightobjectlocals)
  * [`fn withRightObjectLocalsMixin(value)`](#fn-object_forloopwithrightobjectlocalsmixin)
  * [`fn withType()`](#fn-object_forloopwithtype)
  * [`obj field`](#obj-object_forloopfield)
    * [`fn withField(value)`](#fn-object_forloopfieldwithfield)
    * [`fn withFieldFunction(value)`](#fn-object_forloopfieldwithfieldfunction)
* [`obj object_local`](#obj-object_local)
  * [`fn new(bind)`](#fn-object_localnew)
  * [`fn withBind(value)`](#fn-object_localwithbind)
  * [`fn withType()`](#fn-object_localwithtype)
* [`obj param`](#obj-param)
  * [`fn new(id)`](#fn-paramnew)
  * [`fn withExpr(value)`](#fn-paramwithexpr)
  * [`fn withId(value)`](#fn-paramwithid)
  * [`fn withType()`](#fn-paramwithtype)
* [`obj params`](#obj-params)
  * [`fn new(params)`](#fn-paramsnew)
  * [`fn withParams(value)`](#fn-paramswithparams)
  * [`fn withParamsMixin(value)`](#fn-paramswithparamsmixin)
  * [`fn withType()`](#fn-paramswithtype)
* [`obj parenthesis`](#obj-parenthesis)
  * [`fn new(expr)`](#fn-parenthesisnew)
  * [`fn withExpr(value)`](#fn-parenthesiswithexpr)
  * [`fn withType()`](#fn-parenthesiswithtype)
* [`obj string`](#obj-string)
  * [`fn new(string)`](#fn-stringnew)
  * [`fn withString(value)`](#fn-stringwithstring)
  * [`fn withTextblock(value=true)`](#fn-stringwithtextblock)
  * [`fn withType()`](#fn-stringwithtype)
  * [`fn withVerbatim(value=true)`](#fn-stringwithverbatim)
* [`obj unary`](#obj-unary)
  * [`fn new(unaryop, expr)`](#fn-unarynew)
  * [`fn withExpr(value)`](#fn-unarywithexpr)
  * [`fn withType()`](#fn-unarywithtype)
  * [`fn withUnaryop(value)`](#fn-unarywithunaryop)

## Fields

### obj anonymous_function


#### fn anonymous_function.new

```jsonnet
anonymous_function.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn anonymous_function.withExpr

```jsonnet
anonymous_function.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn anonymous_function.withParams

```jsonnet
anonymous_function.withParams(value)
```

PARAMETERS:

* **value** (`string`)


#### fn anonymous_function.withType

```jsonnet
anonymous_function.withType()
```



### obj arg


#### fn arg.new

```jsonnet
arg.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn arg.withExpr

```jsonnet
arg.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn arg.withId

```jsonnet
arg.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn arg.withType

```jsonnet
arg.withType()
```



### obj array


#### fn array.new

```jsonnet
array.new(items)
```

PARAMETERS:

* **items** (`array`)


#### fn array.withItems

```jsonnet
array.withItems(value)
```

PARAMETERS:

* **value** (`array`)


#### fn array.withItemsMixin

```jsonnet
array.withItemsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn array.withType

```jsonnet
array.withType()
```



### obj assertion


#### fn assertion.new

```jsonnet
assertion.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn assertion.withExpr

```jsonnet
assertion.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn assertion.withReturnExpr

```jsonnet
assertion.withReturnExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn assertion.withType

```jsonnet
assertion.withType()
```



### obj assertion_expr


#### fn assertion_expr.new

```jsonnet
assertion_expr.new(assertion, expr)
```

PARAMETERS:

* **assertion** (`object`)
* **expr** (`object`)


#### fn assertion_expr.withAssertion

```jsonnet
assertion_expr.withAssertion(value)
```

PARAMETERS:

* **value** (`string`)


#### fn assertion_expr.withExpr

```jsonnet
assertion_expr.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn assertion_expr.withType

```jsonnet
assertion_expr.withType()
```



### obj binary


#### fn binary.new

```jsonnet
binary.new(binaryop, left_expr, right_expr)
```

PARAMETERS:

* **binaryop** (`object`)
   - valid values: `"*"`, `"/"`, `"%"`, `"+"`, `"-"`, `"<<"`, `">>"`, `"<"`, `"<="`, `">"`, `">="`, `"=="`, `"!="`, `"in"`, `"&"`, `"^"`, `"|"`, `"&&"`, `"||"`
* **left_expr** (`object`)
* **right_expr** (`object`)


#### fn binary.withBinaryop

```jsonnet
binary.withBinaryop(value)
```

PARAMETERS:

* **value** (`string`)
   - valid values: `"*"`, `"/"`, `"%"`, `"+"`, `"-"`, `"<<"`, `">>"`, `"<"`, `"<="`, `">"`, `">="`, `"=="`, `"!="`, `"in"`, `"&"`, `"^"`, `"|"`, `"&&"`, `"||"`


#### fn binary.withLeftExpr

```jsonnet
binary.withLeftExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn binary.withRightExpr

```jsonnet
binary.withRightExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn binary.withType

```jsonnet
binary.withType()
```



### obj binary_sum


#### fn binary_sum.new

```jsonnet
binary_sum.new(exprs)
```

PARAMETERS:

* **exprs** (`array`)


#### fn binary_sum.withExprs

```jsonnet
binary_sum.withExprs(value)
```

PARAMETERS:

* **value** (`array`)


#### fn binary_sum.withExprsMixin

```jsonnet
binary_sum.withExprsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn binary_sum.withType

```jsonnet
binary_sum.withType()
```



### obj bind


#### fn bind.new

```jsonnet
bind.new(id, expr)
```

PARAMETERS:

* **id** (`object`)
* **expr** (`object`)


#### fn bind.withExpr

```jsonnet
bind.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn bind.withId

```jsonnet
bind.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn bind.withType

```jsonnet
bind.withType()
```



### obj bind_function


#### fn bind_function.new

```jsonnet
bind_function.new(id, expr)
```

PARAMETERS:

* **id** (`object`)
* **expr** (`object`)


#### fn bind_function.withExpr

```jsonnet
bind_function.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn bind_function.withId

```jsonnet
bind_function.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn bind_function.withParams

```jsonnet
bind_function.withParams(value)
```

PARAMETERS:

* **value** (`string`)


#### fn bind_function.withType

```jsonnet
bind_function.withType()
```



### obj boolean


#### fn boolean.new

```jsonnet
boolean.new(boolean)
```

PARAMETERS:

* **boolean** (`string`)
   - valid values: `"true"`, `"false"`


#### fn boolean.withBoolean

```jsonnet
boolean.withBoolean(value)
```

PARAMETERS:

* **value** (`string`)
   - valid values: `"true"`, `"false"`


#### fn boolean.withType

```jsonnet
boolean.withType()
```



### obj compspec


#### fn compspec.new

```jsonnet
compspec.new(items)
```

PARAMETERS:

* **items** (`array`)


#### fn compspec.withItems

```jsonnet
compspec.withItems(value)
```

PARAMETERS:

* **value** (`array`)


#### fn compspec.withItemsMixin

```jsonnet
compspec.withItemsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn compspec.withType

```jsonnet
compspec.withType()
```



### obj conditional


#### fn conditional.new

```jsonnet
conditional.new(if_expr, then_expr)
```

PARAMETERS:

* **if_expr** (`object`)
* **then_expr** (`object`)


#### fn conditional.withElseExpr

```jsonnet
conditional.withElseExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn conditional.withIfExpr

```jsonnet
conditional.withIfExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn conditional.withThenExpr

```jsonnet
conditional.withThenExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn conditional.withType

```jsonnet
conditional.withType()
```



### obj error_expr


#### fn error_expr.new

```jsonnet
error_expr.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn error_expr.withExpr

```jsonnet
error_expr.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn error_expr.withType

```jsonnet
error_expr.withType()
```



### obj expr_in_super


#### fn expr_in_super.new

```jsonnet
expr_in_super.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn expr_in_super.withExpr

```jsonnet
expr_in_super.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn expr_in_super.withType

```jsonnet
expr_in_super.withType()
```



### obj field


#### fn field.new

```jsonnet
field.new(fieldname, expr)
```

PARAMETERS:

* **fieldname** (`string`)
* **expr** (`object`)


#### fn field.withAdditive

```jsonnet
field.withAdditive(value=true)
```

PARAMETERS:

* **value** (`boolean`)
   - default value: `true`


#### fn field.withExpr

```jsonnet
field.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn field.withFieldname

```jsonnet
field.withFieldname(value)
```

PARAMETERS:

* **value** (`string`)


#### fn field.withFieldnameMixin

```jsonnet
field.withFieldnameMixin(value)
```

PARAMETERS:

* **value** (`string`)


#### fn field.withH

```jsonnet
field.withH(value=":")
```

PARAMETERS:

* **value** (`string`)
   - default value: `":"`


#### fn field.withHidden

```jsonnet
field.withHidden(value=true)
```

PARAMETERS:

* **value** (`boolean`)
   - default value: `true`


#### fn field.withType

```jsonnet
field.withType()
```



#### obj field.fieldname


##### fn field.fieldname.withFieldnameExpr

```jsonnet
field.fieldname.withFieldnameExpr(value)
```

PARAMETERS:

* **value** (`string`)


##### fn field.fieldname.withId

```jsonnet
field.fieldname.withId(value)
```

PARAMETERS:

* **value** (`string`)


##### fn field.fieldname.withString

```jsonnet
field.fieldname.withString(value)
```

PARAMETERS:

* **value** (`string`)


### obj field_function


#### fn field_function.new

```jsonnet
field_function.new(fieldname, expr)
```

PARAMETERS:

* **fieldname** (`string`)
* **expr** (`object`)


#### fn field_function.withExpr

```jsonnet
field_function.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn field_function.withFieldname

```jsonnet
field_function.withFieldname(value)
```

PARAMETERS:

* **value** (`string`)


#### fn field_function.withFieldnameMixin

```jsonnet
field_function.withFieldnameMixin(value)
```

PARAMETERS:

* **value** (`string`)


#### fn field_function.withH

```jsonnet
field_function.withH(value=":")
```

PARAMETERS:

* **value** (`string`)
   - default value: `":"`


#### fn field_function.withHidden

```jsonnet
field_function.withHidden(value=true)
```

PARAMETERS:

* **value** (`boolean`)
   - default value: `true`


#### fn field_function.withParams

```jsonnet
field_function.withParams(value)
```

PARAMETERS:

* **value** (`string`)


#### fn field_function.withType

```jsonnet
field_function.withType()
```



#### obj field_function.fieldname


##### fn field_function.fieldname.withFieldnameExpr

```jsonnet
field_function.fieldname.withFieldnameExpr(value)
```

PARAMETERS:

* **value** (`string`)


##### fn field_function.fieldname.withId

```jsonnet
field_function.fieldname.withId(value)
```

PARAMETERS:

* **value** (`string`)


##### fn field_function.fieldname.withString

```jsonnet
field_function.fieldname.withString(value)
```

PARAMETERS:

* **value** (`string`)


### obj fieldaccess


#### fn fieldaccess.new

```jsonnet
fieldaccess.new(exprs, id)
```

PARAMETERS:

* **exprs** (`array`)
* **id** (`object`)


#### fn fieldaccess.withExprs

```jsonnet
fieldaccess.withExprs(value)
```

PARAMETERS:

* **value** (`array`)


#### fn fieldaccess.withExprsMixin

```jsonnet
fieldaccess.withExprsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn fieldaccess.withId

```jsonnet
fieldaccess.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn fieldaccess.withType

```jsonnet
fieldaccess.withType()
```



### obj fieldaccess_super


#### fn fieldaccess_super.new

```jsonnet
fieldaccess_super.new(id)
```

PARAMETERS:

* **id** (`object`)


#### fn fieldaccess_super.withId

```jsonnet
fieldaccess_super.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn fieldaccess_super.withType

```jsonnet
fieldaccess_super.withType()
```



### obj fieldname_expr


#### fn fieldname_expr.new

```jsonnet
fieldname_expr.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn fieldname_expr.withExpr

```jsonnet
fieldname_expr.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn fieldname_expr.withType

```jsonnet
fieldname_expr.withType()
```



### obj forloop


#### fn forloop.new

```jsonnet
forloop.new(expr, forspec)
```

PARAMETERS:

* **expr** (`object`)
* **forspec** (`object`)


#### fn forloop.withCompspec

```jsonnet
forloop.withCompspec(value)
```

PARAMETERS:

* **value** (`string`)


#### fn forloop.withExpr

```jsonnet
forloop.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn forloop.withForspec

```jsonnet
forloop.withForspec(value)
```

PARAMETERS:

* **value** (`string`)


#### fn forloop.withType

```jsonnet
forloop.withType()
```



### obj forspec


#### fn forspec.new

```jsonnet
forspec.new(id, expr)
```

PARAMETERS:

* **id** (`object`)
* **expr** (`object`)


#### fn forspec.withExpr

```jsonnet
forspec.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn forspec.withId

```jsonnet
forspec.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn forspec.withType

```jsonnet
forspec.withType()
```



### obj functioncall


#### fn functioncall.new

```jsonnet
functioncall.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn functioncall.withArgs

```jsonnet
functioncall.withArgs(value)
```

PARAMETERS:

* **value** (`array`)


#### fn functioncall.withArgsMixin

```jsonnet
functioncall.withArgsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn functioncall.withExpr

```jsonnet
functioncall.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn functioncall.withType

```jsonnet
functioncall.withType()
```



### obj id


#### fn id.new

```jsonnet
id.new(id)
```

PARAMETERS:

* **id** (`string`)


#### fn id.withId

```jsonnet
id.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn id.withType

```jsonnet
id.withType()
```



### obj ifspec


#### fn ifspec.new

```jsonnet
ifspec.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn ifspec.withExpr

```jsonnet
ifspec.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn ifspec.withType

```jsonnet
ifspec.withType()
```



### obj implicit_plus


#### fn implicit_plus.new

```jsonnet
implicit_plus.new(expr, object)
```

PARAMETERS:

* **expr** (`object`)
* **object** (`string`)


#### fn implicit_plus.withExpr

```jsonnet
implicit_plus.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn implicit_plus.withObject

```jsonnet
implicit_plus.withObject(value)
```

PARAMETERS:

* **value** (`string`)


#### fn implicit_plus.withObjectMixin

```jsonnet
implicit_plus.withObjectMixin(value)
```

PARAMETERS:

* **value** (`string`)


#### fn implicit_plus.withType

```jsonnet
implicit_plus.withType()
```



#### obj implicit_plus.object


##### fn implicit_plus.object.withObject

```jsonnet
implicit_plus.object.withObject(value)
```

PARAMETERS:

* **value** (`string`)


##### fn implicit_plus.object.withObjectForloop

```jsonnet
implicit_plus.object.withObjectForloop(value)
```

PARAMETERS:

* **value** (`string`)


### obj import_statement


#### fn import_statement.new

```jsonnet
import_statement.new(path)
```

PARAMETERS:

* **path** (`string`)


#### fn import_statement.withPath

```jsonnet
import_statement.withPath(value)
```

PARAMETERS:

* **value** (`string`)


#### fn import_statement.withType

```jsonnet
import_statement.withType()
```



### obj importbin_statement


#### fn importbin_statement.new

```jsonnet
importbin_statement.new(path)
```

PARAMETERS:

* **path** (`string`)


#### fn importbin_statement.withPath

```jsonnet
importbin_statement.withPath(value)
```

PARAMETERS:

* **value** (`string`)


#### fn importbin_statement.withType

```jsonnet
importbin_statement.withType()
```



### obj importstr_statement


#### fn importstr_statement.new

```jsonnet
importstr_statement.new(path)
```

PARAMETERS:

* **path** (`string`)


#### fn importstr_statement.withPath

```jsonnet
importstr_statement.withPath(value)
```

PARAMETERS:

* **value** (`string`)


#### fn importstr_statement.withType

```jsonnet
importstr_statement.withType()
```



### obj indexing


#### fn indexing.new

```jsonnet
indexing.new(expr, exprs)
```

PARAMETERS:

* **expr** (`object`)
* **exprs** (`array`)


#### fn indexing.withExpr

```jsonnet
indexing.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn indexing.withExprs

```jsonnet
indexing.withExprs(value)
```

PARAMETERS:

* **value** (`array`)


#### fn indexing.withExprsMixin

```jsonnet
indexing.withExprsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn indexing.withType

```jsonnet
indexing.withType()
```



### obj indexing_super


#### fn indexing_super.new

```jsonnet
indexing_super.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn indexing_super.withExpr

```jsonnet
indexing_super.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn indexing_super.withType

```jsonnet
indexing_super.withType()
```



### obj literal


#### fn literal.new

```jsonnet
literal.new(literal)
```

PARAMETERS:

* **literal** (`string`)
   - valid values: `"null"`, `"self"`, `"$"`


#### fn literal.withLiteral

```jsonnet
literal.withLiteral(value)
```

PARAMETERS:

* **value** (`string`)
   - valid values: `"null"`, `"self"`, `"$"`


#### fn literal.withType

```jsonnet
literal.withType()
```



### obj local_bind


#### fn local_bind.new

```jsonnet
local_bind.new(bind, expr)
```

PARAMETERS:

* **bind** (`object`)
* **expr** (`object`)


#### fn local_bind.withAdditionalBinds

```jsonnet
local_bind.withAdditionalBinds(value)
```

PARAMETERS:

* **value** (`array`)


#### fn local_bind.withAdditionalBindsMixin

```jsonnet
local_bind.withAdditionalBindsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn local_bind.withBind

```jsonnet
local_bind.withBind(value)
```

PARAMETERS:

* **value** (`string`)


#### fn local_bind.withExpr

```jsonnet
local_bind.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn local_bind.withType

```jsonnet
local_bind.withType()
```



### obj number


#### fn number.new

```jsonnet
number.new(number)
```

PARAMETERS:

* **number** (`string`)


#### fn number.withNumber

```jsonnet
number.withNumber(value)
```

PARAMETERS:

* **value** (`string`)


#### fn number.withType

```jsonnet
number.withType()
```



### obj object


#### fn object.new

```jsonnet
object.new(members)
```

PARAMETERS:

* **members** (`array`)


#### fn object.withMembers

```jsonnet
object.withMembers(value)
```

PARAMETERS:

* **value** (`array`)


#### fn object.withMembersMixin

```jsonnet
object.withMembersMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn object.withType

```jsonnet
object.withType()
```



### obj object_forloop


#### fn object_forloop.new

```jsonnet
object_forloop.new(field, forspec)
```

PARAMETERS:

* **field** (`string`)
* **forspec** (`object`)


#### fn object_forloop.withCompspec

```jsonnet
object_forloop.withCompspec(value)
```

PARAMETERS:

* **value** (`string`)


#### fn object_forloop.withField

```jsonnet
object_forloop.withField(value)
```

PARAMETERS:

* **value** (`string`)


#### fn object_forloop.withFieldMixin

```jsonnet
object_forloop.withFieldMixin(value)
```

PARAMETERS:

* **value** (`string`)


#### fn object_forloop.withForspec

```jsonnet
object_forloop.withForspec(value)
```

PARAMETERS:

* **value** (`string`)


#### fn object_forloop.withLeftObjectLocals

```jsonnet
object_forloop.withLeftObjectLocals(value)
```

PARAMETERS:

* **value** (`array`)


#### fn object_forloop.withLeftObjectLocalsMixin

```jsonnet
object_forloop.withLeftObjectLocalsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn object_forloop.withRightObjectLocals

```jsonnet
object_forloop.withRightObjectLocals(value)
```

PARAMETERS:

* **value** (`array`)


#### fn object_forloop.withRightObjectLocalsMixin

```jsonnet
object_forloop.withRightObjectLocalsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn object_forloop.withType

```jsonnet
object_forloop.withType()
```



#### obj object_forloop.field


##### fn object_forloop.field.withField

```jsonnet
object_forloop.field.withField(value)
```

PARAMETERS:

* **value** (`string`)


##### fn object_forloop.field.withFieldFunction

```jsonnet
object_forloop.field.withFieldFunction(value)
```

PARAMETERS:

* **value** (`string`)


### obj object_local


#### fn object_local.new

```jsonnet
object_local.new(bind)
```

PARAMETERS:

* **bind** (`object`)


#### fn object_local.withBind

```jsonnet
object_local.withBind(value)
```

PARAMETERS:

* **value** (`string`)


#### fn object_local.withType

```jsonnet
object_local.withType()
```



### obj param


#### fn param.new

```jsonnet
param.new(id)
```

PARAMETERS:

* **id** (`object`)


#### fn param.withExpr

```jsonnet
param.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn param.withId

```jsonnet
param.withId(value)
```

PARAMETERS:

* **value** (`string`)


#### fn param.withType

```jsonnet
param.withType()
```



### obj params


#### fn params.new

```jsonnet
params.new(params)
```

PARAMETERS:

* **params** (`array`)


#### fn params.withParams

```jsonnet
params.withParams(value)
```

PARAMETERS:

* **value** (`array`)


#### fn params.withParamsMixin

```jsonnet
params.withParamsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn params.withType

```jsonnet
params.withType()
```



### obj parenthesis


#### fn parenthesis.new

```jsonnet
parenthesis.new(expr)
```

PARAMETERS:

* **expr** (`object`)


#### fn parenthesis.withExpr

```jsonnet
parenthesis.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn parenthesis.withType

```jsonnet
parenthesis.withType()
```



### obj string


#### fn string.new

```jsonnet
string.new(string)
```

PARAMETERS:

* **string** (`string`)


#### fn string.withString

```jsonnet
string.withString(value)
```

PARAMETERS:

* **value** (`string`)


#### fn string.withTextblock

```jsonnet
string.withTextblock(value=true)
```

PARAMETERS:

* **value** (`boolean`)
   - default value: `true`


#### fn string.withType

```jsonnet
string.withType()
```



#### fn string.withVerbatim

```jsonnet
string.withVerbatim(value=true)
```

PARAMETERS:

* **value** (`boolean`)
   - default value: `true`


### obj unary


#### fn unary.new

```jsonnet
unary.new(unaryop, expr)
```

PARAMETERS:

* **unaryop** (`object`)
   - valid values: `"-"`, `"+"`, `"!"`, `"~"`
* **expr** (`object`)


#### fn unary.withExpr

```jsonnet
unary.withExpr(value)
```

PARAMETERS:

* **value** (`string`)


#### fn unary.withType

```jsonnet
unary.withType()
```



#### fn unary.withUnaryop

```jsonnet
unary.withUnaryop(value)
```

PARAMETERS:

* **value** (`string`)
   - valid values: `"-"`, `"+"`, `"!"`, `"~"`

