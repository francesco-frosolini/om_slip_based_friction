within ABS.Single_Corner;

model BurckhardtFriction
  extends Interfaces.PartialSlipFriction;
  parameter Real theta[3] = {0.86, 33.82, 0.35} "parameters for the Burckhardt curve, default is wet asphalt";
  //how can I implement a dictionary?
equation
  ux = -sign(slip)*theta[1]*(1-exp(-theta[2]*abs(slip)))+slip*theta[3];
    
annotation(
    Icon(graphics = {Line(origin = {7.1, 2.7}, points = {{-47.0956, -28.7042}, {-33.0956, 27.2958}, {-7.09555, -8.7042}, {44.9044, -28.7042}}, smooth = Smooth.Bezier), Line(origin = {-40, -1}, points = {{0, -29}, {0, 29}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 4), Line(origin = {9, -26}, points = {{-53, 0}, {53, 0}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 4), Text(origin = {-51, 21}, extent = {{-7, 7}, {7, -7}}, textString = "ux"), Text(origin = {46, -34}, extent = {{-18, 6}, {18, -6}}, textString = "slip")}));
end BurckhardtFriction;
