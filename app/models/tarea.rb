class Tarea < ActiveRecord::Base
    def vencida?
      if self.vencimiento < DateTime.now
         "vencida"
      else
         "vigente" 
      end
       
    end
end
