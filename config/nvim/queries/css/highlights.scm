;; extends

;; selectors
([(at_keyword) (selectors)] @selectors
  (#set! "priority" 110))

;; properties
((property_name) @property
  (#set! "priority" 110))

;; values
([(float_value) (integer_value)] @value
  (#set! "priority" 110))

(string_value
  (string_content) @string) @punctuation.delimiter

((arguments
  (plain_value) @value)
    (#set! "priority" 110))

(feature_query
  (plain_value) @value
  (#set! "priority" 110))

;; vim: ft=query
