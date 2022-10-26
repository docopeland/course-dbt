{% macro sum_non_null(column_name) %}
    sum(case when {{ column_name }} is not null then {{ column_name }} else 0 end)
{% endmacro %}