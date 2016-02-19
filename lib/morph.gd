##################################################################
##
#O  NextPropertyMorphism( <G>, <H>, <F>, <PropList> )
##  
##  <#GAPDoc Label="NextPropertyMorphism">
##  <ManSection>
##  <Oper Name="NextPropertyMorphism" Arg="G, H, F, PropList"/>
##  <Description>
##
##  Returns the next morphism (in lexicographic order) from <A>G</A> to <A>H</A> 
##  satisfying the list of properties <A>PropList</A> starting with (possibly incomplete) 
##  morphism <A>F</A>. The morphism found will me returned *and* stored in <A>F</A>
##  in order to use it as the next starting point, in case <C>NextPropertyMorphism</C>
##  is called again. The operation returns <C>fail</C> if there are no more morphisms of 
##  the specified type.
##
##  A number of preprogrammed properties are provided by &YAGS;, and the user may create 
##  additional ones. The properties provided are: <C>CHK_WEAK</C>, <C>CHK_MORPH</C>, <C>CHK_METRIC</C>, 
##  <C>CHK_CMPLT</C>, <C>CHK_MONO</C> and <C>CHK_EPI</C>.
##
##  If <A>G</A> has <A>n</A> vertices and $f:G\rightarrow H$ is a morphism, it is 
##  represented as <C><A>F</A>=[f(1), f(2), ..., f(n)]</C>. 
##
##  <Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> f:=[];; PropList:=[CHK_MORPH,CHK_MONO];;                   
##  gap> NextPropertyMorphism(g,h,f,PropList);                    
##  [ 1, 3, 2, 4 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 1, 4, 2, 3 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 2, 3, 1, 4 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 2, 4, 1, 3 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 3, 1, 4, 2 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 3, 2, 4, 1 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 4, 1, 3, 2 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 4, 2, 3, 1 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  fail
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextPropertyMorphism",[Graphs,Graphs,IsList,IsList]);

##################################################################
##
#O  PropertyMorphism( <G>, <H>, <PropList> )
##  
##  <#GAPDoc Label="PropertyMorphism">
##  <ManSection>
##  <Oper Name="PropertyMorphism" Arg="G, H, PropList"/>
##  <Description>
##
##  Returns the first morphism (in lexicographic order) from <A>G</A> to <A>H</A> 
##  satisfying the list of properties <A>PropList</A>.
##
##  A number of preprogrammed properties are provided by &YAGS;, and the user may create 
##  additional ones. The properties provided are: <C>CHK_WEAK</C>, <C>CHK_MORPH</C>, <C>CHK_METRIC</C>, 
##  <C>CHK_CMPLT</C>, <C>CHK_MONO</C> and <C>CHK_EPI</C>.
##
##  If <A>G</A> has <A>n</A> vertices and $f:G\rightarrow H$ is a morphism, it is 
##  represented as <C><A>F</A>=[f(1), f(2), ..., f(n)]</C>. 
##
##  <Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> PropList:=[CHK_MORPH];;                            
##  gap> PropertyMorphism(g,h,PropList);                          
##  [ 1, 3, 1, 3 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("PropertyMorphism",[Graphs,Graphs,IsList]);

##################################################################
##
#O  PropertyMorphisms( <G>, <H>, <PropList> )
##  
##  <#GAPDoc Label="PropertyMorphisms">
##  <ManSection>
##  <Oper Name="PropertyMorphisms" Arg="G, H, PropList"/>
##  <Description>
##
##  Returns all morphisms from <A>G</A> to <A>H</A> 
##  satisfying the list of properties <A>PropList</A>.
##
##  A number of preprogrammed properties are provided by &YAGS;, and the user may create 
##  additional ones. The properties provided are: <C>CHK_WEAK</C>, <C>CHK_MORPH</C>, <C>CHK_METRIC</C>, 
##  <C>CHK_CMPLT</C>, <C>CHK_MONO</C> and <C>CHK_EPI</C>.
##
##  If <A>G</A> has <A>n</A> vertices and $f:G\rightarrow H$ is a morphism, it is 
##  represented as <C><A>F</A>=[f(1), f(2), ..., f(n)]</C>. 
##
##  <Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> PropList:=[CHK_WEAK,CHK_MONO];;                    
##  gap> PropertyMorphisms(g,h,PropList);
##  [ [ 1, 3, 2, 4 ], [ 1, 4, 2, 3 ], [ 2, 3, 1, 4 ], [ 2, 4, 1, 3 ], 
##    [ 3, 1, 4, 2 ], [ 3, 2, 4, 1 ], [ 4, 1, 3, 2 ], [ 4, 2, 3, 1 ] ]
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("PropertyMorphisms",[Graphs,Graphs,IsList]);


####The following code was automatically generated:

##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextMetricMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextEpiMetricMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextMonoMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextFullMonoMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextBiMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextFullBiMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextCompleteEpiWeakMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextCompleteEpiMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextCompleteWeakMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextCompleteMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextFullEpiWeakMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextFullEpiMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextFullWeakMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextFullMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextEpiWeakMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextEpiMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextWeakMorphism",[Graphs,Graphs,IsList]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextMorphism",[Graphs,Graphs,IsList]);

##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("MetricMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EpiMetricMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("MonoMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullMonoMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("BiMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullBiMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteEpiWeakMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteEpiMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteWeakMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullEpiWeakMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullEpiMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullWeakMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EpiWeakMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EpiMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("WeakMorphism",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Morphism",[Graphs,Graphs]);

##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("MetricMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EpiMetricMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("MonoMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullMonoMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("BiMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullBiMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteEpiWeakMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteEpiMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteWeakMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompleteMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullEpiWeakMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullEpiMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullWeakMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("FullMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EpiWeakMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EpiMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("WeakMorphisms",[Graphs,Graphs]);
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Morphisms",[Graphs,Graphs]);



