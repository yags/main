
# Yags

Yags is a [GAP](http://gap-system.org/) package for working with graphs (in the sense of graph
theory). It is intended to be an alternative to [GRAPE](http://gap-system.org/Packages/grape.html).

# Obtaining Yags

Yags can be obtained from [its page](https://github.com/yags/main) at Github.

# Installation

To try Yags, you can first install it from git at a local
directory. In a terminal, move to the directory `~/gaplocal`, then 
get the Yags files:

    git clone http://github.com/yags/main.git pkg/yags

and then start `gap` with 

    gap -r -l ";~/gaplocal"

The option `-r` makes `gap` not to read your initialization files, which
might conflict with Yags current function names, especially if you
load GRAPE. After GAP starts, you should be able to load Yags:

    gap> RequirePackage("yags");
    
    Loading  YAGS 0.01  (Yet Another Graph System),
    by  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
    rene@xamanek.izt.uam.mx, map@xamanek.izt.uam.mx, rafaelv@uaeh.edu.mx
    
    true
