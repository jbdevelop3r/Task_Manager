class TasksController < ApplicationController
    def create
        @category = Category.find(params[:category_id])
        @comment = @category.tasks.create(task_params)
        redirect_to category_path(@category)
    end

    def edit
        @task = Task.find(params[:id])
      end
    
      def update
        @task = Task.find(params[:id])
    
        if @task.update(task_params)
          redirect_to @category, alert: "task has been updated"
        else
          render :edit, status: :unprocessable_entity
        end
      end

    def destroy
        @category = Category.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_path(@category), status: :see_other
      end
     
    private

    def task_params
          params.require(:task).permit(:task)
    end
end
