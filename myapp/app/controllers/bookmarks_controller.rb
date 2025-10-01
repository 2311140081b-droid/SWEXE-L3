class BookmarksController < ApplicationController
  def index
	@bookmarks = Bookmark.all
  end
  def new
  	@bookmark = Bookmark.new  #formヘルパーのデータの入れ物になる
  end
  def create
	@bookmark = Bookmark.new(title: params[:bookmark][:title],author: params[:bookmark][:author], url: params[:bookmark][:url])
	if @bookmark.save
		flash[:notice] = '1レコード追加しました'
  		redirect_to '/' #=>一覧ページにリダイレクトする
  	else 
		render 'new',status: :unprocessable_entity
	end
  end
  def destroy
	@bookmark = Bookmark.find(params[:id])
  	@bookmark.destroy
	flash[:notice] = '1レコード削除しました'
  	redirect_to '/'
  end
  def show
  	@bookmark = Bookmark.find(params[:id])
  end
  def update
  	@bookmark = Bookmark.find(params[:id])
  	if @bookmark.update(title: params[:bookmark][:title], author: params[:bookmark][:author], url: params[:bookmark][:url])
  		flash[:notice] = '1レコード更新しました'
		redirect_to '/'
  	else 
		render 'new', status: :unprocessable_entity
	end
  end
  def edit
  	@bookmark = Bookmark.find(params[:id])
  end
end
