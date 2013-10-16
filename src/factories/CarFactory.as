package factories 
{
	import components.TurretControlComponent;
	import art.TurretArt;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.VelocityComponent;
	/**
	 * ...
	 * @author Berend Weij
	 */
	public class CarFactory 
	{	
		public static var SPORTSCAR	:	String	=	"sportsCar";
		public static var TURRET	:	String	=	"turret";
		
		public var posY				:	Number;
		public var stageWidth		: 	Number;
		
		public function CarFactory() 
		{
			
		}
		
		public  function makeCar(type : String) : Entity
		{
			
			// we maken de componenten aan. Hier kan het systeem zijn 'data' in opslaan
			// met data kunnen we waardes opslaan (positie, rotatie, etc.)
			if (type == SPORTSCAR)
			{
				var carDisplay	:	DisplayComponent		=	new DisplayComponent();
				carDisplay.view								=	new CarImage();
			} else if (type == TURRET) {
				var turretDisplay :	DisplayComponent		=	new DisplayComponent();
				turretDisplay.view							=	new	TurretArt();
			}
			
			var position : PositionComponent = new PositionComponent();
			position.x 								=	stageWidth * Math.random();
			position.y								=	posY;
			
			// als laatste maken we onze entity aan
			// de entity bestaat uit componenten.
			var turret	:	Entity					=	new Entity();
			
			// we voegen de componenten toe aan de entity car
			// hiermee bepalen we het gedrag van deze entity
			//car.add(carDisplay);
			//car.add(position);
			//car.add(velocity);
			turret.add(turretDisplay);
			turret.add(position);
			turret.add(TurretControlComponent);
			
			return turret;
		}
		
	}

}