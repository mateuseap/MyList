class TarefasController < ApplicationController
    before_action :set_usuario
    before_action :set_tarefa, except: [:create]

    def create
        @tarefa = @usuario.tarefas.create(tarefa_params)
        redirect_to @usuario
    end

    def update
        @tarefa = @usuario.tarefas.find(params[:id])
        if @tarefa.update(tarefa_params)
            flash[:success] = "Tarefa atualizada com sucesso."
        else
            flash[:error] = "Essa tarefa não pôde ser atualizada"
        end
        redirect_to @usuario
    end

    def destroy
        @tarefa = @usuario.tarefas.find(params[:id])
        if @tarefa.destroy
         flash[:success] = "Tarefa deletada com sucesso."
        else
         flash[:error] = "Essa tarefa não pôde ser deletada."
        end
        redirect_to @usuario 
    end

    def finalizada
        if @tarefa.finalizada
            @tarefa.update_attribute(:finalizada, false)
            redirect_to @usuario, notice: "A tarefa não foi finalizada"
        else
            @tarefa.update_attribute(:finalizada, true)
            redirect_to @usuario, notice: "A tarefa foi finalizada"
        end
    end
    
    private

    def set_usuario
        @usuario = Usuario.find(params[:usuario_id])
    end

    def set_tarefa
        @tarefa = @usuario.tarefas.find(params[:id])
    end

    def tarefa_params
        params[:tarefa].permit(:usuario_id, :nome, :descricao, :finalizada)  
    end
end
