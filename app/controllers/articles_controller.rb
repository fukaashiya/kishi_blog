class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
        @articles = Article.all
    end
    
    def show
        
    end
    
    def new
        @article = Article.new
    end
    
    def edit
         
    end
    
    def create
     # render plain: params[:article].inspect
     # raise params.insepect
    @article = Article.new(article_params)
    
    if @article.save
        redirect_to article_path(@article)
    else
        render 'new'
    end
 end
 
    def update
        
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        
        @article.destroy
        redirect_to article_path
    end
    
    def article_params
        params.require(:article).permit(:title, :text)
    end
    
    def set_article
        @article = Article.find params[:id]
    end
end