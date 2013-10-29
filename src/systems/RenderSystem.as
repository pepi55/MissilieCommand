package systems {
	import components.DisplayComponent;
	import components.PositionComponent;
	/**
	 * ...
	 * @author Ik
	 */
	public class RenderSystem extends System {
		
		override public function update():void
		{
			for each( var target:Entity in targets )
			{
				if (target.get(DisplayComponent) && target.get(PositionComponent))
				{
					target.get(DisplayComponent).view.x			=	target.get(PositionComponent).x;
					target.get(DisplayComponent).view.y			=	target.get(PositionComponent).y;
					target.get(DisplayComponent).view.rotation	=	target.get(PositionComponent).rotation;
				}
			}
		}
		
	}
}
