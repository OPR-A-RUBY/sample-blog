class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :update, :destroy] 

  def index
    @article = Article.all 
  end

  def show
    @article = Article.find(params[:id]) 
  end

  def new
  end

  def create

    @article = Article.new(article_params)  # Создаёт экземпляр сущности Article
                                            # Данные получаем из формы, причём: разрешаем их для использования в процедуре article_params см. ниже в спрятанном разделе кода (после private).

    # Специальную проверку валидности можно не делать, т.к. .save делает валидацию "автоматом". 
    if @article.valid?                      # Если данные валидны, то 
      @article.save                         # .. записать данные в БД и ..
      redirect_to @article                  # .. перенаправить на ID (=11) из @article т.е.
                                            # /articles/11/
    else                    # ... иначе 
      render action: 'new'  # "ОТРИСОВАТЬ" акцию new, т.е. /articles/new/ и вывести соеуе представление /app/view/new.html.erb   Без rendera браузер автоматом происходит переход на своё представление /app/view/create.html.erb которого к стати, здесь нет, т.к. мы на него не уходим.
    end
    # !!ВАЖНО!! - представление create.html.erb - не понадобится, т.к. оно не вызывается в этом методе. В результате выполнения будет вызвано одно из вышеописанных представлений. 

    # render plain: params[:article].inspect # Это строка для отладки  
  end

  def edit
    @article = Article.find(params[:id])  # берём только ту статью, которую будем РЕДАКТИРОВАТЬ. Причём id статьи возьмём из адреса, который сформировала ссылка 'Edit' на странице index .

  end

  def update
    @article = Article.find(params[:id])  # берём только ту статью, которую будем ОБНОВЛЯТЬ. Причём id статьи возьмём из ракаметра, переданного из формы /articles/11/edit' 

    if @article.update(article_params)      # Функция update выполняет валидацию, как и save 
      redirect_to @article                  # .. перенаправить на ID (=11) из @article т.е.
                                            # /articles/11/
    else                     # ... иначе 
      render action: 'edit'  # "ОТРИСОВАТЬ" акцию edit, т.е. /articles/11/edit/ и вывести соеуе представление /app/view/edit.html.erb  Без rendera браузер происходит переход на своё представление /app/view/update.html.erb которого к стати, здесь нет, т.к. мы на него не уходим. 
    end
  end

  def destroy
    @art = Article.find(params[:id])  # Выбираем сущность по id
    @art.destroy                      # Удаляем выбранную сущность
    redirect_to articles_path         # Перенаправить на список статей или вместо этого можно сделать представление view с именем destroy.html.erb, которое будет говорить "спасибо" или позволять выполнить переход куда либо по кнопке или ссылке.
  end

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  private  # Ниже будут храниться спрятанные (privat) методы, которые могут быть вызваны только из методов выше. Эти спрятанные методы не доступны извне. Это в том числе сделано для безопасности. 

  def article_params
    params.require(:article).permit(:title, :text)
    # параметры.требуется(:контакт).разрешать(:электронную почту, :сообщение)
  end

end
