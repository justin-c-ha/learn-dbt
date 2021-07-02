{% macro limit_data_dev(column_name, years = 10) -%}

    {% if target.name == 'default' %}
    where {{ column_name }} >= dateadd('year', - {{ years }}, current_timestamp)
    {% endif %}

{%- endmacro -%}