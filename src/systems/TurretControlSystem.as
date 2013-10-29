package systems {
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.TurretControlComponent;
	/**
	 * ...
	 * @author Ik
	 */
	public class TurretControlSystem extends System {
		override public function update():void {
			var xdiff:Number;
			var ydiff:Number;
			var radians:Number;
			var degrees:Number;
			var position:PositionComponent;
			var display:DisplayComponent;
			var turret:TurretControlComponent;
			
			for each (var target:Entity in targets) {
				if (target.get(TurretControlComponent) && target.get(PositionComponent) && target.get(DisplayComponent)) {
					display = target.get(DisplayComponent) as DisplayComponent;
					position = target.get(PositionComponent) as PositionComponent;
					turret = target.get(TurretControlComponent) as TurretControlComponent;
					
					xdiff = (position.x - turret.mousePos.mouseX);
					ydiff = (position.y - turret.mousePos.mouseY);
					radians = Math.atan2(ydiff, xdiff);
					degrees = radians * 180 / Math.PI;
					
					position.rotation = degrees;
				}
			}
		}
	}
}
