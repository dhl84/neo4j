//Load Nodes
:auto USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Control Result'
MERGE (cr:ControlResult{Name:row.Name}) set cr.Label = row.Label, cr.Description = row.`Description Node`
return cr.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'System Data Concept'
MERGE (sdc:SystemDataConcept{Name:row.Name}) set sdc.Label = row.Label, sdc.Description = row.`Description Node`
return sdc.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'System Data Element'
MERGE (sde:SystemDataElement{Name:row.Name}) set sde.Label = row.Label, sde.Description = row.`Description Node`
return sde.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Business Data Element'
MERGE (n:BusinessDataElement{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Control Instance'
MERGE (n:ControlInstance{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Data Quality Dimension'
MERGE (n:DataQualityDimension{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Boundary Value'
MERGE (n:BoundaryValue{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Boundary Set'
MERGE (n:BoundarySet{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Business Data Concept'
MERGE (n:BusinessDataConcept{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'System'
MERGE (n:System{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Data Feed'
MERGE (n:DataFeed{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Boundary Dimension'
MERGE (n:BoundaryDimension{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Org Unit'
MERGE (n:OrgUnit{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Material Transformation'
MERGE (n:MaterialTransformation{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Business Data Domain'
MERGE (n:BusinessDataDomain{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Person'
MERGE (n:Person{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Report'
MERGE (n:Report{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;

LOAD CSV WITH HEADERS FROM file:///Nodes.csv AS row
with row WHERE row.`Node Types` = 'Regulator'
MERGE (n:Regulator{Name:row.Name}) set n.Label = row.Label, n.Description = row.`Description Node`
return n.Name;



//Load Edges
LOAD CSV WITH HEADERS FROM file:///Edges.csv AS row
match (n1 {Name: row.`Node 1`}), (n2 {Name: row.`Node 2`})
call apoc.create.relationship(n1, row.relation,{}, n2) YIELD  rel
return rel
