class TasksController < ApplicationController
    def create
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.create(task_params)
        redirect_to category_path(@category)
    end

    def show 
      @category = current_user.categories.find(params[:category_id])
      @task = @category.tasks.find(params[:id])
    end

    def edit
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
    end
    
    def update
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
    
      if @task.update(task_params)
        redirect_to @category, alert: "Task has been updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_path(@category), status: :see_other
      end
     
    private

    def task_params
          params.require(:task).permit(:task, :details, :deadline)
    end
end
