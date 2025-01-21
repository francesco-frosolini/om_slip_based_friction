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
  Modelica.Blocks.Sources.Ramp ramp(height = 8, duration = 2, offset = 0, startTime = 1)  annotation(
    Placement(transformation(origin = {-88, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp1(height = -30, startTime = 12, duration = 3)  annotation(
    Placement(transformation(origin = {-88, -26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add annotation(
    Placement(transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Accelerate accelerate annotation(
    Placement(transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(wheel.contactPoint_a, dryFriction.contactPoint_b) annotation(
    Line(points = {{50, -16}, {50, -30}}, color = {0, 127, 0}));
  connect(wheel.flangeT, mass.flange_a) annotation(
    Line(points = {{70, 0}, {78, 0}}, color = {0, 127, 0}));
  connect(wheel.flangeR, inertia.flange_b) annotation(
    Line(points = {{30, 0}, {22, 0}}));
  connect(ramp.y, add.u1) annotation(
    Line(points = {{-76, 12}, {-66, 12}, {-66, 6}, {-58, 6}}, color = {0, 0, 127}));
  connect(ramp1.y, add.u2) annotation(
    Line(points = {{-76, -26}, {-68, -26}, {-68, -6}, {-58, -6}}, color = {0, 0, 127}));
  connect(accelerate.flange, inertia.flange_a) annotation(
    Line(points = {{-6, 0}, {2, 0}}));
  connect(add.y, accelerate.a_ref) annotation(
    Line(points = {{-34, 0}, {-28, 0}}, color = {0, 0, 127}));
  connect(wheel.flangeL, dryFriction.flange_b) annotation(
    Line(points = {{36, -14}, {34, -14}, {34, -46}}, color = {0, 127, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 18, Tolerance = 1e-06, Interval = 0.036),
  Documentation(info = "<html><head></head><body><p>Example displaying the pure rolling condition of the DryFriction model.</p></body></html>"));
end PureRollingTest;