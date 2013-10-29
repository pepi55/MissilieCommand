package systems {
	import components.VelocityComponent;
	import components.PositionComponent;
	import components.DisplayComponent;
	/**
	 * ...
	 * @author Ik
	 */
	public class MovementSystem extends System {
		
		override public function update():void
		{
			for each( var target:Entity in targets )
			{
				if (target.get(PositionComponent) && target.get(VelocityComponent))
				{
					if(target.get(PositionComponent).x < 15)
					{
						target.get(VelocityComponent).velocityX	= Math.abs(target.get(VelocityComponent).velocityX);
					}
					else if(target.get(PositionComponent).x > 700)
					{
						target.get(VelocityComponent).velocityX	= -Math.abs(target.get(VelocityComponent).velocityX); 
					}
					
					if(target.get(VelocityComponent).velocityX > 0)
					{
						target.get(DisplayComponent).view.scaleX	=	1;
					}
					else
					{
						target.get(DisplayComponent).view.scaleX	=	-1;
					}
					
					target.get(PositionComponent).x			+=	target.get(VelocityComponent).velocityX;
					target.get(PositionComponent).y 		+=	target.get(VelocityComponent).velocityY;
					target.get(PositionComponent).rotation	+=	target.get(VelocityComponent).angularVelocity;
				}
			}
		}
		
	}
}
