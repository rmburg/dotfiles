; https://doc.omnetpp.org/omnetpp/manual/index.html#cha:ned-language-grammar

[
  ; "class"
  ; "return"
  "module"
  "moduleinterface"
  "network"
  "import"
  "simple"
  "package"
  "extends"
  "types"
  "channel"
  "parameters"
  "connections"
  "gates"
  "submodules"
  "like"
] @keyword

[
  (allowunconnected)
] @keyword.storage.modifier

[
  "if"
] @keyword.control.conditional

[
  "for"
] @keyword.control.repeat

[
  "true"
  "false"
] @constant.builtin.boolean

[
  "nan"
  "inf"
  "null"
  "nullptr"
  "undefined"
] @constant.builtin

[
  (comment)
  (inline_comment)
] @comment

(import (name) @namespace)

(package (name) @namespace)

[
  (type)
  (like_type)
] @type

[
  "this"
] @variable.builtin

[
  "="
  "+"
  "-"
  "*"
  "/"
  "#"
  ; "##"
  "!="
  ; "=~"
  "<=>"
  "&&"
  ".."
  (plusplus)
  (arrow)
] @operator

[
  "."
  ","
  ":"
  ";"
  "::"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "<"
  ">"
] @punctuation.bracket

(module
  (name) @type
  (implements)? @type)

(network
  (name) @type)

(connection
  (src
    (module
      (name) @variable.other.member))
  (dest
    (module
      (name) @variable.other.member)))

(simple
  (name) @type
  (extends)? @type)

(moduleinterface
  (name) @type)

(submodule
  (name) @variable.other.member)

(channel
  (name) @type
  (extends)? @type)

(value_list) @string

; https://doc.omnetpp.org/omnetpp/manual/index.html#cha:ned-functions
(value
  [
    ; conversion
    "bool"
    "double"
    "int"
    "string"
    "default"

    ; i/o
    ; math
    ; misc
    ; ned
    ; random/continuous
    ; "uniform"
    ; random/discrete
    ; strings
    ; units
    ; xml
    ; units/conversion
  ]* @function.builtin)

(property
  "@" @special
  (name) @special)

(inline_properties
  "@" @special
  (name) @special)

(parameter
  parameter_signature: (name)? @variable
  (value) @variable)

(gate
  (name)
  (subgate)? @variable.other.member)
