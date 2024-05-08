from decimal import Decimal
from io import BytesIO

try:
    from django.db.models.base import ModelBase
except ImportError:
    pass
try:
    from openpyxl import Workbook
except ImportError:
    pass
try:
    from rich import print
    from rich.table import Table
except ImportError:
    pass


def to_xlsx(*, headers, rows):
    """
    Returns the binary content fo the given headers and rows exported as an
    XLSX file
    """
    workbook = Workbook()
    buffer = BytesIO()
    worksheet = workbook.active
    for row_idx, row in enumerate((headers, *rows), start=1):
        for col_idx, value in enumerate(row, start=1):
            cell = worksheet.cell(row_idx, col_idx)
            cell.value = value
            # Format decimals with two decimal place
            if isinstance(value, Decimal):
                cell.number_format = "0.00"
    workbook.save(buffer)
    return buffer.getvalue()


def print_table(*, headers, rows):
    """
    Pretty prints a table to stdout.

    It may require to set an env variable PYTHONIOENCODING=utf8 beforehand.
    """
    table = Table(*headers)
    for row in rows:
        table.add_row(*[str(value) for value in row])
    print(table)


def qs_table(queryset, *fields):
    """Pretty prints queryset as a table."""
    if isinstance(queryset, ModelBase):
        queryset = queryset.objects.all()
    if not fields:
        fields = [field.name for field in queryset.model._meta.fields]
    print_table(headers=fields, rows=queryset.values_list(*fields))
