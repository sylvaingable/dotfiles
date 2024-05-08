import tracemalloc
from contextlib import contextmanager
from typing import Generator


@contextmanager
def trace_memory() -> Generator[None, None, None]:
    tracemalloc.start()
    try:
        yield
    finally:
        current, peak = tracemalloc.get_traced_memory()
        print(
            f"Current memory usage is {current / 10**6:.3f}MB;"
            f" Peak was {peak / 10**6:.3f}MB"
        )
        tracemalloc.stop()
