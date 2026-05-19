;; extends

([
  (attribute_name)
  (class_selector)
  (id_selector)
] @selector
  (#set! "priority" 110))

([
  (keyword_query)
  (unit)
] @number)

(declaration
  (property_name) @property)

(feature_query
  (feature_name) @selector
  (plain_value) @number)

(call_expression
  (function_name)
  (arguments
    (plain_value) @number))

;; vim: ft=query
