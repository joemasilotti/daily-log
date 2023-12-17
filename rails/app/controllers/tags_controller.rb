class TagsController < ApplicationController
  def index
    @tags = current_user.tags
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, notice: "Added #{@tag.name}"
    else
      render :new
    end
  end

  def edit
    @tag = current_user.tags.find(params[:id])
  end

  def update
    @tag = current_user.tags.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "Updated #{@tag.name}"
    else
      render :edit
    end
  end

  def destroy
    tag = current_user.tags.find(params[:id])
    tag.destroy
    redirect_to tags_path, notice: "Deleted #{tag.name}"
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :description)
      .merge(user: current_user)
  end
end
