class TareaController < ApplicationController
    
    def index
       @tareas = Tarea.all
       @completas = Tarea.where(:completo => true).count
       @incompletas = Tarea.where(:completo => false).count
    end
    
    def new
        @tarea = Tarea.new
    end
    
    def create
       @tarea = Tarea.new(tarea_params)
       @tarea.completo = false
       @tarea.save
       redirect_to root_url, notice: "La tarea ha sido creada"        
    end

    def update
       tarea = Tarea.find(params[:id])
       if tarea.completo 
          tarea.completo = false
       else
          tarea.completo = true
       end

       tarea.save
       redirect_to root_url
    end

    def destroy
      @tarea =  Tarea.find(params[:id])
      @tarea.destroy
      redirect_to root_url, notice: "La tarea ha sido borrada"
    end

    private 
    
    def tarea_params

     params.require(:tarea).permit(:vencimiento,:nombre)
    end

end
