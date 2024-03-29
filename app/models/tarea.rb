class Tarea < ActiveRecord::Base
   after_initialize :defaults
   def vencida?
      if self.vencimiento < DateTime.now
         "vencida"
      else
         "vigente" 
      end
       
   end

   def defaults
      self.vencimiento ||= DateTime.now + 1
      if self.nombre.blank? 
         self.nombre = "La tarea sin nombre :("
      end
   end
end
