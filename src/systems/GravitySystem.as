package systems {
	import components.VelocityComponent;
	import components.PositionComponent;
	import components.DisplayComponent;
	/**
	 * ...
	 * @author Ik
	 */
	public class GravitySystem extends System {
		
		public static const GRAVITY : Number = 1;
		
		override public function update():void
		{
			for each( var target:Entity in targets )
			{
				// aangezien we door alle targets heen loopen moeten we ook kijken of deze target wel de components
				// die wij nodig hebben
				if (target.get(VelocityComponent))
				{
					target.get(VelocityComponent).velocityY += GRAVITY;
				}
			}
		}
		
	}
}
