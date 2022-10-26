{% macro count_non_null(column_name) %}
    sum(case when {{ column_name }} is not null then 1 else 0 end)
{% endmacro %}