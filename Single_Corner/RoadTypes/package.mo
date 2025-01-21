within ABS.Single_Corner;

package RoadTypes
  extends Modelica.Icons.TypesPackage;
  type RoadType=enumeration(
    wetAsphalt "1",
    dryAsphalt "2",
    snow "3",
    cobblestone "4"
  );
  final constant Real wetAsphaltTheta[3] = {0.86,33.82,0.35};
  final constant Real dryAsphaltTheta[3] = {1.28,23.99,0.52};
  final constant Real snowTheta[3]   = {0.19,94.13,0.06};
  final constant Real cobblestoneTheta[3]   = {1.37,6.46,0.67};

  //Array indexed by the enumeration: the order of array elements must match exactly the enumeration literals (wetAsphalt=1, dryAsphalt=2, Snow=3, Cobblestone=4).
  final constant Real[3] roadData[RoadType] = {
    wetAsphaltTheta, dryAsphaltTheta, snowTheta, cobblestoneTheta
  };annotation(
    Documentation(info = "<html><head></head><body>This package holds the enumeration type RoadType and the vector of theta coefficients RoadData used to compute a Burckahrdt model friction-slip curve.</body></html>"));
  
end RoadTypes;