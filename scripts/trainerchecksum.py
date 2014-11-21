import struct
import sys

out = open(sys.argv[2], 'w')
sum = 0
with open(sys.argv[1], 'rb') as f:
	buf = f.read()
	data = struct.unpack('<IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII', buf)
	for word in data:
		sum = (sum + word) % 2**32
f.closed
out.write(buf)
out.write(struct.pack('<I', sum))