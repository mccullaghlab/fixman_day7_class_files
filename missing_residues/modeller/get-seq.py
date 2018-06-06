#!/usr/bin/python2.6
from modeller import *
# Get sequence and write to an alignment file
code = '4wei'

e = environ()
m = model(e, file=code)
aln = alignment(e)
aln.append_model(m, align_codes=code)
aln.write(file=code+'.seq')
