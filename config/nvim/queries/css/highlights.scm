;; extends

((selectors) @selector
  (#set! "priority" 110))

(declaration
  (property_name) @property
  (_) @value
  (#set! "priority" 110))

((parenthesized_query) @value)

(call_expression
  (function_name)
  (arguments
    (plain_value) @value))

;; vim: ft=query
