import struct
import sys

out = open(sys.argv[2], 'w')
sum = 0
with open(sys.argv[1], 'rb') as f:
	while True:
		byte = f.read(1)
		if not byte:
			break

		sum += ord(byte)
		out.write(byte)
f.closed

out.write(struct.pack('<I', sum))