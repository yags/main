############################################################################
##
#V  YAGSInfo
##  
##  <#GAPDoc Label="YAGSInfo">
##  <ManSection>
##  <Var Name="YAGSInfo"/>
##  <Description>
##  
##  <P/>A global record where much &YAGS;-related information is
##  stored.  This is intended for internal use, and much of this
##  information is undocumented, but some of the data stored here
##  could possibly be useful for advanced users.
##  
##  <P/>However, storing user information in this record and/or
##  changing the values of the stored information is discouraged and
##  may produce unpredictable results and an unstable system.
##
##  <Log>
##  gap> YAGSInfo;
##  rec( Arch := 1, AuxInfo := "/dev/null",
##    DataDirectory := "/opt/gap4r7/pkg/yags/data",
##    Directory := "/opt/gap4r7/pkg/yags",
##    Draw :=
##      rec( opts := [  ],
##        prog := "/opt/gap4r7/pkg/yags/bin/draw/application.linux64/draw" ),
##    Version := "0.0.1",
##    graph6 := rec( BinListToNum := function( L ) ... end,
##        BinListToNumList := function( L ) ... end,
##        HararyList := [ [ 1, 0, 1 ], [ 2, 0, 1 ], [ 2, 1, 1 ],
##            [ 3, 0, 1 ], [ 3, 1, 1 ], [ 3, 2, 1 ], [ 3, 3, 1 ],
##            [ 4, 0, 1 ], [ 4, 1, 1 ], [ 4, 2, 1 ], [ 4, 3, 3 ],
##            [ 4, 2, 2 ], [ 4, 3, 1 ], [ 4, 3, 2 ], [ 4, 4, 1 ],
##  	  
##     --- many more lines here ---
##     
##            [ 6, 13, 1 ], [ 6, 11, 7 ], [ 6, 11, 9 ], [ 6, 11, 8 ],
##            [ 6, 12, 4 ], [ 6, 12, 5 ], [ 6, 13, 2 ], [ 6, 14, 1 ],
##            [ 6, 15, 1 ] ], McKayN := function( n ) ... end,
##        McKayR := function( L ) ... end,
##        NumListToString := function( L ) ... end,
##        NumToBinList := function( n ) ... end,
##        PadLeftnSplitList6 := function( L ) ... end,
##        PadRightnSplitList6 := function( L ) ... end,
##        StringToBinList := function( Str ) ... end ) )
##  </Log>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("YAGSInfo");

############################################################################
##
#F  IsBoolean( <Obj> )
##  
##  <#GAPDoc Label="IsBoolean">
##  <ManSection>
##  <Func Name="IsBoolean" Arg="Obj"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if object <A>Obj</A> is <C>true</C> or
##  <C>false</C> and <C>false</C> otherwise.
##
##  <Example>
##  gap> IsBoolean( true ); IsBoolean( fail ); IsBoolean ( false );
##  true
##  false
##  true
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("IsBoolean");

## #FIXME: No funciona para coordenadas (por ejemplo), averiguar por que.
############################################################################
##
#O  DumpObject( <Obj> )
##  
##  <#GAPDoc Label="DumpObject">
##  <ManSection>
##  <Oper Name="DumpObject" Arg="Obj"/>
##  <Description>
##  
##  <P/>Dumps all information available for object <A>Obj</A>. This
##  information includes to which categories it belongs as well as its
##  type and hashing information used by &GAP;.
##  
##  <Log>
##  gap> DumpObject( true );
##  Object( TypeObj := NewType( NewFamily( "BooleanFamily", [ 11 ], [ 11 ] ),
##  [ 11, 34 ] ), Categories := [ "IS_BOOL" ] )
##  </Log>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("DumpObject",[IsObject]);

############################################################################
##
#F  DeclareQtfyProperty( <Name>, <Filter> )
##  
##  <#GAPDoc Label="DeclareQtfyProperty">
##  <ManSection>
##  <Func Name="DeclareQtfyProperty" Arg="Name, Filter"/>
##  <Description>
##  
##  <P/>For internal use. 
##  
##  <P/>Declares a &YAGS; quantifiable property named <A>Name</A> for
##  filter <A>Filter</A>.  This in turns, declares a boolean &GAP;
##  property <A>Name</A> and an integer &GAP; attribute
##  <A>QtfyName</A>.
##  
##  <P/>The user must provide the method <A>Name</A>(<A>Obj</A>,
##  <A>qtfy</A>). If <A>qtfy</A> is false, the method must return a
##  boolean indicating whether the property holds, otherwise, the
##  method must return a non-negative integer quantifying how far is
##  the object from satisfying the property.  In the latter case,
##  returning 0 actually means that the object does satisfy the
##  property.
##  
##  <Example>
##  gap> DeclareQtfyProperty("Is2Regular",Graphs);
##  gap> InstallMethod(Is2Regular,"for graphs",true,[Graphs,IsBool],0,
##  > function(G,qtfy)
##  >   local x,count;
##  >   count:=0;
##  >   for x in Vertices(G) do
##  >     if VertexDegree(G,x)&lt;> 2 then 
##  >       if not qtfy then
##  >         return false;
##  >       fi;
##  >         count:=count+1;
##  >     fi;
##  >   od;
##  >   if not qtfy then return true; fi;
##  >   return count;
##  > end);
##  gap> Is2Regular(CycleGraph(4));
##  true
##  gap> QtfyIs2Regular(CycleGraph(4));
##  0
##  gap> Is2Regular(DiamondGraph);     
##  false
##  gap> QtfyIs2Regular(DiamondGraph);
##  2
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("DeclareQtfyProperty");
InstallGlobalFunction(DeclareQtfyProperty,
function(N,F) 
   local Qtfyname; 
   Qtfyname:=Concatenation("Qtfy",N);
   DeclareProperty(N,F);
   DeclareAttribute(Qtfyname,F);
   DeclareOperation(N,[F,IsBool]); # to be provided by user

   InstallMethod(ValueGlobal(N),"trying easy way",true,[F],0,
   function(Obj) 
       if Tester(ValueGlobal(Qtfyname))(Obj) then
          return ValueGlobal(Qtfyname)(Obj)=0;
       else
          return ValueGlobal(N)(Obj,false); 
       fi;
   end); 

   InstallMethod(ValueGlobal(Qtfyname),"trying easy way",true,[F],0,
   function(Obj)  
       if Tester(ValueGlobal(N))(Obj) and 
                 ValueGlobal(N)(Obj)=true then
          return 0;
       else
          return ValueGlobal(N)(Obj,true); 
       fi;
   end); 
end);

## FIXME: Be more explicit.
############################################################################
##  
#F  UFFind( <UFS>, <x> )
##  
##  <#GAPDoc Label="UFFind">
##  <ManSection>
##  <Func Name="UFFind" Arg="UFS, x"/>
##  <Description>
##  
##  <P/>For internal use. Implements the <A>find</A> operation on the
##  <A>union-find structure</A>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("UFFind");

## FIXME: Be more explicit.
############################################################################
##
#F  UFUnite( <UFS>, <x>, <y> )
##  
##  <#GAPDoc Label="UFUnite">
##  <ManSection>
##  <Func Name="UFUnite" Arg="UFS, x, y"/>
##  <Description>
##  
##  <P/>For internal use. Implements the <A>unite</A> operation on the
##  <A>union-find structure</A>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("UFUnite");

############################################################################
##
#O  RandomlyPermuted( <Obj> )
##  
##  <#GAPDoc Label="RandomlyPermuted">
##  <ManSection>
##  <Oper Name="RandomlyPermuted" Arg="Obj"/>
##  <Description>
##  
##  <P/>Returns a copy of <A>Obj</A> with the order of its elements
##  permuted randomly.  Currently, the operation is implemented for
##  lists and graphs.
##
##  <Example>
##  gap> RandomlyPermuted([1..9]);
##  [ 9, 7, 5, 3, 1, 4, 8, 6, 2 ]
##  gap> g:=PathGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] )
##  gap> RandomlyPermuted(g);           
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 3 ], [ 3, 4 ], [ 1, 2 ], [ 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("RandomlyPermuted",[IsObject]);

############################################################################
##  
#O  RandomPermutation( <n> )
##  
##  <#GAPDoc Label="RandomPermutation">
##  <ManSection>
##  <Oper Name="RandomPermutation" Arg="n"/>
##  <Description>
##  
##  <P/>Returns a random permutation of the list <C>[1, 2,
##  ... <A>n</A>]</C>.
##  
##  <Example>
##  gap> RandomPermutation(12);
##  (1,12,8,10,2,9,6,5)(3,7,11)
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("RandomPermutation",[IsInt]);

############################################################################
##  
#O  RandomSubset( <Set> )
#O  RandomSubset( <Set>, <k> )
#O  RandomSubset( <Set>, <p> )
##  
##  <#GAPDoc Label="RandomSubset">
##  <ManSection>
##  <Oper Name="RandomSubset" Arg="Set"/>
##  <Oper Name="RandomSubset" Arg="Set, k"/>
##  <Oper Name="RandomSubset" Arg="Set, p"/>
##  <Description>
##  
##  <P/>Returns a random subset of the set <A>Set</A>. When the
##  positive integer <A>k</A> is provided, the returned subset has
##  <A>k</A> elements (or <C>fail</C> if <A>Set</A> does not have at
##  least <A>k</A> elements).  When the probability <A>p</A> is
##  provided, each element of <A>Set</A> has probability <A>p</A> of
##  being selected for inclusion in the returned subset. When <A>k</A>
##  and <A>p</A> are both missing, it is equivalent to specifying
##  <A>p</A>=1/2. In the ambiguous case when the second parameter is
##  1, it is interpreted as the value of <A>k</A>.
##  
##  <Example>
##  gap> RandomSubset([1..10],5);
##  [ 10, 7, 5, 3, 1 ]
##  gap> RandomSubset([1..10],5);
##  [ 4, 10, 9, 6, 1 ]
##  gap> RandomSubset([1..10],5);
##  [ 5, 2, 6, 7, 9 ]
##  gap> RandomSubset([1..10],5);
##  [ 10, 7, 3, 8, 9 ]
##  gap> RandomSubset([1..10],1/2);
##  [ 1, 3, 5, 8, 9 ]
##  gap> RandomSubset([1..10],1/2);
##  [ 3, 4, 8, 10 ]
##  gap> RandomSubset([1..10],1/2);
##  [ 1, 4, 7, 10 ]
##  gap> RandomSubset([1..10],1/2);
##  [ 1, 2, 5, 7, 9 ]
##  </Example>
##  
##  <P/>Even if this operation is intended to be applied to sets, it
##  does not impose this condition on its operand, and can be applied
##  to lists as well.
##  
##  <Example>
##  gap> RandomSubset([1,3,2,2,3,2,1]);
##  [ 1, 3 ]
##  gap> RandomSubset([1,3,2,2,3,2,1]);
##  [ 3, 2, 2, 3, 1 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("RandomSubset",[IsList,IsRat]);

############################################################################
##  
#O  EquivalenceRepresentatives( <L>, <Eqiv> )
##  
##  <#GAPDoc Label="EquivalenceRepresentatives">
##  <ManSection>
##  <Oper Name="EquivalenceRepresentatives" Arg="L, Eqiv"/>
##  <Description>
##  
##  <P/>Returns a sublist of <A>L</A>, which is a complete list of
##  representatives of <A>L</A> under the equivalent relation
##  <A>Equiv</A>.
##  
##  <Example>
##  gap> L:=[10,2,6,5,9,7,3,1,4,8];
##  [ 10, 2, 6, 5, 9, 7, 3, 1, 4, 8 ]
##  gap> EquivalenceRepresentatives(L,function(x,y) return (x mod 4)=(y mod 4); end);
##  [ 10, 5, 7, 4 ]
##  gap> L:=Links(SnubDisphenoid);;Length(L);
##  8
##  gap> L:=EquivalenceRepresentatives(L,IsIsomorphicGraph);;Length(L); 
##  2
##  gap> L;
##  [ Graph( Category := SimpleGraphs, Order := 5, Size := 
##      5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], 
##        [ 1, 4 ] ] ), Graph( Category := SimpleGraphs, Order := 
##      4, Size := 4, Adjacencies := [ [ 2, 3 ], [ 1, 4 ], [ 1, 4 ], 
##        [ 2, 3 ] ] ) ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EquivalenceRepresentatives",[IsList,IsFunction]);

#E
