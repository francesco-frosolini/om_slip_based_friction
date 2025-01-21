package ABS
  extends Modelica.Icons.Package;
  import Modelica.Units.SI;
  import Modelica.Mechanics.Rotational;
  import Modelica.Mechanics.Translational;
  constant Modelica.Units.SI.Acceleration g = 9.81 "gravitational acceleration constant";

  
  annotation(
    uses(Modelica(version = "4.0.0")),
  Documentation(info = "<html><head></head><body><div>Simple OpenModelica library which simulates longitudinal slip and braking/accelerating forces of a single corner model and controls it with ABS.</div><div><br></div></body></html>"));
end ABS;