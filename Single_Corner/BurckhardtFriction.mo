within ABS.Single_Corner;

model BurckhardtFriction
  extends Interfaces.PartialGroundLongitudinalFriction;
  import ABS.Single_Corner.RoadTypes.RoadType;

  parameter RoadType roadType = RoadType.wetAsphalt;
  final parameter Real theta[3] = RoadTypes.roadData[roadType];
equation
  ux = sign(slip)*theta[1]*(1-exp(-theta[2]*abs(slip)))-slip*theta[3];
    
annotation(
    Icon(graphics = {Line(origin = {30, 20}, points = {{-30, -20}, {-25, 22}, {-7, 6}, {30, -2}}, thickness = 0.75, smooth = Smooth.Bezier), Line(origin = {-30, -20}, points = {{30, 20}, {25, -22}, {7, -6}, {-30, 2}}, thickness = 1, smooth = Smooth.Bezier)}),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px; font-family: 'DejaVu Sans Mono';\">Friction force component using one flange for vertical load and a contact point connector for longitudinal friction force. The sign conventions utilized are denoted in the icon layer.</span><div><font face=\"DejaVu Sans Mono\"><br></font><div><div><font face=\"DejaVu Sans Mono\">It's assumed that the rolling body and the ground stay in contact (flange_b.s=0) and that the relationship between longitudinal friction and vertical load stays linear (fx=-ux*fz).</font></div></div><div><font face=\"DejaVu Sans Mono\"><br></font></div><div><div><font face=\"DejaVu Sans Mono\">The Burckhardt friction curve model is implemented, the curve is defined symmetrically in the first and third quadrants. The 3 theta parameters for the curve are set by an additional parameter of enumeration type RoadType.</font></div></div></div></body></html>"));
end BurckhardtFriction;