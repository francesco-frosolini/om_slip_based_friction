within ABS.Single_Corner;

model SingleCornerWithLoad

  parameter SI.Mass wheelMass;
  parameter SI.Length wheelR;
  parameter SI.Inertia wheelInertia;
  parameter RoadTypes.RoadType road;

  Wheel wheel(useDynLoad = true, m=wheelMass,R=wheelR)  annotation(
    Placement(transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}})));
  BurckhardtFriction burckhardtFriction(roadType=road) annotation(
    Placement(transformation(origin = {0, -24}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_T annotation(
    Placement(transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_R annotation(
    Placement(transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=wheelInertia) annotation(
    Placement(transformation(origin = {-52, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput carLoad annotation(
    Placement(transformation(origin = {1, 91}, extent = {{-11, -11}, {11, 11}}, rotation = -90), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(wheel.contactPoint_a, burckhardtFriction.contactPoint_b) annotation(
    Line(points = {{0, 4}, {0, -8}}));
  connect(burckhardtFriction.flange_b, wheel.flangeL) annotation(
    Line(points = {{-16, -24}, {-16, 8}}, color = {0, 127, 0}));
  connect(inertia.flange_a, flange_R) annotation(
    Line(points = {{-62, 20}, {-90, 20}, {-90, 10}}));
  connect(inertia.flange_b, wheel.flangeR) annotation(
    Line(points = {{-42, 20}, {-20, 20}}));
  connect(carLoad, wheel.dynLoad) annotation(
    Line(points = {{1, 91}, {0, 91}, {0, 40}}, color = {0, 0, 127}));
  connect(wheel.flangeT, flange_T) annotation(
    Line(points = {{20, 20}, {90, 20}, {90, 10}}, color = {0, 127, 0}));

annotation(
    Documentation(info = "<html><head></head><body>Single Corner model comprised of a wheel, the wheel's inertia and the ground. The car's static and dynamic load forces must be input through the connector from outside this model. A mass component must be connected to the wheel's translational flange too.</body></html>"),
  Icon(graphics = {Ellipse(fillColor = {192, 191, 188}, fillPattern = FillPattern.Sphere, extent = {{-60, 60}, {60, -60}}), Ellipse(origin = {1, 0},fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, extent = {{-41, 40}, {41, -40}}), Rectangle(origin = {0, -67}, fillColor = {222, 221, 218}, fillPattern = FillPattern.Forward, extent = {{-100, 7}, {100, -7}}), Rectangle(origin = {1, 39}, lineColor = {154, 153, 150}, fillColor = {222, 221, 218}, fillPattern = FillPattern.VerticalCylinder, extent = {{-11, 41}, {11, -41}})}));
end SingleCornerWithLoad;