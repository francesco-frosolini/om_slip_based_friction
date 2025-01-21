within ABS;

model TiltingCar extends Translational.Interfaces.PartialTwoFlanges;
 
parameter SI.Mass m;

parameter SI.Length rearLength "Distance of the COM to the rear of the car";
parameter SI.Length frontLength "Distance of the COM to the front of the car";
parameter SI.Length height "height of the COM";

Modelica.Blocks.Interfaces.RealOutput rearLoad annotation(
    Placement(transformation(origin = {-42, -80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealOutput frontLoad annotation(
    Placement(transformation(origin = {36, -80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

SI.Position sCOM "Position of the center of mass of the car." annotation (Dialog(group="Initialization", showStartAttribute=true)); //The flanges are displaced from this position by the rearLength and frontLength parameters' values." 
SI.Velocity v "Velocity of the center of mass" annotation (Dialog(group="Initialization", showStartAttribute=true));
SI.Acceleration a;
SI.Force rearForce;
SI.Force frontForce;

equation
flange_a.s=sCOM-rearLength;
flange_b.s=sCOM+frontLength;
v=der(sCOM);
a=der(v);

flange_b.f-flange_a.f=m*a;
m*g=rearForce+frontForce;
-frontForce*frontLength+rearForce*rearLength-m*a*height=0;

rearLoad=rearForce;
frontLoad=frontForce;


annotation(
    Icon(graphics = {Line(origin = {0.01, 10}, points = {{29.9922, -19.9961}, {31.9922, -13.9961}, {39.9922, -11.9961}, {45.9922, -15.9961}, {45.9922, -21.9961}, {49.9922, -21.9961}, {47.9922, -13.9961}, {39.9922, -5.99614}, {29.9922, -1.99614}, {23.9922, 14.0039}, {-40.0078, 22.0039}, {-50.0078, -9.99614}, {-44.0078, -11.9961}, {-42.0078, -7.99614}, {-34.0078, -5.99614}, {-28.0078, -9.99614}, {-28.0078, -15.9961}, {29.9922, -19.9961}, {29.9922, -19.9961}}, thickness = 0.5), Ellipse(origin = {0, 8}, extent = {{-6, -6}, {6, 6}}), Line(origin = {0, 8}, points = {{0, 6}, {0, -6}}, thickness = 0), Line(origin = {0, 8}, points = {{-6, 0}, {6, 0}}, thickness = 0.5)}));
end TiltingCar;