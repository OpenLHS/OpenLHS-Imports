PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX cco: <http://www.ontologyrepository.com/CommonCoreOntologies/>

INSERT {
  obo:RO_0000052 rdf:type owl:ObjectProperty .
  cco:capability_of rdfs:subPropertyOf obo:RO_0000052

}

WHERE {}