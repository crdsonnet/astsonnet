local a = import './main.libsonnet';

a.object.new([
  a.field.new(
    a.id.new('hello'),
    a.string.new('world'),
  ),
]).toString()
