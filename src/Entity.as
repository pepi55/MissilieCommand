package {
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Ik
	 */
	public class Entity {
		private var _components :	Dictionary;
		
		public function Entity() : void
		{
			_components	=	new Dictionary();
		}
		
		public function add( component:Object ):void
		{
			var componentClass : Class = component.constructor as Class;
			_components[ componentClass ] = component;
		}
		  
		public function remove( componentClass:Class ):void
		{
			var index	: int = _components.indexOf(componentClass);
			if (index > -1)
			{
				_components.splice(index, 1);
			}
		 }
		  
		 public function get( componentClass:Class ):Object
		 {
			return _components[ componentClass ];
		 }
	}
}
