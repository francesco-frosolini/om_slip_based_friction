within ABS.Single_Corner.Interfaces;

connector ContactPoint "One dimensional contact point between two rolling surfaces"
  flow Real ux "Friction coefficient";
  Real slip(min=-1,max=1) "Normalized slipping speed (=body speed - ground speed) of the contact point, positive when accelerating, negative when braking.";
end ContactPoint;

