
############################################################################
##
#P  IsDiamondFree( <G>, <qtfy> )
##
##  Returns `true' if <G> is free from induced diamonds, `false' otherwise.
##  
##  \beginexample
##  gap> IsDiamondFree(Cube);
##  true
##  gap> IsDiamondFree(Octahedron);
##  false
##  \endexample
##                                      
##  --map
DeclareQtfyProperty("IsDiamondFree",SimpleGraphs);
