try:
    from rich import print  # pretty print
    from rich import pretty

    pretty.install()  # pretty tracebacks
except ImportError:
    pass
