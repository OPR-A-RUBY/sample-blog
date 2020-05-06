class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  # Для создания коментария нам понадобиться один метод - create
  # ... т.к. сама форма будет формироваться на странице самой статьи
  def create
    # Запоминаем в переменную выбранную статью. Статью выбираем по параметру :artticle_id который мы можем увидеть в терминале по команде # rake routes 
    # POST   /articles/:article_id/comments(.:format)  comments#create
    @art = Article.find(params[:article_id])
  # @art = Article.find(15) - так было в консоли - выбирали 15-ю статью

    # Далее вносим коментарий к статье в базу данных 
    @art.comments.create(comment_params)  # параметры через приват-зону
  # @art.comments.create({ autor: 'Mike', body: 'Hello. You article is good!' }) - из консоли

    redirect_to article_path(@art) 
  end

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  private  # Ниже будут храниться спрятанные (privat) методы, которые могут быть вызваны только из методов выше. Эти спрятанные методы не доступны извне. Это в том числе сделано для безопасности. 

  def comment_params
    params.require(:comment).permit(:autor, :body)
    # параметры.требуется(:коментарий).разрешать(:автора_коментария, :тело_коментария)
  end

end
