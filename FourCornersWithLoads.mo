within ABS;

model FourCornersWithLoads
  import ABS.Single_Corner.RoadTypes;
  
  parameter SI.Mass wheelMass;
  parameter SI.Inertia wheelInertia;
  parameter RoadTypes.RoadType road=RoadTypes.RoadType.wetAsphalt;
  
  Single_Corner.SingleCornerWithLoad rearL(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road) annotation(
    Placement(transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}})));
  Single_Corner.SingleCornerWithLoad rearR(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road) annotation(
    Placement(transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}})));
  Single_Corner.SingleCornerWithLoad frontL(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road) annotation(
    Placement(transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}})));
  Single_Corner.SingleCornerWithLoad frontR(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road) annotation(
    Placement(transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Components.Mass carMass annotation(
    Placement(transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia engineInertia annotation(
    Placement(transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput rearLoad annotation(
    Placement(transformation(origin = {-40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-48, 62}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput frontLoad annotation(
    Placement(transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {28, 62}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR annotation(
    Placement(transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(
    Placement(transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {90, -8}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(carMass.flange_a, frontL.flange_T) annotation(
    Line(points = {{60, -10}, {52, -10}, {52, 10}, {40, 10}}, color = {0, 127, 0}));
  connect(frontR.flange_T, carMass.flange_a) annotation(
    Line(points = {{40, -30}, {52, -30}, {52, -10}, {60, -10}}, color = {0, 127, 0}));
  connect(rearL.flange_T, carMass.flange_a) annotation(
    Line(points = {{-30, 10}, {-30, -10}, {60, -10}}, color = {0, 127, 0}));
  connect(rearR.flange_T, carMass.flange_a) annotation(
    Line(points = {{-30, -30}, {-30, -10}, {60, -10}}, color = {0, 127, 0}));
  connect(engineInertia.flange_b, rearL.flange_R) annotation(
    Line(points = {{-60, -10}, {-58, -10}, {-58, 10}, {-50, 10}}));
  connect(engineInertia.flange_b, rearR.flange_R) annotation(
    Line(points = {{-60, -10}, {-58, -10}, {-58, -30}, {-50, -30}}));
  connect(frontL.flange_R, engineInertia.flange_b) annotation(
    Line(points = {{20, 10}, {12, 10}, {12, -6}, {-38, -6}, {-38, -10}, {-60, -10}}));
  connect(frontR.flange_R, engineInertia.flange_b) annotation(
    Line(points = {{20, -30}, {12, -30}, {12, -6}, {-38, -6}, {-38, -10}, {-60, -10}}));
  connect(rearLoad, rearL.carLoad) annotation(
    Line(points = {{-40, 70}, {-40, 20}}, color = {0, 0, 127}));
  connect(frontLoad, frontL.carLoad) annotation(
    Line(points = {{30, 70}, {30, 20}}, color = {0, 0, 127}));
  connect(engineInertia.flange_a, flangeR) annotation(
    Line(points = {{-80, -10}, {-90, -10}}));
  connect(carMass.flange_b, flange_b) annotation(
    Line(points = {{80, -10}, {90, -10}}, color = {0, 127, 0}));
  connect(rearLoad, rearR.carLoad) annotation(
    Line(points = {{-40, 70}, {-40, 46}, {-20, 46}, {-20, -18}, {-40, -18}, {-40, -20}}, color = {0, 0, 127}));
  connect(frontLoad, frontR.carLoad) annotation(
    Line(points = {{30, 70}, {30, 46}, {46, 46}, {46, -16}, {30, -16}, {30, -20}}, color = {0, 0, 127}));
end FourCornersWithLoads;