class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
    else
      render action: 'new' 
    end
    # render plain: params[:article].inspect  
  end

  private  # Ниже будут храниться спрятанные (privat) методы, которые могут быть вызваны только из методов выше. Эти спрятанные методы не доступны извне. Это в том числе сделано для безопасности. 

  def article_params
    params.require(:article).permit(:title, :text)
    # параметры.требуется(:контакт).разрешать(:электронную почту, :сообщение)
  end

end
