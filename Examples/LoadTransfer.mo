within ABS.Examples;

model LoadTransfer
  extends Modelica.Icons.Example;
  
  parameter SI.Velocity v0=20;
  parameter SI.Length wheelR=0.3;
  
  FourCornersWithLoads fourCornersWithLoads(wheelMass = 10, wheelInertia = 1, road = ABS.Single_Corner.RoadTypes.RoadType.wetAsphalt, wheelRadius = wheelR)  annotation(
    Placement(transformation(origin = {20, 0}, extent = {{-40, -40}, {40, 40}})));
  TiltingCar tiltingCar(m = 1500, rearLength = 2.5, frontLength = 2, height = 0.5, v(start = v0, fixed = true), sCOM(start = 0, fixed = true))  annotation(
    Placement(transformation(origin = {22, 38}, extent = {{-40, -40}, {40, 40}})));
  Modelica.Mechanics.Rotational.Components.Inertia motorInertia(w(fixed = false), J = 0.01)  annotation(
    Placement(transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(offset = v0/wheelR, startTime = 1, height = -v0/wheelR, duration = 6)  annotation(
    Placement(transformation(origin = {-104, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce aereoDrag(f_nominal = -60, v_nominal = 30)  annotation(
    Placement(transformation(origin = {106, 38}, extent = {{16, -16}, {-16, 16}})));
equation
  connect(fourCornersWithLoads.flangeT, tiltingCar.flange_a) annotation(
    Line(points = {{59.2, 0}, {81.2, 0}, {81.2, 66}, {-18.8, 66}, {-18.8, 38}}, color = {0, 127, 0}));
  connect(tiltingCar.rearLoad, fourCornersWithLoads.rearLoad) annotation(
    Line(points = {{6, 26}, {6, 14}}, color = {0, 0, 127}));
  connect(tiltingCar.frontLoad, fourCornersWithLoads.frontLoad) annotation(
    Line(points = {{38, 26}, {38, 14}}, color = {0, 0, 127}));
  connect(motorInertia.flange_b, fourCornersWithLoads.flangeR) annotation(
    Line(points = {{-30, 0}, {-20, 0}}));
  connect(speed.flange, motorInertia.flange_a) annotation(
    Line(points = {{-60, 0}, {-50, 0}}));
  connect(speed.w_ref, ramp.y) annotation(
    Line(points = {{-82, 0}, {-92, 0}}, color = {0, 0, 127}));
  connect(aereoDrag.flange, tiltingCar.flange_b) annotation(
    Line(points = {{90, 38}, {62, 38}}, color = {0, 127, 0}));

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end LoadTransfer;