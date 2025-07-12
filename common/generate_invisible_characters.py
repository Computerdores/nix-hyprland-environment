#!/usr/bin/env python
import sys

data = f"[ \"{'" "'.join([chr(0xe0060 + i) for i in range(128)])}\" ]".encode()

with open(sys.argv[1], "wb") as f:
    f.write(data)
