import struct
import sys

out = open(sys.argv[2], 'w')
sum = 0x1121
len = 0
with open(sys.argv[1], 'rb') as f:
	while True:
		byte = f.read(1)
		if not byte:
			break

		sum ^= ord(byte)
		for i in range(8):
			if(sum & 1):
				sum = (sum >> 1) ^ 0x8408
			else:
				sum >>= 1
		len += 1
	sum = ~sum & 0xFFFF
f.closed

out.write(struct.pack('<I', sum))
out.write(struct.pack('<I', 0x0200001E))
out.write(struct.pack('<I', 0x0200001E + len))
with open(sys.argv[1], 'rb') as f:
	out.write(f.read())
f.closed