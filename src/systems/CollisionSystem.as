package systems {
	import components.VelocityComponent;
	import components.PositionComponent;
	import components.CollisionComponent;
	import components.DisplayComponent;
	/**
	 * @author berendweij
	 */
	public class CollisionSystem extends System {
		
		override public function update():void
		{
			var position : PositionComponent;
			var world	: Entity;
			
			for each( var target:Entity in targets )
			{
				if (target.get(VelocityComponent) && target.get(PositionComponent))
				{
					position = target.get(PositionComponent) as PositionComponent;
					world = (target.get(CollisionComponent) as CollisionComponent).world;
					
					// als de positie binnen de wereld valt dan zitten we in de grond. Dat willen we niet
					// dus: we moeten ons object met logica naar boven zetten
					if ( world.get(DisplayComponent).view.hitTestPoint(position.x, position.y, true) )
					{
						// we zetten de velocity op 0 aangezien we niet meer kunnen vallen
						target.get(VelocityComponent).velocityY = 0;
						while (world.get(DisplayComponent).view.hitTestPoint(position.x, position.y, true))
						{
							// we loopen net zo langs totdat we boven de grond staan
							position.y--;
						}
						
					}
					
				}
			}
		}
		
	}
}
