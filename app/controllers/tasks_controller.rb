class TasksController < ApplicationController
    def create
        @category = Category.find(params[:category_id])
        @comment = @category.tasks.create(task_params)
        redirect_to category_path(@category)
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
