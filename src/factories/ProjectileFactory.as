package factories 
{
	import art.MissileArt;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.VelocityComponent;
	/**
	 * ...
	 * @author ik
	 */
	public class ProjectileFactory 
	{
		public static var MISSILE:String = "missile";
		
		public var stageWidth:Number;
		public var stageHeight:Number;
		
		public function ProjectileFactory() 
		{
			
		}
		
		public function spawnEnemyMissile(type:String):Entity
		{
			if (type == MISSILE)
			{
				var missileDisplay:DisplayComponent = new DisplayComponent();
				var velocity:VelocityComponent = new VelocityComponent();
				
				velocity.velocityY = -5;
				missileDisplay.view = new MissileArt();
			}
			
			var pos:PositionComponent = new PositionComponent();
			var missile:Entity = new Entity();
			
			pos.x = stageWidth * Math.random();
			pos.y = -missileDisplay.view.height;
			
			missile.add(missileDisplay);
			missile.add(pos);
			missile.add(velocity);
			
			return missile;
		}
	}

}