class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  
  def create
     # render plain: params[:article].inspect
     @article = Article.new(article_params)
     
     if @article.save
        flash[:notice] = "Article saved successfully !"
        redirect_to article_path(@article)
     else
        render 'new'
     end
  end 
  
  #Private method parsing the article_param and taking out the title and description of the given article object.
  private
  def article_params
     params.require(:article).permit(:title , :description)
  end
  
  private 
  def article_show
    @article = Article.find(params[:id])
  end
  
end