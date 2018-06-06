#!/usr/bin/python2.6
from modeller import *
from modeller.automodel import *    # Load the automodel class

log.verbose()
env = environ()

# directories for input atom files
env.io.atom_files_directory = ['.']

class MyModel(automodel):
    def select_atoms(self):
        return selection(self.residue_range('52', '56'))

a = MyModel(env, alnfile = 'alignment.ali',
            knowns = '4wei', sequence = '4wei_fill')
a.starting_model= 1
a.ending_model  = 1

a.make()
