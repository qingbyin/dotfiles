# To check the modules has been loaded in gdb:
# (gdb) info pretty-printer
python
import sys
import os
sys.path.append(os.path.expanduser("~/.gdbscripts/"))
# Eigen
from eigen import register_eigen_printers
register_eigen_printers (None)
end


