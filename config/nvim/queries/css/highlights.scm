;; extends

([
  (attribute_name)
  (class_selector)
  (id_selector)
  (universal_selector)
] @selector
  (#set! "priority" 110))

(declaration
  (property_name) @property
  [(integer_value) (float_value) (plain_value)] @value
  (#set! "priority" 110))

([(keyword_query) (unit)] @value)

(feature_query
  (feature_name) @value
  (plain_value) @value)

(call_expression
  (function_name)
  (arguments
    (plain_value) @value))

;; vim: ft=query
