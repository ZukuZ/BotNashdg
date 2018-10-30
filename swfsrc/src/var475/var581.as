package var475
{
   public class var581 extends Object
   {
      
      public function var581(param1:Object)
      {
         super();
         if(param1.hp != null)
         {
            this.hp = param1.hp;
         }
         if(param1.rage != null)
         {
            this.rage = param1.rage;
         }
         if(param1.use_skills != null)
         {
            this.use_skills = param1.use_skills;
         }
      }
      
      public var hp:int = 0;
      
      public var rage:int = 0;
      
      public var use_skills:Array;
   }
}
