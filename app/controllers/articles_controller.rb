class ArticlesController < ApplicationController

  def new
  end

  def create

    @article = Article.new(article_params)  # Создаёт экземпляр сущности Article
                                            # Данные получаем из формы, причём: разрешаем их для использования в процедуре article_params см. ниже в спрятанном разделе кода (после private).

    if @article.valid?                      # Если данные валидны, то 
      @article.save                         # .. записать данные в БД и ..
      redirect_to @article                  # .. перенаправить на ID (=11) из @article т.е.
                                            # /articles/11/
    else                    # ... иначе 
      render action: 'new'  # перенаправить на акцию new, т.е. /articles/new/
    end
    # !!ВАЖНО!! - представление create.html.erb - не понадобится, т.к. оно не вызывается в этом методе. В результате выполнения будет вызвано одно из вышеописанных представлений.

    # render plain: params[:article].inspect # Этоя для отладки  
  end

  private  # Ниже будут храниться спрятанные (privat) методы, которые могут быть вызваны только из методов выше. Эти спрятанные методы не доступны извне. Это в том числе сделано для безопасности. 

  def article_params
    params.require(:article).permit(:title, :text)
    # параметры.требуется(:контакт).разрешать(:электронную почту, :сообщение)
  end

end
