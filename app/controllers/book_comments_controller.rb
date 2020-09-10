class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
      flash[:notice]="Book was successfully created"
      redirect_to book_path(@book)
    else
      @user = @book.user
      @newbook = Book.new
      render "books/show"
    end
  end

  def destroy
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      flash[:notice]="Comment was successfully destroyed."
      redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
