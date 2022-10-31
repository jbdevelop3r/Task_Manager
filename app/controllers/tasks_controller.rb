class TasksController < ApplicationController

    before_action :set_category, only: [ :create, :edit, :update, :destroy, :new, :show ]

    def create
      @task = @category.tasks.create(task_params)
      redirect_to category_path(@category), notice: "A task has been created."
    end

    def due_today
      @due_today = current_user.tasks.where('deadline = ?', Date.current)
    end

    def overdue
      @overdue = current_user.tasks.where('deadline < ?', Date.current)
    end

    def futuretask
      @futuretask = current_user.tasks.where('deadline > ?', Date.current)
    end
    
    def new 
      @task = @category.tasks.build
    end

    def show 
      @task = @category.tasks.find(params[:id])
    end

    def edit
      @task = @category.tasks.find(params[:id])
    end
    
    def update
      @task = @category.tasks.find(params[:id])
    
      if @task.update(task_params)
        redirect_to @category, notice: "A task has been updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_path(@category), status: :see_other, notice: "A task has been deleted."
      end
     
    private

    def set_category
      @category = current_user.categories.find(params[:category_id])
    end
    
    def task_params
          params.require(:task).permit(:task, :details, :deadline, )
    end
end
