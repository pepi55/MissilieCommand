package systems {
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.TurretControlComponent;
	import systems.System;

	/**
	 * @author pepi
	 */
	public class TurretControlSystem extends System {
		override public function update():void {
			var xdiff:Number;
			var ydiff:Number;
			var radians:Number = Math.atan2(ydiff, xdiff);
			var degrees:Number = radians * 180 /Math.PI;
			var position:PositionComponent;
			var display:DisplayComponent;
			
			for each (var target:Entity in targets) {
				if (target.get(TurretControlComponent) && target.get(PositionComponent) && target.get(DisplayComponent)) {
					display = target.get(DisplayComponent) as DisplayComponent;
					position = target.get(PositionComponent) as PositionComponent;
					
					xdiff = (display.view.mouseX - position.x);
					ydiff = (display.view.mouseY - position.y);
					
					position.rotation = degrees;
				}
			}
		}
	}
}
