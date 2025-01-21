within ABS.Single_Corner.Examples;

model PureRollingTest
  extends Modelica.Icons.Example;
  Wheel wheel(R = 0.4, m = 400)  annotation(
    Placement(transformation(origin = {50, 0}, extent = {{-20, -20}, {20, 20}})));
  DryFriction dryFriction annotation(
    Placement(transformation(origin = {50, -46}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 400, s(start = 0), v(start = 0))  annotation(
    Placement(transformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1.25, phi(start = 0, fixed = true))  annotation(
    Placement(transformation(origin = {12, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 500, duration = 3, offset = 1000, startTime = 1)  annotation(
    Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(wheel.contactPoint_a, dryFriction.contactPoint_b) annotation(
    Line(points = {{50, -16}, {50, -30}}, color = {0, 127, 0}));
  connect(wheel.flangeT, mass.flange_a) annotation(
    Line(points = {{70, 0}, {78, 0}}, color = {0, 127, 0}));
  connect(wheel.flangeR, inertia.flange_b) annotation(
    Line(points = {{30, 0}, {22, 0}}));
  connect(wheel.flangeL, dryFriction.flange_b) annotation(
    Line(points = {{36, -14}, {34, -14}, {34, -46}}, color = {0, 127, 0}));
  connect(ramp.y, torque.tau) annotation(
    Line(points = {{-69, 0}, {-36, 0}}, color = {0, 0, 127}));
  connect(torque.flange, inertia.flange_a) annotation(
    Line(points = {{-14, 0}, {2, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01),
  Documentation(info = "<html><head></head><body><p>Example displaying the pure rolling condition of the DryFriction model.</p></body></html>"));
end PureRollingTest;