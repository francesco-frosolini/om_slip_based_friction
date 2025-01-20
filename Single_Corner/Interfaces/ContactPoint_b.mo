within ABS.Single_Corner.Interfaces;

connector ContactPoint_b "Contact point belonging to the ground"
  extends ABS.Single_Corner.Interfaces.ContactPoint;
  annotation(
    Icon(graphics = {Rectangle(origin = {20, 20}, lineColor = {0, 127, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{80, -20}, {-80, 20}}), Line(origin = {0, 100.08}, points = {{-100, 0}, {100, 0}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20)}),
    Diagram(graphics = {Text(origin = {20, -10}, extent = {{-80, 10}, {80, -10}}, textString = "%name"), Rectangle(origin = {20, 20}, lineColor = {0, 127, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{80, -20}, {-80, 20}}), Line(origin = {0, 100.08}, points = {{-100, 0}, {100, 0}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20)}));
end ContactPoint_b;