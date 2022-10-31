class CategoriesController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @categories = current_user.categories
    @tasks = current_user.tasks
    # @category_tasks = current_user.categories.tasks
    @due_today = current_user.tasks.where('deadline = ?', Date.current)
    @overdue = current_user.tasks.where('deadline < ?', Date.current)
    @futuretask = current_user.tasks.where('deadline > ?', Date.current)
  end
  
  def show 
    @category = current_user.categories.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: "A category has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category, notice: "A category has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to root_path, status: :see_other, notice: "A category has been deleted."
  end


  private

  
  def category_params
    params.require(:category).permit(:title)
  end

end
