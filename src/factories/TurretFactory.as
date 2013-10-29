package factories 
{
	import components.TurretControlComponent;
	import art.TurretArt;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.VelocityComponent;
	/**
	 * ...
	 * @author Ik
	 */
	public class TurretFactory 
	{	
		public static var TURRET:String = "turret";
		
		public var posY:Number;
		public var stageWidth:Number;
		public var turretControl:TurretControlComponent;
		
		public function TurretFactory() 
		{
			
		}
		
		public  function makeTurret(type : String) : Entity
		{
			if (type == TURRET) {
				var turretDisplay:DisplayComponent = new DisplayComponent();
				turretDisplay.view = new TurretArt();
			}
			
			var position:PositionComponent = new PositionComponent();
			position.x = stageWidth * Math.random();
			position.y = posY;
			
			var turret:Entity = new Entity();
			
			turret.add(turretDisplay);
			turret.add(position);
			turret.add(turretControl);
			
			return turret;
		}
		
	}

}